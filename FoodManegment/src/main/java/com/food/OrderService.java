package com.food;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class OrderService {

	@Qualifier("vegRestaurant")
	@Autowired
	Restaurant restaurant;

	@Qualifier("upiPayment")
	@Autowired
	PaymentService paymentService;

	@Qualifier("nonVegRestaurant")
	@Autowired
	Restaurant restaurant1;

	@Qualifier("cashPayment")
	@Autowired
	PaymentService paymentService1;

	@Autowired
	DeliveryService deliveryService;

	public Restaurant getRestaurant1() {
		return restaurant1;
	}

	public void setRestaurant1(Restaurant restaurant1) {
		this.restaurant1 = restaurant1;
	}

	public PaymentService getPaymentService1() {
		return paymentService1;
	}

	public void setPaymentService1(PaymentService paymentService1) {
		this.paymentService1 = paymentService1;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public PaymentService getPaymentService() {
		return paymentService;
	}

	public void setPaymentService(PaymentService paymentService) {
		this.paymentService = paymentService;
	}

	public DeliveryService getDeliveryService() {
		return deliveryService;
	}

	public void setDeliveryService(DeliveryService deliveryService) {
		this.deliveryService = deliveryService;
	}

	public void vagFood() {
		restaurant.prepareFood();

	}

	public void nonVagefood() {

		restaurant1.prepareFood();

	}

	public void cashPay() {
		paymentService1.pay();
		deliveryService.deliverFood();

	}

	public void upiPay() {
		paymentService.pay();
		deliveryService.deliverFood();

	}

}
