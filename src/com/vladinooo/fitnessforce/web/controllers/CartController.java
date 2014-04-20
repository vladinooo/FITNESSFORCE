package com.vladinooo.fitnessforce.web.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.dao.Session;
import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.service.ArticlesService;
import com.vladinooo.fitnessforce.web.service.TimetableService;
import com.vladinooo.fitnessforce.web.service.UsersService;

@Controller
@SessionAttributes({"cart"})
public class CartController {
	
	@Autowired
	private TimetableService timetableService;
		
	@Autowired
	private ArticlesService articlesService;
	
	@Autowired
	private UsersService usersService;
	
	
	@ModelAttribute("currentUser")
	public User getCurrentUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String username = auth.getName();
	    User currentUser = usersService.getUser(username);
	    return currentUser;
	}
	
	
	@ModelAttribute("articles")
	public List<Article> getArticles() {
		List<Article> articles = articlesService.getArticles();
	    return articles;
	}
	
	
//	@RequestMapping(value ="/cart", method = RequestMethod.GET)
//	public String showCart(Model model) {
//		if (!model.containsAttribute("cart")) {
//			model.addAttribute("cart", new ArrayList<Map<String, Object>>());
//		}
//		return "cart";
//	}
		
	
	@ResponseBody
	@RequestMapping(value="/add_session", method = RequestMethod.POST)
	public String addSession(@RequestBody Map<String, Object> sessionData, @ModelAttribute("cart") List<Map<String, Object>> cart) {
		cart.add(sessionData);
		return "cart";
	}
	
	
//	@ResponseBody
//	@RequestMapping(value="/edit_session", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
//	public String editSession(@RequestBody Map<String, Object> sessionData, Model model) {
//		if (!timetableService.editSession(sessionData)) {
//			return "error";
//		}
//		return "admin_timetable";
//	}
//	
//	
//	@ResponseBody
//	@RequestMapping(value="/delete_session", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
//	public String deleteSession(@RequestBody Map<String, Object> sessionData, Model model) {
//		if (!timetableService.deleteSession(sessionData)) {
//			return "error";
//		}
//		return "admin_timetable";
//	}
	
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
