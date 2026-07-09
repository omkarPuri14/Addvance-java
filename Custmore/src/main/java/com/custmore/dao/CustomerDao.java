package com.custmore.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.custmore.entitys.Custmore;

@Repository
public class CustomerDao {
	@Autowired
	SessionFactory sf;
	

	public String insertData(Custmore c) {
		
	Session session=sf.openSession();
	session.persist(c);
	Transaction t=session.beginTransaction();
	
	t.commit();
	session.close();
	return"insert..";
	
		
		
	}


	public String deleteData(int id) {
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		Custmore c=session.get(Custmore.class, id);
		session.remove(c);;
		
		
		t.commit();
		session.close();
		return"delete..";
		
	
	}


	public String updateData(Custmore c,int id) {
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		Custmore c1=session.get(Custmore.class, id);
		c1.setFname(c.getFname());
		c1.setLname(c.getLname());
		c1.setContary(c.getContary());
		c1.setState(c.getState());
		c1.setCity(c.getCity());
		c1.setEmail(c.getEmail());
		c1.setDob(c.getDob());
		c1.setAdharNO(c.getAdharNO());
		c1.setPanCard(c.getPanCard());
		c1.setMobileNo(c.getMobileNo());
		c1.setMobileNo2(c.getMobileNo2());
		c1.setCirditCardNO(c.getCirditCardNO());
		c1.setCirditCardLimit(c.getCirditCardLimit());
		c1.setCirditCardScore(c.getCirditCardScore());
		
		
		return null;
	}


	public Custmore getSingle(int id) {
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		String hqlQuery="from employe where id=: id";
		Query<Custmore> query=session.createQuery(hqlQuery,Custmore.class);
		query.setParameter("id", id);
		Custmore c=query.getSingleResult();
		t.commit();
		
		return c;
	}


	public List<Custmore> getAllData() {
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		String hqlQuery="from employe";
		Query<Custmore> query=session.createQuery(hqlQuery,Custmore.class);
		List<Custmore>list=query.getResultList();
		t.commit();
		session.close();
		return list;
	}
}
