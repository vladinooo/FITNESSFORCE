package com.vladinooo.fitnessforce.web.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vladinooo.fitnessforce.web.dao.Session;
import com.vladinooo.fitnessforce.web.dao.TimetableDao;

@Service("timetableService")
public class TimetableService {

	@Autowired
	private TimetableDao timetableDao;
	
	
	public boolean createSession(Map<String, Object> sessionData) {
		Long timestamp = (Long)sessionData.get("startDateTime");
		Date startDateTime = new Date(timestamp);
		Date endDateTime = new Date(timestamp + 3600000); // current dateTime + 1h
		
		Session session = new Session();
		session.setTitle((String)sessionData.get("title"));
		session.setAllDay(true);
		session.setStart(startDateTime);
		session.setEnd(endDateTime);
		return timetableDao.createSession(session);
	}

	
	public List<Session> getSessions() {
		return timetableDao.getSessions();
	}

	
	public Session getSession(int sessionId) {
		return timetableDao.getSession(sessionId);
	}

	
//	public boolean editSession(Session session) {
//		session.setEnabled(true);
//		return timetableDao.editSession(session);
//	}
//	
//	
//	public boolean deleteSession(Session session) {
//		return timetableDao.deleteSession(session);
//	}
	
}
