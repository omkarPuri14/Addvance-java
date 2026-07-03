package com.food;

import org.springframework.stereotype.Component;

@Component("vegRestaurant")
	public class VegRestaurant implements Restaurant {
	    @Override
	    public void prepareFood() {
	        System.out.println("Preparing Veg Food...");
	    }
	}


