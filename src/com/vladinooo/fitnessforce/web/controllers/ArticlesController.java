package com.vladinooo.fitnessforce.web.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.service.ArticlesService;

@Controller
public class ArticlesController {
	
	@Autowired
	private ArticlesService articlesService;

	
	@RequestMapping(value="/articles", method = RequestMethod.GET)
	public String showArticles(Model model) {
		model.addAttribute("articles", articlesService.getArticles());
		return "articles";
	}

	
	@RequestMapping(value="/create_article", method = RequestMethod.GET)
	public String showCreateArticle(Model model) {
		model.addAttribute("article", new Article());
		return "create_article";
	}
	
	
	@RequestMapping(value = "/do_create_article", method = RequestMethod.POST)
	public String doCreateArticle(@Valid Article article, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "create_article";
		}
		
		if (!articlesService.createArticle(article)) {
			return "error";
		}
		model.addAttribute("articles", articlesService.getArticles());
		return "articles";
	}

}
