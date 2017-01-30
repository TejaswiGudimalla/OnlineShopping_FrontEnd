package com.niit.onlineshopping.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.onlineshopping.dao.CategoryDAO;
import com.niit.onlineshopping.dao.SupplierDAO;
import com.niit.onlineshopping.dao.UserDAO;
import com.niit.onlineshopping.model.Category;
import com.niit.onlineshopping.model.Supplier;
import com.niit.onlineshopping.model.User;


@Controller
public class UserController {
	// String role="Role_Admin";
	public static Logger log = LoggerFactory.getLogger(UserController.class);
	@Autowired
	User user;
	@Autowired
	UserDAO userDAO;
	@Autowired
	Supplier supplier;
	@Autowired
	SupplierDAO supplierDAO;
	@Autowired
	Category category;
	@Autowired
	CategoryDAO categoryDAO;

	HttpSession session;

	@RequestMapping(value="adduser")
	public String addUser(@ModelAttribute("user") User  user, Model m,RedirectAttributes attributes)
	{
        user.setRole("ROLE_USER");
       user.setEnabled(true);
        if(userDAO.saveorupdate(user)==true){
        	attributes.addFlashAttribute("registered", "You Have Successfully Registered with us Thank You...");
        }
        else{
        	attributes.addFlashAttribute("registered","Registration failed Please try again");
        }
		return "redirect:/SignUp";
	}

}
