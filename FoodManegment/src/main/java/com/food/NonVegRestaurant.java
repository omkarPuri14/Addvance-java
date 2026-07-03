package com.food;

import org.springframework.stereotype.Component;

@Component("nonVegRestaurant")
public class NonVegRestaurant implements Restaurant {
    @Override
    public void prepareFood() {
        System.out.println("Preparing Non-Veg Food...");
    }
}
