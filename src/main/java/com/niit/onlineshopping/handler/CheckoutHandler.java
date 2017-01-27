package com.niit.onlineshopping.handler;

import org.springframework.stereotype.Service;


import com.niit.onlineshopping.model.FrontCart;

@Service
public class CheckoutHandler {
public String cardPayment(FrontCart cart)
	
	{	
		return "true";
		
	}
	
	 public String paymentMethod(FrontCart cart)
	 
	 {
		System.out.println("method");
		String method=cart.getMethod();
		System.out.println(method);
		if(method.equals("cashOnDelivery"))
		
		{
			
			return "cashOnDelivery";
		}
		
		else 
		
		{
			
			return "Card";
		}
	
	 }
	
	
}