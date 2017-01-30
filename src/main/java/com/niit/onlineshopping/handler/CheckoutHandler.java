package com.niit.onlineshopping.handler;

import org.springframework.stereotype.Service;

import com.niit.onlineshopping.model.FrontCart;

@Service
public class CheckoutHandler {
public String cardPayment(FrontCart frontCart)
	
	{	
		return "true";
		
	}
	
	 public String paymentMethod(FrontCart frontCart)
	 
	 {
		System.out.println("method");
		String method=frontCart.getMethod();
		System.out.println(method);
		if(method.equals("cashOnDelivery"))
		
		{
			
			return "cashOnDelivery";
		}
		
		else 
		
		{
			
			return "card";
		}
	
	 }
	
	
}