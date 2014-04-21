package com.vladinooo.fitnessforce.web.dao;

import java.io.Serializable;

public abstract class Product implements Serializable{

	private static final long serialVersionUID = 3898172379229073610L;
	
	private int id;
	private String type;
	private String title;
	private String description;
	private int price;


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
