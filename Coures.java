package com.entity;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.JoinColumn;

@Entity
public class Coures {
	@Id
	private int couresId;
	private String coursName;
	@ManyToMany
	@JoinTable(
		    name = "student_course",
		    joinColumns = @JoinColumn(name = "student_id"),
		    inverseJoinColumns = @JoinColumn(name = "course_id")
		)
	private List<Student> c_id;
	public Coures() {
		
	}
	public Coures(int couresId, String coursName, List<Student> c_id) {
		super();
		this.couresId = couresId;
		this.coursName = coursName;
		this.c_id = c_id;
	}
	public int getCouresId() {
		return couresId;
	}
	public void setCouresId(int couresId) {
		this.couresId = couresId;
	}
	public String getCoursName() {
		return coursName;
	}
	public void setCoursName(String coursName) {
		this.coursName = coursName;
	}
	public List<Student> getC_id() {
		return c_id;
	}
	public void setC_id(List<Student> c_id) {
		this.c_id = c_id;
	}
	@Override
	public String toString() {
		return "Coures [couresId=" + couresId + ", coursName=" + coursName + ", c_id=" + c_id + "]";
	}
	
	
	

}
