package com.vladinooo.fitnessforce.web.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.dao.Session;
import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.service.ArticlesService;
import com.vladinooo.fitnessforce.web.service.TimetableService;

@Controller
public class TimetableController {
	
	@Autowired
	private TimetableService timetableService;
	
	
	@Autowired
	private ArticlesService articlesService;
	
	
	@ModelAttribute("articles")
	public List<Article> getArticles() {
		List<Article> articles = articlesService.getArticles();
	    return articles;
	}
	
	
	@RequestMapping(value="/timetable", method = RequestMethod.GET)
	public String showTimetable() {
		return "timetable";
	}
	
	
	@RequestMapping(value="/create_session", method = RequestMethod.GET)
	public String showCreateSession(Model model) {
		model.addAttribute("session", new Session());
		return "create_session";
	}

	
	@RequestMapping(value = "/do_create_session", method = RequestMethod.POST)
	public String doCreateSession(@Valid Session session, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "create_session";
		}
		if (!timetableService.createSession(session)) {
			return "error";
		}
		return "create_session";
	}
	
	
	@RequestMapping(value="/edit_session", method = RequestMethod.GET)
	public String showEditSession(@RequestParam("sessionid") String sessionId, Model model) {
		User selectedSession = timetableService.getSession(Integer.parseInt(sessionId));
		model.addAttribute("selectedSession", selectedSession);
		model.addAttribute("session", new Session());
		return "edit_session";
	}
		
	
	@RequestMapping(value = "/do_edit_session", method = RequestMethod.POST)
	public String doEditSession(@Valid Session session, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "edit_session";
		}
		if (!timetableService.editSession(session)) {
			return "error";
		}
		return "edit_session";
	}
	
	
	@RequestMapping(value="/sessions", method = RequestMethod.GET)
	public String showSessions(Model model) {
		model.addAttribute("sessions", timetableService.getSessions());
		return "sessions";
	}
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
