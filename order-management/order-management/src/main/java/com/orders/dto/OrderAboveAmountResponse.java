package com.orders.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderAboveAmountResponse {
    private Long orderId;
    private String customerName;
    private String productName;
    private Integer quantity;
    private BigDecimal grossAmount;
    private BigDecimal discountAmount;
    private BigDecimal finalAmount;
}
