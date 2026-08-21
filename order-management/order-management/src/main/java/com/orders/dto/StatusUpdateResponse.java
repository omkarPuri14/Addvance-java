package com.orders.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StatusUpdateResponse {
    private String message;
    private Long orderId;
    private String oldStatus;
    private String newStatus;
}
