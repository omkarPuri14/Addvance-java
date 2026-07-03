package com.food;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class DeliveryService {

    @Qualifier("vegRestaurant")
    @Autowired
    Restaurant restaurant;
    @Qualifier("nonVegRestaurant")
    @Autowired
    Restaurant restaurant1;

    public Restaurant getRestaurant1() {
		return restaurant1;
	}

	public void setRestaurant1(Restaurant restaurant1) {
		this.restaurant1 = restaurant1;
	}

	public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    public void deliverFood() {
        System.out.println("Food Delivered Successfully!");
    }
}