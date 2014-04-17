package com.vladinooo.fitnessforce.web.service;

import java.text.SimpleDateFormat;
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
		Long startDateTime = (Long)sessionData.get("start");
		Long endDateTime = (Long)sessionData.get("end");
		
		Session session = new Session();
		session.setTitle((String)sessionData.get("title"));
		session.setAllDay(false);
		session.setStart(new SimpleDateFormat("yyyy/MM/dd HH:mm").format(startDateTime));
		session.setEnd(new SimpleDateFormat("yyyy/MM/dd HH:mm").format(endDateTime));
		return timetableDao.createSession(session);
	}

	
	public List<Session> getSessions() {
		List<Session> sessions =  timetableDao.getSessions();
		return sessions;
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
