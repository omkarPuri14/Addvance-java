package com.service;

import com.dao.CustmoreDao;
import com.dao.EmployeeDao;
import com.enitity.Custmore;
import com.enitity.Employee;

public class CustmoreService {
	
public void insertData(Custmore c) {
		
		CustmoreDao dao= new CustmoreDao();
		dao.insertData(c);
	    
	}
	
	public void updateData(Custmore c) {
		
		CustmoreDao dao= new CustmoreDao();
		dao.updateData(c);
	    
	}
	
	public void delectData(Custmore c) {
		
		CustmoreDao dao= new CustmoreDao();
		dao.delectData(c);
	    
	}
	
public void getSenglerecord(Custmore c) {
	
	CustmoreDao dao= new CustmoreDao();
	dao.getSenglerecord(c);
    
}
public void  fetchAllRecord(Custmore c) {
	
	CustmoreDao dao= new CustmoreDao();
	dao.fetchAllRecord(c);
	
	
}
}
