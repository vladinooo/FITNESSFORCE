package com.vladinooo.fitnessforce.web.controllers;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.service.UsersService;

@Controller
public class UsersController {

	private UsersService usersService;

	@Autowired
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	@RequestMapping("/")
	public String showHome() {

		return "home";
	}
	
	@RequestMapping("/login")
	public String showLogin(User user) {

		return "login";
	}

	@RequestMapping("/create_user")
	public String showCreateUser(Model model) {
		model.addAttribute("user", new User());
		return "create_user";
	}

	@RequestMapping(value = "/do_create_user", method = RequestMethod.POST)
	public String doCreateUser(@Valid User user, BindingResult result) {
		
		if (result.hasErrors()) {
			System.out.println("Form has errors!");
		} else {
			System.out.println("Form is validated.");
		}

		user.setDateRegistered(new Date().toString());
		user.setRolename("ROLE_ADMIN");

		if (usersService.userExists(user.getUsername())) {
			System.out.println("Duplicate Key!");
			return "login";
		}

		usersService.createUser(user);

		return "user_created";
	}

	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
