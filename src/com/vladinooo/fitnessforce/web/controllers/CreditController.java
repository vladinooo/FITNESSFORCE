package com.vladinooo.fitnessforce.web.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.service.ArticlesService;
import com.vladinooo.fitnessforce.web.service.UsersService;

@Controller
public class CreditController {
	

	@Autowired
	private UsersService usersService;

	
	
	@ModelAttribute("currentUser")
	public User getCurrentUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String username = auth.getName();
	    User currentUser = usersService.getUser(username);
	    return currentUser;
	}
	
	
	@RequestMapping(value="/credit_status", method = RequestMethod.GET)
	public String showCreditStatus() {
		return "credit_status";
	}
	
	
	@RequestMapping(value="/credit_topup", method = RequestMethod.GET)
	public String showCreditTopup() {
		return "credit_topup";
	}
	
	
	@RequestMapping(value="/credit_history", method = RequestMethod.GET)
	public String showCreditHistory() {
		return "credit_history";
	}
	
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
