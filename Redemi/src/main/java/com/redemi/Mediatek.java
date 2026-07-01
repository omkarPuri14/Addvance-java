package com.redemi;

import org.springframework.stereotype.Component;

@Component("meditake")
public class Mediatek implements Redemi{

	@Override
	public void proceser() {
		System.out.println("Meditake 8500 ultra");
		
	}

}
