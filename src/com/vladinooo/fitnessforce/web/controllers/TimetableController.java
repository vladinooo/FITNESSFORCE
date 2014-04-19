package com.vladinooo.fitnessforce.web.controllers;

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

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.dao.Session;
import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.service.ArticlesService;
import com.vladinooo.fitnessforce.web.service.TimetableService;
import com.vladinooo.fitnessforce.web.service.UsersService;

@Controller
public class TimetableController {
	
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
	
	
	@RequestMapping(value="/timetable", method = RequestMethod.GET)
	public String showTimetable() {
		return "timetable";
	}
		
	
	@ResponseBody
	@RequestMapping(value="/get_sessions", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Session> getSessions() {
		List<Session> sessions = timetableService.getSessions();
		return sessions;
	}
		
	
	@ResponseBody
	@RequestMapping(value="/create_session", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String createSession(@RequestBody Map<String, Object> sessionData, Model model) {
		if (!timetableService.createSession(sessionData)) {
			return "error";
		}
		return "admin_timetable";
	}

	
	@ResponseBody
	@RequestMapping(value="/edit_session", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String editSession(@RequestBody Map<String, Object> sessionData, Model model) {
		if (!timetableService.editSession(sessionData)) {
			return "error";
		}
		return "admin_timetable";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/delete_session", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String deleteSession(@RequestBody Map<String, Object> sessionData, Model model) {
		if (!timetableService.deleteSession(sessionData)) {
			return "error";
		}
		return "admin_timetable";
	}
		
	
//	@RequestMapping(value = "/do_edit_session", method = RequestMethod.POST)
//	public String doEditSession(@Valid Session session, BindingResult result, Model model) {
//		if (result.hasErrors()) {
//			return "edit_session";
//		}
//		if (!timetableService.editSession(session)) {
//			return "error";
//		}
//		return "edit_session";
//	}
//		
//	
//	@RequestMapping(value="/delete_session", method = RequestMethod.GET)
//	public String showDeleteSession(@RequestParam("sessionid") String sessionId, Model model) {
//		Session selectedSession = timetableService.getSession(Integer.parseInt(sessionId));
//		if (!timetableService.deleteSession(selectedSession)) {
//			return "error";
//		}
//		model.addAttribute("sessions", timetableService.getSessions());
//		return "sessions";
//	}
	
	
	@RequestMapping(value="/admin_timetable", method = RequestMethod.GET)
	public String showAdminTimetable() {
		getSessions();
		return "admin_timetable";
	}
	
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
