package com.orders.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InvalidTransitionResponse {
    private String message;
    private String currentStatus;
    private String requestedStatus;
}
