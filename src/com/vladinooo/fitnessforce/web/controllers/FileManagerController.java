package com.vladinooo.fitnessforce.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FileManagerController {
	
	
	@RequestMapping(value="/filemanager", method = RequestMethod.GET)
	public String showFileManager() {
		return "filemanager";
	}

	
	
	@ExceptionHandler(Exception.class)
	public String handleExceptions(Exception ex) {
		ex.printStackTrace();
		return "error";
	}

}
