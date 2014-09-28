package com.vladinooo.fitnessforce.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.service.UsersService;

@Controller
public class SettingsController {
	

	@Autowired
	private UsersService usersService;

	
	
	@ModelAttribute("currentUser")
	public User getCurrentUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String username = auth.getName();
	    User currentUser = usersService.getUser(username);
	    return currentUser;
	}
	
	
	@RequestMapping(value="/user_settings", method = RequestMethod.GET)
	public String showUserSettings() {
		return "user_settings";
	}
	
	
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
