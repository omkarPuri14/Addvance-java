package com.orders.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "customer_order")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Long orderId;

    @Column(name = "customer_name", length = 100)
    private String customerName;

    @Column(name = "product_name", length = 100)
    private String productName;

    @Column(name = "category", length = 50)
    private String category;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "price_per_unit")
    private Double pricePerUnit;

    @Column(name = "discount_percent")
    private Double discountPercent;

    @Column(name = "payment_mode", length = 30)
    private String paymentMode;

    @Column(name = "order_status", length = 30)
    private String orderStatus;
}
