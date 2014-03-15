// Disabled due to weird bug caused by @ControllerAdvice

//package com.vladinooo.fitnessforce.web.controllers;
//
//import org.springframework.dao.DataAccessException;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//
//@ControllerAdvice
//public class DatabaseErrorHandler {
//
//	@ExceptionHandler(DataAccessException.class)
//	public String handleDatabaseException(DataAccessException ex) {
//		
//		ex.printStackTrace();
//		
//		return "database_error";
//	}
//}
