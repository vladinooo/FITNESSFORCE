package com.vladinooo.fitnessforce.web.dao;

import java.io.Serializable;

public class Session implements Serializable {

	private static final long serialVersionUID = 5464933984591937087L;
	
	private int id;
	private String title;
	private String description;
	private String price;
	private String color;
	private boolean allDay;
	private String start;
	private String end;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "Session [id=" + id + ", title=" + title + ", description="
				+ description + ", price=" + price + ", color=" + color
				+ ", allDay=" + allDay + ", start=" + start + ", end=" + end
				+ "]";
	}

}
