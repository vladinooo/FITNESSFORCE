package com.vladinooo.fitnessforce.web.dao;

public class SessionBooking {

	private int sessionId;
	private String notes;
	private String bookedDatetime;

	public int getSessionId() {
		return sessionId;
	}

	public void setSessionId(int sessionId) {
		this.sessionId = sessionId;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getBookedDatetime() {
		return bookedDatetime;
	}

	public void setBookedDatetime(String bookedDatetime) {
		this.bookedDatetime = bookedDatetime;
	}

}
