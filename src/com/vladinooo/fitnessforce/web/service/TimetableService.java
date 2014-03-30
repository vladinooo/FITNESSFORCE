package com.vladinooo.fitnessforce.web.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vladinooo.fitnessforce.web.dao.Article;
import com.vladinooo.fitnessforce.web.dao.Session;
import com.vladinooo.fitnessforce.web.dao.TimetableDao;

@Service("timetableService")
public class TimetableService {

	@Autowired
	private TimetableDao timetableDao;
	
	
	public boolean createSession(Session session) {
		session.setEnabled(true);
		return timetableDao.createSession(session);
	}

	
	public List<Session> getSessions() {
		return timetableDao.getSessions();
	}

	
	public Session getSession(int sessionId) {
		return timetableDao.getSession(sessionId);
	}

	
	public boolean editSession(Session session) {
		session.setEnabled(true);
		return timetableDao.editSession(session);
	}
	
	
	public boolean deleteSession(Session session) {
		return timetableDao.deleteSession(session);
	}
	
}
