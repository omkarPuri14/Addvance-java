package com.food;

import org.springframework.stereotype.Component;

@Component("upiPayment")
public class UPIPayment implements PaymentService {
    @Override
    public void pay() {
        System.out.println("Payment done using UPI...");
    }
}
