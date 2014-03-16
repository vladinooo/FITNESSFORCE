package com.vladinooo.fitnessforce.web.dao;

import javax.validation.constraints.Size;

public class User {

	private int userId;
	
	@Size(min=5, max=20, message="Username must have min 5 and max 20 characters.")
	private String username;
	private String password;
	private String email;
	private String dateRegistered;
	private boolean enabled;
	private String rolename;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDateRegistered() {
		return dateRegistered;
	}

	public void setDateRegistered(String dateRegistered) {
		this.dateRegistered = dateRegistered;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username
				+ ", password=" + password + ", email=" + email
				+ ", dateRegistered=" + dateRegistered + ", enabled=" + enabled
				+ ", rolename=" + rolename + "]";
	}

}
