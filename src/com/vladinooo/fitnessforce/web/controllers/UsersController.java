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
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping(value="/", method = RequestMethod.GET)
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

	
	@RequestMapping(value="/create_user", method = RequestMethod.GET)
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
		if (!usersService.createUser(user)) {
			return "error";
		}
		return "user_created";
	}
	
	
	@RequestMapping(value="/edit_user", method = RequestMethod.GET)
	public String showEditUser(@RequestParam("userid") String userId, Model model) {
		User selectedUser = usersService.getUser(Integer.parseInt(userId));
		model.addAttribute("selectedUser", selectedUser);
		model.addAttribute("user", new User());
		return "edit_user";
	}
		
	
	@RequestMapping(value = "/do_edit_user", method = RequestMethod.POST)
	public String doEditUser(@Valid User user, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "edit_user";
		}
		if (!usersService.editUser(user)) {
			return "error";
		}
		return "edit_user";
	}

	
	@RequestMapping(value="/users", method = RequestMethod.GET)
	public String showUsers(Model model) {
		model.addAttribute("users", usersService.getUsers());
		return "users";
	}
	
	
	@RequestMapping(value="/admin_create_user", method = RequestMethod.GET)
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
		if (!usersService.createUser(user)) {
			return "error";
		}
		model.addAttribute("users", usersService.getUsers());
		return "users";
	}

	
	@RequestMapping(value="/admin_edit_user", method = RequestMethod.GET)
	public String showAdminEditUser(@RequestParam("userid") String userId, Model model) {
		User selectedUser = usersService.getUser(Integer.parseInt(userId));
		model.addAttribute("selectedUser", selectedUser);
		model.addAttribute("user", new User());
		return "admin_edit_user";
	}
	
	
	@RequestMapping(value = "/do_admin_edit_user", method = RequestMethod.POST)
	public String doAdminEditUser(@Valid User user, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "admin_edit_user";
		}
		if (!usersService.editUser(user)) {
			return "error";
		}
		model.addAttribute("selectedUser", user);
		return "admin_edit_user";
	}
	
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
