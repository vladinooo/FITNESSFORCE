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

	@Autowired
	private UsersDao usersDao;

	
	public List<User> getUsers() {
		return usersDao.getUsers();
	}

	public boolean createUser(User user) {
		Date datetimeRegistered = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		user.setDatetimeRegistered(dateFormat.format(datetimeRegistered));
		user.setRolename("ROLE_ADMIN");
		return usersDao.createUser(user);
	}

	public User getUser(int userId) {
		return usersDao.getUser(userId);
	}
	
	public User getUser(String username) {
		return usersDao.getUser(username);
	}

	public boolean editUser(User user) {
		user.setRolename("ROLE_ADMIN");
		user.setEnabled(true);
		return usersDao.editUser(user);
	}

	public boolean deleteUser(User user) {
		return usersDao.deleteUser(user);
	}
}
