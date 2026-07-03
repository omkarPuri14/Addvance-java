package com.food;

import org.springframework.stereotype.Component;

@Component("cashPayment")
public class CashPayment implements PaymentService {
    @Override
    public void pay() {
        System.out.println("Payment done using Cash...");
    }
}
