package com.vladinooo.fitnessforce.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
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

								session.setSessionId(rs.getInt("session_id"));
								session.setTitle(rs.getString("title"));
								session.setDescription(rs.getString("description"));
								session.setStartDate(rs.getString("start_date"));
								session.setStartTime(rs.getString("start_time"));
								session.setEndDate(rs.getString("end_date"));
								session.setEndTime(rs.getString("end_time"));
								session.setPrice(rs.getInt("price"));
								session.setEnabled(rs.getBoolean("enabled"));
								
								return session;
							}

						});
	}


	public boolean createSession(Session session) {

		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("title", session.getTitle());
		params.addValue("description", session.getDescription());
		params.addValue("startDate", session.getStartDate());
		params.addValue("startTime", session.getStartTime());
		params.addValue("endDate", session.getEndDate());
		params.addValue("endTime", session.getEndTime());
		params.addValue("price", session.getPrice());

		return jdbc.update(
				"insert into sessions ("
				+ "title,"
				+ "description,"
				+ "start_date,"
				+ "start_time,"
				+ "end_date,"
				+ "end_time,"
				+ "price) values ("
				+ ":title,"
				+ ":description,"
				+ ":startDate,"
				+ ":startTime,"
				+ ":endDate,"
				+ ":endTime,"
				+ ":price)",
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

							session.setSessionId(rs.getInt("session_id"));
							session.setTitle(rs.getString("title"));
							session.setDescription(rs.getString("description"));
							session.setStartDate(rs.getString("start_date"));
							session.setStartTime(rs.getString("start_time"));
							session.setEndDate(rs.getString("end_date"));
							session.setEndTime(rs.getString("end_time"));
							session.setPrice(rs.getInt("price"));
							session.setEnabled(rs.getBoolean("enabled"));

							return session;
						}

					});
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}
	}

	
	public boolean editSession(Session session) {
		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("sessionId", session.getSessionId());
		params.addValue("title", session.getTitle());
		params.addValue("description", session.getDescription());
		params.addValue("startDate", session.getStartDate());
		params.addValue("startTime", session.getStartTime());
		params.addValue("endDate", session.getEndDate());
		params.addValue("endTime", session.getEndTime());
		params.addValue("price", session.getPrice());
		params.addValue("enabled", session.isEnabled());

		return jdbc.update(
				"update sessions set "
				+ "title = :title,"
				+ "description = :description,"
				+ "start_date = :startDate,"
				+ "start_time = :startTime,"
				+ "end_date = :endDate,"
				+ "end_time = :endTime,"
				+ "price = :price,"
				+ "enabled = :enabled"
				+ " where session_id = :sessionId",
				params) == 1;

	}
	

	public boolean deleteSession(Session session) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("sessionId", session.getSessionId());
		return jdbc.update("delete from sessions where session_id = :sessionId", params) == 1;
	}

}
