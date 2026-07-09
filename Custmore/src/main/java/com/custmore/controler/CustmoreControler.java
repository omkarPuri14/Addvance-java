package com.custmore.controler;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.custmore.entitys.Custmore;
import com.custmore.service.CustmoreService;

@RestController
public class CustmoreControler {
	
	CustmoreService cs=new CustmoreService();
@PostMapping
public String insertData(Custmore c) {
	String msg=cs.insertData(c);
	
	return msg;
	
}

@DeleteMapping("/dlt/{id}")
public String deleteData(@PathVariable int id) {
	String msg=cs.deleteData(id);
	return msg;
	
}

@PutMapping("/update/{id}")
public String updateData(@RequestBody Custmore c,@PathVariable int id) {
	String msg=cs.updateData(c,id);
	return msg;
	
}

@GetMapping("/getsingle")
public Custmore getSingleData(@RequestParam int id) {
	Custmore c=cs.getSingleData(id);
	return c;
	
}

@GetMapping("/getall")
public List<Custmore>getAllData(){
	List<Custmore> list=cs.getAllData();
	return list;
	
}


}
