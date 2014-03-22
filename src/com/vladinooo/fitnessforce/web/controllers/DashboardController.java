package com.vladinooo.fitnessforce.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashboardController extends RootController {


	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public String showDashboard(ModelMap model) {
		return "dashboard";
	}

}
