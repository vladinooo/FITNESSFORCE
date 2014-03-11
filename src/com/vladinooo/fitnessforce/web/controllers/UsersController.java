package com.vladinooo.fitnessforce.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String showLogin() {

		return "login";
	}

	@RequestMapping("/create_user")
	public String showCreateUser(Model model) {
		model.addAttribute("user", new User());
		return "create_user";
	}

	@RequestMapping(value="/do_create_user", method=RequestMethod.POST)
	public String doCreateUser(User user) {

		usersService.createUser(user);
		return "user_created";
	}

	
}
