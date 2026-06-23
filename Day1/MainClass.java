package com.main;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.std.Employee;

public class MainClass {
public static void main(String[] args) {
	
	Configuration cfg= new Configuration();
	cfg.configure("hibernate.cfg.xml");
	cfg.addAnnotatedClass(Employee.class);
	
	SessionFactory sf= cfg.buildSessionFactory();
	Session ss= sf.openSession();
	Transaction tr= ss.beginTransaction();
	Employee e= new Employee();
	e.setId(123);
	e.setName("omkar");
	e.setEmail("omkar@123");
	e.setCity("pune");
	e.setMobNo(1234254678);
	ss.persist(e);
	tr.commit();
	System.out.println("Done !");
	
	ss.close();
	sf.close();
	
//	+-----+------+-----------+------------+-------+
//	| id  | city | email     | mobNo      | name  |
//	+-----+------+-----------+------------+-------+
//	| 123 | pune | omkar@123 | 1234254678 | omkar |
//	+-----+------+-----------+------------+-------+
	
	
	
	
	
	
	
}
}
