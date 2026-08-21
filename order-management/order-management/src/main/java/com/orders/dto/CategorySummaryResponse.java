package com.orders.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategorySummaryResponse {
    private String category;
    private long totalOrders;
    private long deliveredOrders;
    private long placedOrders;
    private long cancelledOrders;
    private long totalQuantity;
    private BigDecimal totalRevenue;
    private BigDecimal highestValueOrder;
    private String highestValueCustomer;
}
