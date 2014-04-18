package com.vladinooo.fitnessforce.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
								session.setDescription(rs.getString("description"));
								session.setPrice(rs.getString("price"));
								session.setColor(rs.getString("color"));
								session.setAllDay(rs.getBoolean("allDay"));
								session.setStart(new SimpleDateFormat("yyyy/MM/dd HH:mm").format(new Date(rs.getTimestamp("start").getTime())));
								session.setEnd(new SimpleDateFormat("yyyy/MM/dd HH:mm").format(new Date(rs.getTimestamp("end").getTime())));								
								return session;
							}

						});
	}


	public boolean createSession(Session session) {

		MapSqlParameterSource params = new MapSqlParameterSource();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String startString = session.getStart();
		String endString = session.getEnd();
		Date start = new Date();
		Date end = new Date();
		
		try {
			start = formatter.parse(startString);
			end = formatter.parse(endString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		params.addValue("title", session.getTitle());
		params.addValue("description", "");
		params.addValue("price", "");
		params.addValue("color", session.getColor());
		params.addValue("allDay", session.isAllDay());
		params.addValue("start", new Timestamp(start.getTime()));
		params.addValue("end", new Timestamp(end.getTime()));

		return jdbc.update(
				"insert into sessions ("
				+ "title,"
				+ "description,"
				+ "price,"
				+ "color,"
				+ "allDay,"
				+ "start,"
				+ "end) values ("
				+ ":title,"
				+ ":description,"
				+ ":price,"
				+ ":color,"
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

		params.addValue("id", session.getId());
		params.addValue("title", session.getTitle());
		params.addValue("description", session.getDescription());
		params.addValue("price", session.getPrice());
		params.addValue("color", session.getColor());
		
		return jdbc.update(
				"update sessions set "
				+ "title = :title,"
				+ "description = :description,"
				+ "price = :price,"
				+ "color = :color"
				+ " where id = :id",
				params) == 1;
	}
	

	public boolean deleteSession(Session session) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", session.getId());
		return jdbc.update("delete from sessions where id = :id", params) == 1;
	}

}
