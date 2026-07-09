package com.custmore.entitys;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Custmore {
	@Id
	private int id;
	private String fname;// frist name
	private String lname;// last name
	private String contary;
	private String state;
	private String city;
	private String email;
	private String dob;// date of birth
	private long adharNO;
	private String panCard;
	private long mobileNo;
	private long mobileNo2;
	private long cirditCardNO;
	private double cirditCardLimit;
	private double cirditCardScore;
	
	public Custmore() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Custmore(int id, String fname, String lname, String contary, String state, String city, String email,
			String dob, long adharNO, String panCard, long mobileNo, long mobileNo2, long cirditCardNO,
			double cirditCardLimit, double cirditCardScore) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.contary = contary;
		this.state = state;
		this.city = city;
		this.email = email;
		this.dob = dob;
		this.adharNO = adharNO;
		this.panCard = panCard;
		this.mobileNo = mobileNo;
		this.mobileNo2 = mobileNo2;
		this.cirditCardNO = cirditCardNO;
		this.cirditCardLimit = cirditCardLimit;
		this.cirditCardScore = cirditCardScore;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getContary() {
		return contary;
	}

	public void setContary(String contary) {
		this.contary = contary;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public long getAdharNO() {
		return adharNO;
	}

	public void setAdharNO(long adharNO) {
		this.adharNO = adharNO;
	}

	public String getPanCard() {
		return panCard;
	}

	public void setPanCard(String panCard) {
		this.panCard = panCard;
	}

	public long getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(long mobileNo) {
		this.mobileNo = mobileNo;
	}

	public long getMobileNo2() {
		return mobileNo2;
	}

	public void setMobileNo2(long mobileNo2) {
		this.mobileNo2 = mobileNo2;
	}

	public long getCirditCardNO() {
		return cirditCardNO;
	}

	public void setCirditCardNO(long cirditCardNO) {
		this.cirditCardNO = cirditCardNO;
	}

	public double getCirditCardLimit() {
		return cirditCardLimit;
	}

	public void setCirditCardLimit(double cirditCardLimit) {
		this.cirditCardLimit = cirditCardLimit;
	}

	public double getCirditCardScore() {
		return cirditCardScore;
	}

	public void setCirditCardScore(double cirditCardScore) {
		this.cirditCardScore = cirditCardScore;
	}

	@Override
	public String toString() {
		return "Custmore [id=" + id + ", fname=" + fname + ", lname=" + lname + ", contary=" + contary + ", state="
				+ state + ", city=" + city + ", email=" + email + ", dob=" + dob + ", adharNO=" + adharNO + ", panCard="
				+ panCard + ", mobileNo=" + mobileNo + ", mobileNo2=" + mobileNo2 + ", cirditCardNO=" + cirditCardNO
				+ ", cirditCardLimit=" + cirditCardLimit + ", cirditCardScore=" + cirditCardScore + "]";
	}
	
	

}
