package com.vladinooo.fitnessforce.web.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.service.ArticlesService;
import com.vladinooo.fitnessforce.web.service.ShopService;

@Controller
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	
	@Autowired
	private ArticlesService articlesService;
	
	
	@ModelAttribute("articles")
	public List<Article> getArticles() {
		List<Article> articles = articlesService.getArticles();
	    return articles;
	}
	
	
	@RequestMapping(value="/shop", method = RequestMethod.GET)
	public String showShop() {
		return "shop";
	}
	
	
	@RequestMapping(value="/onlineshop", method = RequestMethod.GET)
	public String showOnlineshop() {
		return "onlineshop";
	}
	
	
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
