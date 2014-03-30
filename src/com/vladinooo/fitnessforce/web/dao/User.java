package com.vladinooo.fitnessforce.web.dao;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class User {

	private int userId;

	@Pattern(regexp = "^[a-z0-9]{5,20}$", message = "Username must be 5 - 20 charactes long and contain combination of lower-case alphabetical characters and numbers")
	private String username;

	@Size(min = 5, max = 20, message = "Password must be between 5 - 10 characters")
	private String password;

	@Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message = "Invalid email")
	private String email;
	private String firstname;
	private String surname;
	private int age;
	private int phone;
	private String gender;
	private String bio;
	private String datetimeRegistered;
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

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getDatetimeRegistered() {
		return datetimeRegistered;
	}

	public void setDatetimeRegistered(String datetimeRegistered) {
		this.datetimeRegistered = datetimeRegistered;
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

}
