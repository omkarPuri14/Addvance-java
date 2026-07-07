package com.day1;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/foodapp")
public class FoodDeleveryApp{
	@GetMapping("/zamato")
	public String zamato() {
		
		return "food deleveriy throught zamato";
		
	}
	@PostMapping("/swigge")
	public String swigge() {
		
		return "food deleveriy throught swigge";
		
	}
	
	@GetMapping("/zepto")
	public String zepto() {
		
		return "food deleveriy throught zepto";
		
	}
	@PostMapping("/maggic")
	public String magicpin() {
		
		return "food deleveriy throught magicpin";
		
	}
	
	

}
