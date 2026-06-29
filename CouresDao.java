package com.dao;

import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.entity.Coures;
import com.entity.Student;

public class CouresDao {
	public void insertData() {
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		cfg.addAnnotatedClass(Student.class);
		cfg.addAnnotatedClass(Coures.class);

		SessionFactory sf = cfg.buildSessionFactory();
		Session ss = sf.openSession();
		Transaction t = ss.beginTransaction();

		
		Coures c1 = new Coures();
		c1.setCouresId(101);
		c1.setCoursName("Java Full Stack");
		c1.setC_id(new ArrayList<>());

		Coures c2 = new Coures();
		c2.setCouresId(102);
		c2.setCoursName("Python Data Science");
		c2.setC_id(new ArrayList<>());

		Coures c3 = new Coures();
		c3.setCouresId(103);
		c3.setCoursName("Cloud Computing");
		c3.setC_id(new ArrayList<>());

		
		Student s1 = new Student();
		s1.setStdId(1);
		s1.setName("John Doe");
		s1.setC_id(new ArrayList<>());

		Student s2 = new Student();
		s2.setStdId(2);
		s2.setName("Alice Smith");
		s2.setC_id(new ArrayList<>());

		
		c1.getC_id().add(s1);
		s1.getC_id().add(c1);
		
		c1.getC_id().add(s2);
		s2.getC_id().add(c1);

		
		c2.getC_id().add(s2);
		s2.getC_id().add(c2);

		
		c3.getC_id().add(s1);
		s1.getC_id().add(c3);

		
		ss.persist(c1); 
		ss.persist(c2); 
		ss.persist(c3); 
		
		ss.persist(s1); 
		ss.persist(s2); 

		t.commit();
		ss.close();
		sf.close();
		System.out.println("All courses and students inserted successfully via CouresDao!");
	}
}