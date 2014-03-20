package com.vladinooo.fitnessforce.web.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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

	
	//user
	@RequestMapping("/")
	public String showHome() {

		return "home";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String showLogin(ModelMap model) {
		return "login";
	}  
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)  
	public String logout(ModelMap model) {  
		return "login";  
	}  

	@RequestMapping("/create_user")
	public String showCreateUser(Model model) {
		model.addAttribute("user", new User());
		return "create_user";
	}

	@RequestMapping(value = "/do_create_user", method = RequestMethod.POST)
	public String doCreateUser(@Valid User user, BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			return "create_user";
		}

		User duplicateUser = usersService.getUser(user.getUsername());
		if (duplicateUser != null) {
			model.addAttribute("duplicateUser", duplicateUser);
			return "create_user";
		}

		usersService.createUser(user);
		return "user_created";
	}
	
	@RequestMapping("/user_edit_user")
	public String showUserEditUser(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String username = auth.getName();
		User currentUser = usersService.getUser(username);
		model.addAttribute("currentUser", currentUser);
		return "user_edit_user";
	}
	
	
	
	//admin
	@RequestMapping("/users")
	public String showUsers(Model model) {
		model.addAttribute("users", usersService.getUsers());
		return "users";
	}
	
	@RequestMapping("/admin_create_user")
	public String showAdminCreateUser(Model model) {
		model.addAttribute("user", new User());
		return "admin_create_user";
	}
	
	@RequestMapping(value = "/do_admin_create_user", method = RequestMethod.POST)
	public String doAdminCreateUser(@Valid User user, BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			return "admin_create_user";
		}

		User duplicateUser = usersService.getUser(user.getUsername());
		if (duplicateUser != null) {
			model.addAttribute("duplicateUser", duplicateUser);
			return "admin_create_user";
		}

		usersService.createUser(user);
		model.addAttribute("users", usersService.getUsers());
		return "users";
	}

	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
