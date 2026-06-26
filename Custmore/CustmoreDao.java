package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.MutationQuery;
import org.hibernate.query.NativeQuery;

import com.enitity.Custmore;
import com.enitity.Employee;

public class CustmoreDao {

	public void insertData(Custmore c) {
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		cfg.addAnnotatedClass(Custmore.class);

		SessionFactory sf = cfg.buildSessionFactory();
		Session ss = sf.openSession();
		Transaction tr = ss.beginTransaction();

//		c.setCustId(c.getCustId());
//		c.setFirstName(c.getFirstName());
//		c.setLastName(c.getLastName());
//		c.setDateOfBirth(c.getDateOfBirth());
//		c.setGender(c.getGender());
//		c.setEmail(c.getEmail());
//		c.setPhoneNumber(c.getPhoneNumber());
//		c.setEmergancephoneNumber(c.getEmergancephoneNumber());
//		c.setAmountPanding(c.getAmountPanding());
//		c.setPaidAmount(c.getPaidAmount());
//		c.setShippingAddress(c.getShippingAddress());
//		c.setBillingAddress(c.getBillingAddress());
//		c.setAccountStatus(c.getAccountStatus());
//		c.setCreditLimit(c.getCreditLimit());
//		c.setLoyaltyPoints(c.getLoyaltyPoints());

		// ss.persist(c);

		String hqlQuery = "insert into custmore(firstName, lastName, dateOfBirth, gender, email, phoneNumber, emergancephoneNumber, amountPanding, paidAmount, shippingAddress, billingAddress, accountStatus, creditLimit, loyaltyPoints)values(:firstName, :lastName, :dateOfBirth, :gender, :email, :phoneNumber, :emergancephoneNumber, :amountPanding, :paidAmount, :shippingAddress, :billingAddress, :accountStatus, :creditLimit, :loyaltyPoints)";

		MutationQuery query = ss.createNativeMutationQuery(hqlQuery);
		query.setParameter("firstName", c.getFirstName());
		query.setParameter("lastName", c.getLastName());
		query.setParameter("dateOfBirth", c.getDateOfBirth());
		query.setParameter("gender", c.getGender());
		query.setParameter("email", c.getEmail());
		query.setParameter("phoneNumber", c.getPhoneNumber());
		query.setParameter("emergancephoneNumber", c.getEmergancephoneNumber());
		query.setParameter("amountPanding", c.getAmountPanding());
		query.setParameter("paidAmount", c.getPaidAmount());
		query.setParameter("shippingAddress", c.getShippingAddress());
		query.setParameter("billingAddress", c.getBillingAddress());
		query.setParameter("accountStatus", c.getAccountStatus());
		query.setParameter("creditLimit", c.getCreditLimit());
		query.setParameter("loyaltyPoints", c.getLoyaltyPoints());
		int a = query.executeUpdate();
		if (a > 0) {

			System.out.println("inserte !");
		} else {
			System.out.println("not inserte ");
		}
		tr.commit();

		ss.close();
		sf.close();

	}

