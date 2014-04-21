package com.vladinooo.fitnessforce.web.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.dao.Cart;
import com.vladinooo.fitnessforce.web.dao.Session;
import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.service.ArticlesService;
import com.vladinooo.fitnessforce.web.service.CartService;
import com.vladinooo.fitnessforce.web.service.TimetableService;
import com.vladinooo.fitnessforce.web.service.UsersService;

@Controller
@SessionAttributes({"cart"})
public class CartController {
	
	
	@Autowired
	private CartService cartService;
	
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
	
	
	@RequestMapping(value ="/cart", method = RequestMethod.GET)
	public String showCart(Model model) {
		if (!model.containsAttribute("cart")) {
			model.addAttribute("cart", new Cart());
		}
		return "cart";
	}
			
	
//	@ResponseBody
//	@RequestMapping(value="/add_to_cart", method=RequestMethod.POST)
//	public String addSessionToCart(@RequestBody Map<String, Object> sessionData, @ModelAttribute("cart") Cart cart) {
//		Session session = timetableService.getSession(sessionData);
//		cart.getItems().add(session);
//		return "cart";
//	}
	
	
//	@RequestMapping(value="/add_to_cart", method = RequestMethod.GET)
//	public String addToCart(@RequestParam("itemid") String itemId, @ModelAttribute("cart") Cart cart) {
//		CartItem item = 
//		cart.remove(Integer.parseInt(itemId));
//		return "cart";
//	}
	
	
	@ResponseBody
	@RequestMapping(value="/add_session_to_cart", method=RequestMethod.POST)
	public String addSessionToCart(@RequestBody Map<String, Object> product, @ModelAttribute("cart") Cart cart) {
		cartService.getCartItem(product);
		return "cart";
	}
	
	
	@RequestMapping(value="/delete_cart_item", method = RequestMethod.GET)
	public String deleteCartItem(@RequestParam("itemid") String itemId, @ModelAttribute("cart") List<Object> cart) {
		cart.remove(Integer.parseInt(itemId));
		return "cart";
	}
	
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
