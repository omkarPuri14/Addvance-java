package com.orders.service;

import org.springframework.stereotype.Service;

import com.orders.dto.*;
import com.orders.entity.CustomerOrder;
import com.orders.repository.OrderRepository;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class OrderService {

    private static final String PLACED = "Placed";
    private static final String SHIPPED = "Shipped";
    private static final String DELIVERED = "Delivered";
    private static final String CANCELLED = "Cancelled";

    private static final Map<String, String> ALLOWED_TRANSITIONS = Map.of(
            PLACED, SHIPPED,
            SHIPPED, DELIVERED
    );

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    private BigDecimal grossAmount(CustomerOrder order) {
        return BigDecimal.valueOf(order.getPricePerUnit())
                .multiply(BigDecimal.valueOf(order.getQuantity()));
    }

    private BigDecimal discountAmount(BigDecimal gross, CustomerOrder order) {
        return gross.multiply(BigDecimal.valueOf(order.getDiscountPercent()))
                .divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
    }

    public CreateOrderResponse createOrder(OrderRequest request) {
        CustomerOrder order = new CustomerOrder();
        order.setCustomerName(request.getCustomerName());
        order.setProductName(request.getProductName());
        order.setCategory(request.getCategory());
        order.setQuantity(request.getQuantity());
        order.setPricePerUnit(request.getPricePerUnit());
        order.setDiscountPercent(request.getDiscountPercent());
        order.setPaymentMode(request.getPaymentMode());

        if (request.getOrderStatus() == null || request.getOrderStatus().isBlank()) {
            order.setOrderStatus(PLACED);
        } else {
            order.setOrderStatus(request.getOrderStatus());
        }

        CustomerOrder saved = orderRepository.save(order);

        BigDecimal gross = grossAmount(saved).setScale(2, RoundingMode.HALF_UP);
        BigDecimal discount = discountAmount(gross, saved);
        BigDecimal finalAmount = gross.subtract(discount).setScale(2, RoundingMode.HALF_UP);

        return new CreateOrderResponse(
                "Order placed successfully",
                saved.getOrderId(),
                saved.getCustomerName(),
                gross,
                discount,
                finalAmount
        );
    }

    public List<OrderAboveAmountResponse> getOrdersAboveAmount(BigDecimal amount) {
        List<CustomerOrder> allOrders = orderRepository.findAll();
        List<OrderAboveAmountResponse> result = new ArrayList<>();

        for (CustomerOrder order : allOrders) {
            BigDecimal gross = grossAmount(order).setScale(2, RoundingMode.HALF_UP);
            BigDecimal discount = discountAmount(gross, order);
            BigDecimal finalAmount = gross.subtract(discount).setScale(2, RoundingMode.HALF_UP);

            if (finalAmount.compareTo(amount) > 0) {
                result.add(new OrderAboveAmountResponse(
                        order.getOrderId(),
                        order.getCustomerName(),
                        order.getProductName(),
                        order.getQuantity(),
                        gross,
                        discount,
                        finalAmount
                ));
            }
        }
        return result;
    }

    private boolean isValidTransition(String current, String requested) {
        if (PLACED.equalsIgnoreCase(current) && CANCELLED.equalsIgnoreCase(requested)) {
            return true;
        }
        String allowedNext = ALLOWED_TRANSITIONS.get(current);
        return allowedNext != null && allowedNext.equalsIgnoreCase(requested);
    }

    public Object updateStatus(Long orderId, String requestedStatus) {
        CustomerOrder order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found with id: " + orderId));

        String currentStatus = order.getOrderStatus();

        if (!isValidTransition(currentStatus, requestedStatus)) {
            return new InvalidTransitionResponse(
                    "Invalid order status transition",
                    currentStatus,
                    requestedStatus
            );
        }

        order.setOrderStatus(requestedStatus);
        orderRepository.save(order);

        return new StatusUpdateResponse(
                "Order status updated successfully",
                order.getOrderId(),
                currentStatus,
                requestedStatus
        );
    }

    public CategorySummaryResponse getCategorySummary(String category) {
        List<CustomerOrder> orders = orderRepository.findByCategoryIgnoreCase(category);

        long totalOrders = orders.size();
        long delivered = 0;
        long placed = 0;
        long cancelled = 0;
        long totalQuantity = 0;
        BigDecimal totalRevenue = BigDecimal.ZERO;
        BigDecimal highestValue = BigDecimal.ZERO;
        String highestValueCustomer = null;

        for (CustomerOrder order : orders) {
            totalQuantity += order.getQuantity();
            String status = order.getOrderStatus();

            if (DELIVERED.equalsIgnoreCase(status)) {
                delivered++;
            } else if (PLACED.equalsIgnoreCase(status)) {
                placed++;
            } else if (CANCELLED.equalsIgnoreCase(status)) {
                cancelled++;
            }

            if (!CANCELLED.equalsIgnoreCase(status)) {
                BigDecimal gross = grossAmount(order).setScale(2, RoundingMode.HALF_UP);
                BigDecimal discount = discountAmount(gross, order);
                BigDecimal finalAmount = gross.subtract(discount).setScale(2, RoundingMode.HALF_UP);

                totalRevenue = totalRevenue.add(finalAmount);

                if (finalAmount.compareTo(highestValue) > 0) {
                    highestValue = finalAmount;
                    highestValueCustomer = order.getCustomerName();
                }
            }
        }

        return new CategorySummaryResponse(
                category,
                totalOrders,
                delivered,
                placed,
                cancelled,
                totalQuantity,
                totalRevenue.setScale(2, RoundingMode.HALF_UP),
                highestValue.setScale(2, RoundingMode.HALF_UP),
                highestValueCustomer
        );
    }
}
