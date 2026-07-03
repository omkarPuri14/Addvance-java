package com.food;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.config.MyConfigClass;

public class Main {
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = 
                new AnnotationConfigApplicationContext(MyConfigClass.class);

        
        OrderService orderService = context.getBean(OrderService.class);

        
       // orderService.vagFood();
     //  orderService.nonVagefood();
      // orderService.upiPay();
     //   orderService.cashPay();
        

               context.close();
	}

}
