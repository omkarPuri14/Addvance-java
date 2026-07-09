package com.custmore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.custmore.dao.CustomerDao;
import com.custmore.entitys.Custmore;

@Service
public class CustmoreService {
CustomerDao dao=new CustomerDao();

public String insertData(Custmore c) {
	String msg=dao.insertData(c);
	
	return msg;
}

public String deleteData(int id) {
	String msg=dao.deleteData(id);
	return msg;
}

public String updateData( Custmore c,int  id) {
	String msg=dao.updateData(c, id);
	return msg;
}

public Custmore getSingleData(int id) {
	Custmore c=dao.getSingle(id);
	return c;
}

public List<Custmore> getAllData() {
	List<Custmore> list=dao.getAllData();
	return list;
}
}
