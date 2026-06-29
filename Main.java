package com.controler;

import com.service.CouresServices;
import com.service.StudentService;

public class Main {
	public static void main(String[] args) {
		StudentService ss=new StudentService();
		CouresServices cs=new CouresServices();
		
		ss.insertData();
		//cs.insertData();
	}

}
