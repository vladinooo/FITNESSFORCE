package com.vladinooo.fitnessforce.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vladinooo.fitnessforce.web.dao.User;
import com.vladinooo.fitnessforce.web.dao.UsersDao;


@Service("usersService")
public class UsersService {
	
	private UsersDao usersDao;

	@Autowired
	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}
	
	public List<User> getUsers() {
		return usersDao.getUsers();
	}
	
	public void createUser(User user) {
		usersDao.createUser(user);
	}

	public boolean userExists(String username) {
		return usersDao.userExists(username);
	}
}
