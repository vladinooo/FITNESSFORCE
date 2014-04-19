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
		
		MapSqlParameterSource productParams = new MapSqlParameterSource();
		productParams.addValue("type", "session");
		
		jdbc.update("insert into products (type) values (:type)", productParams);
		
		
		MapSqlParameterSource sessionParams = new MapSqlParameterSource();

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
		
		sessionParams.addValue("title", session.getTitle());
		sessionParams.addValue("description", "");
		sessionParams.addValue("price", "");
		sessionParams.addValue("color", session.getColor());
		sessionParams.addValue("allDay", session.isAllDay());
		sessionParams.addValue("start", new Timestamp(start.getTime()));
		sessionParams.addValue("end", new Timestamp(end.getTime()));
				
		return jdbc.update(
				"insert into sessions ("
				+ "title,"
				+ "description,"
				+ "price,"
				+ "color,"
				+ "allDay,"
				+ "start,"
				+ "end,"
				+ "product_id) values ("
				+ ":title,"
				+ ":description,"
				+ ":price,"
				+ ":color,"
				+ ":allDay,"
				+ ":start,"
				+ ":end,"
				+ "(select MAX(product_id) from products where type = 'session'))",
				sessionParams) == 1;	
	}

	
	public Session getSession(int id) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", id);

		try {

			return jdbc.queryForObject(
					"select * from sessions where id = :id", params,
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
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}
	}

	
	public boolean editSession(Session session) {
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

		params.addValue("id", session.getId());
		params.addValue("title", session.getTitle());
		params.addValue("description", session.getDescription());
		params.addValue("price", session.getPrice());
		params.addValue("color", session.getColor());
		params.addValue("allDay", session.isAllDay());
		params.addValue("start", new Timestamp(start.getTime()));
		params.addValue("end", new Timestamp(end.getTime()));
		
		return jdbc.update(
				"update sessions set "
				+ "title = :title,"
				+ "description = :description,"
				+ "price = :price,"
				+ "color = :color,"
				+ "allDay = :allDay,"
				+ "start = :start,"
				+ "end = :end"
				+ " where id = :id",
				params) == 1;
	}
	

	public boolean deleteSession(Session session) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("sessionId", session.getId());
		
		return jdbc.update("DELETE FROM products "
				+ "USING products, sessions "
				+ "WHERE products.product_id = sessions.product_id "
				+ "AND sessions.id = :sessionId", params) == 1;

	}

}
