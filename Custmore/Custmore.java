package com.enitity;

import javax.annotation.processing.Generated;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Custmore {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int custId;
	public Custmore(String firstName, String lastName, String dateOfBirth, String gender, String email,
			long phoneNumber, long emergancephoneNumber, int amountPanding, int paidAmount, String shippingAddress,
			String billingAddress, String accountStatus, double creditLimit, int loyaltyPoints) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.emergancephoneNumber = emergancephoneNumber;
		this.amountPanding = amountPanding;
		this.paidAmount = paidAmount;
		this.shippingAddress = shippingAddress;
		this.billingAddress = billingAddress;
		this.accountStatus = accountStatus;
		this.creditLimit = creditLimit;
		this.loyaltyPoints = loyaltyPoints;
	}

	private String firstName;
	private String lastName;
	private String dateOfBirth;
	private String gender;
	@Column(unique = true)
	private String email;
	@Column(unique = true)
	private long phoneNumber;
	
	private long emergancephoneNumber;
	private int amountPanding;
	private int paidAmount;
	private String shippingAddress;
	private String billingAddress;
	private String accountStatus;
	private double creditLimit;
	private int loyaltyPoints;

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public long getEmergancephoneNumber() {
		return emergancephoneNumber;
	}

	public void setEmergancephoneNumber(long emergancephoneNumber) {
		this.emergancephoneNumber = emergancephoneNumber;
	}

	public int getAmountPanding() {
		return amountPanding;
	}

	public void setAmountPanding(int amountPanding) {
		this.amountPanding = amountPanding;
	}

	public int getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(int paidAmount) {
		this.paidAmount = paidAmount;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(String billingAddress) {
		this.billingAddress = billingAddress;
	}

	public String getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	public double getCreditLimit() {
		return creditLimit;
	}

	public void setCreditLimit(double creditLimit) {
		this.creditLimit = creditLimit;
	}

	public int getLoyaltyPoints() {
		return loyaltyPoints;
	}

	public void setLoyaltyPoints(int loyaltyPoints) {
		this.loyaltyPoints = loyaltyPoints;
	}

	public Custmore() {

	}

	public Custmore(int custId, String firstName, String lastName, String dateOfBirth, String gender, String email,
			long phoneNumber, long emergancephoneNumber, int amountPading, int paidAmount, String shippingAddress,
			String billingAddress, String accountStatus, double creditLimit, int loyaltyPoints) {
		super();
		this.custId = custId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.emergancephoneNumber = emergancephoneNumber;
		this.amountPanding = amountPading;
		this.paidAmount = paidAmount;
		this.shippingAddress = shippingAddress;
		this.billingAddress = billingAddress;
		this.accountStatus = accountStatus;
		this.creditLimit = creditLimit;
		this.loyaltyPoints = loyaltyPoints;
	}

	public Custmore(int custId) {
		super();
		this.custId = custId;
	}

	@Override
	public String toString() {
		return "Custmore [custId=" + custId + ", firstName=" + firstName + ", lastName=" + lastName + ", dateOfBirth="
				+ dateOfBirth + ", gender=" + gender + ", email=" + email + ", phoneNumber=" + phoneNumber
				+ ", emergancephoneNumber=" + emergancephoneNumber + ", amountPading=" + amountPanding + ", paidAmount="
				+ paidAmount + ", shippingAddress=" + shippingAddress + ", billingAddress=" + billingAddress
				+ ", accountStatus=" + accountStatus + ", creditLimit=" + creditLimit + ", loyaltyPoints="
				+ loyaltyPoints + "]";
	}

}
