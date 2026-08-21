package com.orders.controller;

import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.orders.dto.*;
import com.orders.service.OrderService;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public ResponseEntity<CreateOrderResponse> createOrder(@Valid @RequestBody OrderRequest request) {
        CreateOrderResponse response = orderService.createOrder(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping("/above/{amount}")
    public ResponseEntity<List<OrderAboveAmountResponse>> getOrdersAboveAmount(@PathVariable BigDecimal amount) {
        return ResponseEntity.ok(orderService.getOrdersAboveAmount(amount));
    }

    @PutMapping("/{orderId}/status")
    public ResponseEntity<?> updateOrderStatus(@PathVariable Long orderId,
                                                @Valid @RequestBody StatusUpdateRequest request) {
        try {
            Object result = orderService.updateStatus(orderId, request.getStatus());

            if (result instanceof InvalidTransitionResponse) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
            }
            return ResponseEntity.ok(result);

        } catch (RuntimeException e) {
            Map<String, String> error = new HashMap<>();
            error.put("message", e.getMessage());
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(error);
        }
    }

    @GetMapping("/summary/{category}")
    public ResponseEntity<CategorySummaryResponse> getCategorySummary(@PathVariable String category) {
        return ResponseEntity.ok(orderService.getCategorySummary(category));
    }
}
