package com.vladinooo.fitnessforce.web.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.service.ArticlesService;
import com.vladinooo.fitnessforce.web.service.UsersService;

@Controller
public class ArticleController {
	
	@Autowired
	private ArticlesService articlesService;
	
	
	@Autowired
	private UsersService usersService;

	
	@ModelAttribute("articles")
	public List<Article> getArticles() {
		List<Article> articles = articlesService.getArticles();
	    return articles;
	}
	
	
	@ModelAttribute("currentUser")
	public User getCurrentUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String username = auth.getName();
	    User currentUser = usersService.getUser(username);
	    return currentUser;
	}
	
	
	@RequestMapping(value="/news", method = RequestMethod.GET)
	public String showNews() {
		return "news";
	}
	
	
	@RequestMapping(value="/view_article", method = RequestMethod.GET)
	public String showViewArticle(@RequestParam("articleid") String articleId, Model model) {
		Article selectedArticle = articlesService.getArticle(Integer.parseInt(articleId));
		model.addAttribute("selectedArticle", selectedArticle);
		model.addAttribute("article", new Article());
		return "view_article";
	}
	
	
	@RequestMapping(value="/articles", method = RequestMethod.GET)
	public String showArticles() {
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
	
	
	@RequestMapping(value="/edit_article", method = RequestMethod.GET)
	public String showEditArticle(@RequestParam("articleid") String articleId, Model model) {
		Article selectedArticle = articlesService.getArticle(Integer.parseInt(articleId));
		model.addAttribute("selectedArticle", selectedArticle);
		model.addAttribute("article", new Article());
		return "edit_article";
	}
	
	
	@RequestMapping(value = "/do_edit_article", method = RequestMethod.POST)
	public String doEditArticle(@Valid Article article, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "edit_article";
		}
		if (!articlesService.editArticle(article)) {
			return "error";
		}
		model.addAttribute("selectedArticle", article);
		return "articles";
	}
	
	
	@RequestMapping(value="/delete_article", method = RequestMethod.GET)
	public String showDeleteArticle(@RequestParam("articleid") String articleId, Model model) {
		Article selectedArticle = articlesService.getArticle(Integer.parseInt(articleId));
		if (!articlesService.deleteArticle(selectedArticle)) {
			return "error";
		}
		model.addAttribute("articles", articlesService.getArticles());
		return "articles";
	}
	
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
