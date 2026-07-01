package com.redemi;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.config.MyConfigClass;


public class Main {
	
	public static void main(String[] args) {
		ApplicationContext context=new AnnotationConfigApplicationContext(MyConfigClass.class);
		ProccerManefacture pm=	context.getBean(ProccerManefacture.class);
		
		pm.getProcesser1().proceser();
		pm.getProcesser2().proceser();
		
	
	}

}
