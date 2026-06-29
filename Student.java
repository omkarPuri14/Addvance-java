package com.entity;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
@Entity
public class Student {
	@Id
	private int stdId;
	private String name;
	@ManyToMany(mappedBy = "c_id", cascade = jakarta.persistence.CascadeType.PERSIST)
	private List<Coures> c_id;
	public Student() {
		
	}
	public Student(int stdId, String name, List<Coures> c_id) {
		super();
		this.stdId = stdId;
		this.name = name;
		this.c_id = c_id;
	}
	public int getStdId() {
		return stdId;
	}
	public void setStdId(int stdId) {
		this.stdId = stdId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Coures> getC_id() {
		return c_id;
	}
	public void setC_id(List<Coures> c_id) {
		this.c_id = c_id;
	}
	@Override
	public String toString() {
		return "Student [stdId=" + stdId + ", name=" + name + ", c_id=" + c_id + "]";
	}
	
	
	
	
	

}
