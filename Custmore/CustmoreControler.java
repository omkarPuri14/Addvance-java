package com.controler;

import java.util.Scanner;

import com.enitity.Custmore;
import com.service.CustmoreService;

public class CustmoreControler {
	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);

		CustmoreService service = new CustmoreService();

		System.out.println(" Customer Details ");

//		System.out.print("Enter Customer ID: ");
//		int custId = scanner.nextInt();
//		scanner.nextLine();

//		System.out.print("Enter First Name: ");
//		String firstName = scanner.nextLine();
//
//		System.out.print("Enter Last Name: ");
//		String lastName = scanner.nextLine();
//
//		System.out.print("Enter Date of Birth (YYYY-MM-DD): ");
//		String dateOfBirth = scanner.nextLine();
//
//		System.out.print("Enter Gender: ");
//		String gender = scanner.nextLine();
//
//		System.out.print("Enter Email: ");
//		String email = scanner.nextLine();
//
//		System.out.print("Enter Phone Number: ");
//		long phoneNumber = scanner.nextLong();
//
//		System.out.print("Enter Emergency Phone Number: ");
//		long emergencyPhoneNumber = scanner.nextLong();
//
//		System.out.print("Enter Amount Pending: ");
//		int amountPending = scanner.nextInt();
//
//		System.out.print("Enter Paid Amount: ");
//		int paidAmount = scanner.nextInt();
//		scanner.nextLine();
//
//		System.out.print("Enter Shipping Address: ");
//		String shippingAddress = scanner.nextLine();
//
//		System.out.print("Enter Billing Address: ");
//		String billingAddress = scanner.nextLine();
//
//		System.out.print("Enter Account Status: ");
//		String accountStatus = scanner.nextLine();
//
//		System.out.print("Enter Credit Limit: ");
//		double creditLimit = scanner.nextDouble();
//
//		System.out.print("Enter Loyalty Points: ");
//		int loyaltyPoints = scanner.nextInt();
//
//		Custmore cs = new Custmore(firstName, lastName, dateOfBirth, gender, email, phoneNumber,
//				emergencyPhoneNumber, amountPending, paidAmount, shippingAddress, billingAddress, accountStatus,
//				creditLimit, loyaltyPoints);
//		 service.insertData(cs);
//		 service.updateData(cs);
		Custmore cs = new Custmore();
		service.fetchAllRecord(cs);

// 	service.delectData(cs);
		// service.getSenglerecord(cs);

	}

}
