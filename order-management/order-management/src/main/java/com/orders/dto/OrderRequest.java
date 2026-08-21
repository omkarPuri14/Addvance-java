package com.orders.dto;

import jakarta.validation.constraints.*;
import lombok.Data;

@Data
public class OrderRequest {

    @NotBlank(message = "Customer name cannot be empty")
    private String customerName;

    @NotBlank(message = "productName is required")
    private String productName;

    @NotBlank(message = "category is required")
    private String category;

    @NotNull(message = "quantity is required")
    @Min(value = 1, message = "Quantity must be greater than 0")
    private Integer quantity;

    @NotNull(message = "pricePerUnit is required")
    @DecimalMin(value = "0.01", message = "Price per unit must be greater than 0")
    private Double pricePerUnit;

    @NotNull(message = "discountPercent is required")
    @DecimalMin(value = "0.0", message = "Discount percentage must be between 0 and 30")
    @DecimalMax(value = "30.0", message = "Discount percentage must be between 0 and 30")
    private Double discountPercent;

    @NotBlank(message = "paymentMode is required")
    @Pattern(regexp = "^(UPI|Card|Cash)$", message = "Payment mode must be UPI, Card or Cash")
    private String paymentMode;

    private String orderStatus;
}
