package com.vladinooo.fitnessforce.web.controllers;

import java.util.ArrayList;
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
import com.vladinooo.fitnessforce.web.dao.Test;
import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.service.ArticlesService;
import com.vladinooo.fitnessforce.web.service.CartItem;
import com.vladinooo.fitnessforce.web.service.CartService;
import com.vladinooo.fitnessforce.web.service.TimetableService;
import com.vladinooo.fitnessforce.web.service.UsersService;

@Controller
@SessionAttributes({"cartItems","cartTotal"})
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
	
	
	@ModelAttribute("cartItems")
	public Model getCartItems(Model model) {
		if (!model.containsAttribute("cartItems")) {
			model.addAttribute("cartItems", new ArrayList<CartItem>());
		}
	    return model;
	}
	
	@ModelAttribute("cartTotal")
	public Model getCartTotal(Model model) {
		if (!model.containsAttribute("cartTotal")) {
			model.addAttribute("cartTotal", new Test());
		}
	    return model;
	}
	
	
	@ModelAttribute("articles")
	public List<Article> getArticles() {
		List<Article> articles = articlesService.getArticles();
	    return articles;
	}
	
	
	@RequestMapping(value ="/cart", method = RequestMethod.GET)
	public String showCart(Model model) {
		return "cart";
	}
			
	
	@ResponseBody
	@RequestMapping(value = "/add_to_cart", method = RequestMethod.POST)
	public String addToCart(@RequestBody Map<String, Object> productData,
			@ModelAttribute("cartItems") ArrayList<CartItem> cartItems,
			@ModelAttribute("cartTotal") Test cartTotal) {
		CartItem item = cartService.getProduct(productData);
		cartItems.add(item);
		cartTotal.setTotal(cartTotal.getTotal() + item.getTotalPrice());
		return "cart";
	}
	
	
//	@RequestMapping(value="/add_to_cart", method = RequestMethod.GET)
//	public String addToCart(@RequestParam("itemid") String itemId, @ModelAttribute("cart") Cart cart) {
//		CartItem item = 
//		cart.remove(Integer.parseInt(itemId));
//		return "cart";
//	}
	
	
//	@ResponseBody
//	@RequestMapping(value="/add_session_to_cart", method=RequestMethod.POST)
//	public String addSessionToCart(@RequestBody Map<String, Object> product, @ModelAttribute("cart") Cart cart) {
//		cartService.getCartItem(product);
//		return "cart";
//	}
	
	
	@RequestMapping(value = "/delete_from_cart", method = RequestMethod.GET)
	public String deleteCartItem(@RequestParam("itemid") String itemId, @RequestParam("itemprice") String itemPrice,
			@ModelAttribute("cartItems") ArrayList<CartItem> cartItems,
			@ModelAttribute("cartTotal") Test cartTotal) {
		cartItems.remove(Integer.parseInt(itemId));
		cartTotal.setTotal(cartTotal.getTotal() - Integer.parseInt(itemPrice));
		return "cart";
	}
	
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
