package com.vladinooo.fitnessforce.web.service;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		Date dateRegistered = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		user.setDateRegistered(dateFormat.format(dateRegistered));
		user.setRolename("ROLE_ADMIN");
		usersDao.createUser(user);
	}

	public User getUser(String username) {
		return usersDao.getUser(username);
	}
}
