package com.vladinooo.fitnessforce.web.controllers;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashboardController {

	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public String showDashboard(ModelMap model, Principal principal) {
		String name = principal.getName();
		model.addAttribute("author", name);
		model.addAttribute("message",
				"Welcome To Login Form Based Spring Security Example!!!");
		return "dashboard";
	}

}