	public void updateData(Custmore c) {
	    Configuration cfg = new Configuration();
	    cfg.configure("hibernate.cfg.xml");
	    cfg.addAnnotatedClass(Custmore.class);

	    SessionFactory sf = cfg.buildSessionFactory();
	    Session ss = sf.openSession();
	    Transaction tr = ss.beginTransaction();
//	    c.setCustId(c.getCustId());
//		ss.get(Custmore.class, c.getCustId());
//		c.setFirstName(c.getFirstName());
//		c.setLastName(c.getLastName());
//		c.setDateOfBirth(c.getDateOfBirth());
//		c.setGender(c.getGender());
//		c.setEmail(c.getEmail());
//		c.setPhoneNumber(c.getPhoneNumber());
//		c.setEmergancephoneNumber(c.getEmergancephoneNumber());
//		c.setAmountPanding(c.getAmountPanding());
//		c.setPaidAmount(c.getPaidAmount());
//		c.setShippingAddress(c.getShippingAddress());
//		c.setBillingAddress(c.getBillingAddress());
//		c.setAccountStatus(c.getAccountStatus());
//		c.setCreditLimit(c.getCreditLimit());
		//ss.merge(c);
		

	    
	        
	    String hqlQuery = "update custmore set firstName = :firstName, lastName = :lastName, dateOfBirth = :dateOfBirth, gender = :gender, email = :email, phoneNumber = :phoneNumber, emergancephoneNumber = :emergancephoneNumber, amountPanding = :amountPanding, paidAmount = :paidAmount, shippingAddress = :shippingAddress, billingAddress = :billingAddress, accountStatus = :accountStatus, creditLimit = :creditLimit, loyaltyPoints = :loyaltyPoints where custId = :custId";

	        MutationQuery query = ss.createNativeMutationQuery(hqlQuery);

	        
	        query.setParameter("firstName", c.getFirstName());
	        query.setParameter("lastName", c.getLastName());
	        query.setParameter("dateOfBirth", c.getDateOfBirth());
	        query.setParameter("gender", c.getGender());
	        query.setParameter("email", c.getEmail());
	        query.setParameter("phoneNumber", c.getPhoneNumber());
	        query.setParameter("emergancephoneNumber", c.getEmergancephoneNumber());
	        query.setParameter("amountPanding", c.getAmountPanding());
	        query.setParameter("paidAmount", c.getPaidAmount());
	        query.setParameter("shippingAddress", c.getShippingAddress());
	        query.setParameter("billingAddress", c.getBillingAddress());
	        query.setParameter("accountStatus", c.getAccountStatus());
	        query.setParameter("creditLimit", c.getCreditLimit());
	        query.setParameter("loyaltyPoints", c.getLoyaltyPoints());
	        query.setParameter("custId", c.getCustId()); 
	       

	        int a = query.executeUpdate();

	        if (a > 0) {
	            System.out.println("Updated successfully!");
	        } else {
	            System.out.println("No record found with the given Customer ID.");
	        }
	        

	        tr.commit();
	    
	        ss.close();
	        sf.close();
	    
	}
	public void delectData(Custmore c) {
	    Configuration cfg = new Configuration();
	    cfg.configure("hibernate.cfg.xml");
	    cfg.addAnnotatedClass(Custmore.class);

	    SessionFactory sf = cfg.buildSessionFactory();
	    Session ss = sf.openSession();
	    Transaction tr = ss.beginTransaction();
//	    c.setCustId(c.getCustId());
//		Custmore cs = ss.get(Custmore.class, c.getCustId());
//
//		ss.remove(cs);

	   
	    String hqlQuery = "delete from custmore where custId = :custId";

	    MutationQuery query = ss.createNativeMutationQuery(hqlQuery);
	    query.setParameter("custId", c.getCustId());

	    int a = query.executeUpdate();

	    if (a > 0) {
	        System.out.println("Deleted successfully!");
	    } else {
	        System.out.println("No record found with the given Customer ID.");
	    }
	    
	  //  ss.remove(c);

	    tr.commit();

	    ss.close();
	    sf.close();
	}

	public void getSenglerecord(Custmore c) {
	    Configuration cfg = new Configuration();
	    cfg.configure("hibernate.cfg.xml");
	    cfg.addAnnotatedClass(Custmore.class);

	    SessionFactory sf = cfg.buildSessionFactory();
	    Session ss = sf.openSession();
	    Transaction tr = ss.beginTransaction();

//	    c.setCustId(c.getCustId());
//		Custmore cs = ss.get(Custmore.class, c.getCustId());
	   // System.out.println(cs);
		
	    String hqlQuery = "select * from custmore where custId = :custId";

	    NativeQuery<Custmore> query = ss.createNativeQuery(hqlQuery, Custmore.class);
	    query.setParameter("custId", c.getCustId());

	    Custmore cs = query.getSingleResultOrNull();

	    tr.commit();
	    
	    if (cs != null) {
	        System.out.println(cs);
	    } else {
	        System.out.println("No record found with the given Customer ID.");
	    }

	    ss.close();
	    sf.close();
	}
	public void fetchAllRecord(Custmore c) {

		
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			cfg.addAnnotatedClass(Custmore.class);

			SessionFactory sf = cfg.buildSessionFactory();
			Session ss = sf.openSession();
			Transaction tr = ss.beginTransaction();

			
			String hqlQuery = "select * from custmore";
			
			NativeQuery<Custmore> query = ss.createNativeQuery(hqlQuery, Custmore.class);
			List<Custmore> list = query.list();

			for (Custmore cust : list) {
				System.out.println(cust);
			}

			tr.commit();
			ss.close();
			sf.close();

		

	}

}
