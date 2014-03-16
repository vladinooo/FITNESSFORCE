package com.vladinooo.fitnessforce.web.dao;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class User {

	private int userId;
	
	@Pattern(regexp="^[a-z0-9]{5,20}$", message="*Username must be 5 - 20 charactes long and contain combination of lower-case alphabetical characters and numbers")
	private String username;
	
	@Size(min=5, max=20, message="*Password must be between 5 - 10 characters")
	private String password;
	
	@Pattern(regexp="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message="*Invalid email")
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
