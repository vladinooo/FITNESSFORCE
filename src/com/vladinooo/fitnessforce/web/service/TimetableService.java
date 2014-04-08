package com.vladinooo.fitnessforce.web.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
		Long startDateTime = (Long)sessionData.get("startDateTime");
		Long endDateTime = startDateTime + 3600000; // current dateTime + 1h
		
		Session session = new Session();
		session.setTitle((String)sessionData.get("title"));
		session.setAllDay(true);
		session.setStart(startDateTime);
		session.setEnd(endDateTime);
		return timetableDao.createSession(session);
	}

	
	public List<Object> getSessions() {
		List<Session> sessions = timetableDao.getSessions();
		List<Object> resultSessions = new ArrayList<Object>();
		for (Session session : sessions) {
			Map<String, Object> sessionObj = new HashMap<String, Object>();
			sessionObj.put("id", session.getId());
			sessionObj.put("title", session.getTitle());
			sessionObj.put("allDay", session.isAllDay());
			sessionObj.put("start", new Date(session.getStart()));
			sessionObj.put("end", new Date(session.getEnd()));
			resultSessions.add(sessionObj);
			System.out.println(new Date(session.getStart()));
		}
		return resultSessions;
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
