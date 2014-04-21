package com.vladinooo.fitnessforce.web.dao;


public class Session extends Product {


	private static final long serialVersionUID = 2583391823846245320L;
	
	private String color;
	private boolean allDay;
	private String start;
	private String end;


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

}
