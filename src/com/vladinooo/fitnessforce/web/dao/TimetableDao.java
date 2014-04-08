package com.vladinooo.fitnessforce.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("timetableDao")
public class TimetableDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<Session> getSessions() {

		return jdbc
				.query("select * from sessions",
						new RowMapper<Session>() {

							public Session mapRow(ResultSet rs, int rowNum)
									throws SQLException {
								Session session = new Session();

								session.setId(rs.getInt("id"));
								session.setTitle(rs.getString("title"));
								session.setAllDay(rs.getBoolean("allDay"));
								session.setStart(rs.getTimestamp("start"));
								session.setEnd(new Date ((long)rs.getObject("end")));
								
								return session;
							}

						});
	}


	public boolean createSession(Session session) {

		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("title", session.getTitle());
		params.addValue("allDay", session.isAllDay());
		params.addValue("start", session.getStart());
		params.addValue("end", session.getEnd());

		return jdbc.update(
				"insert into sessions ("
				+ "title,"
				+ "allDay,"
				+ "start,"
				+ "end) values ("
				+ ":title,"
				+ ":allDay,"
				+ ":start,"
				+ ":end)",
				params) == 1;
	}

	
	public Session getSession(int sessionId) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("sessionId", sessionId);

		try {

			return jdbc.queryForObject(
					"select * from sessions where session_id = :sessionId", params,
					new RowMapper<Session>() {

						public Session mapRow(ResultSet rs, int rowNum)
								throws SQLException {
							Session session = new Session();

//							session.setSessionId(rs.getInt("session_id"));
//							session.setTitle(rs.getString("title"));
//							session.setDescription(rs.getString("description"));
//							session.setStartDateTime(rs.getDate("start_datetime"));
//							session.setEndDateTime(rs.getDate("end_datetime"));
//							session.setPrice(rs.getInt("price"));
//							session.setEnabled(rs.getBoolean("enabled"));

							return session;
						}

					});
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}
	}

	
	public boolean editSession(Session session) {
		MapSqlParameterSource params = new MapSqlParameterSource();
//
//		params.addValue("sessionId", session.getSessionId());
//		params.addValue("title", session.getTitle());
//		params.addValue("description", session.getDescription());
//		params.addValue("startDateTime", session.getStartDateTime());
//		params.addValue("endDateTime", session.getEndDateTime());
//		params.addValue("price", session.getPrice());
//		params.addValue("enabled", session.isEnabled());

		return jdbc.update(
				"update sessions set "
				+ "title = :title,"
				+ "description = :description,"
				+ "start_datetime = :startDateTime,"
				+ "end_datetime = :endDateTime,"
				+ "price = :price,"
				+ "enabled = :enabled"
				+ " where session_id = :sessionId",
				params) == 1;

	}
	

//	public boolean deleteSession(Session session) {
//		MapSqlParameterSource params = new MapSqlParameterSource();
//		params.addValue("sessionId", session.getSessionId());
//		return jdbc.update("delete from sessions where session_id = :sessionId", params) == 1;
//	}

}
