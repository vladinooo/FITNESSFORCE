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
				.query("SELECT * FROM products INNER JOIN sessions ON products.product_id = sessions.product_id",
						new RowMapper<Session>() {

							public Session mapRow(ResultSet rs, int rowNum)
									throws SQLException {
								Session session = new Session();
								session.setId(rs.getInt("product_id"));
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
		productParams.addValue("title", session.getTitle());
		productParams.addValue("description", "");
		productParams.addValue("price", "");
		
		jdbc.update("INSERT INTO products ("
				+ "type,"
				+ "title,"
				+ "description,"
				+ "price) VALUES ("
				+ ":type,"
				+ ":title,"
				+ ":description,"
				+ "price)", productParams);
		
		
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
		
		sessionParams.addValue("color", session.getColor());
		sessionParams.addValue("allDay", session.isAllDay());
		sessionParams.addValue("start", new Timestamp(start.getTime()));
		sessionParams.addValue("end", new Timestamp(end.getTime()));
				
		return jdbc.update(
				"INSERT INTO sessions ("
				+ "color,"
				+ "allDay,"
				+ "start,"
				+ "end,"
				+ "product_id) VALUES ("
				+ ":color,"
				+ ":allDay,"
				+ ":start,"
				+ ":end,"
				+ "(SELECT MAX(product_id) FROM products WHERE type = 'session'))",
				sessionParams) == 1;	
	}

	
	public Session getSession(int productId) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("productId", productId);

		try {

			return jdbc.queryForObject(
					"SELECT * FROM products INNER JOIN sessions ON products.product_id = sessions.product_id WHERE product_id = productId", params,
					new RowMapper<Session>() {

						public Session mapRow(ResultSet rs, int rowNum)
								throws SQLException {
							
							Session session = new Session();
							session.setId(rs.getInt("product_id"));
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

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("productId", session.getId());
		params.addValue("title", session.getTitle());
		params.addValue("description", session.getDescription());
		params.addValue("price", session.getPrice());
		params.addValue("color", session.getColor());
		params.addValue("allDay", session.isAllDay());
		params.addValue("start", new Timestamp(start.getTime()));
		params.addValue("end", new Timestamp(end.getTime()));
		
		jdbc.update(
				"UPDATE products SET "
				+ "title = :title,"
				+ "description = :description,"
				+ "price = :price,"
				+ " WHERE product_id = :productId",
				params);
		
		return jdbc.update(
				"UPDATE sessions SET "
				+ "color = :color,"
				+ "allDay = :allDay,"
				+ "start = :start,"
				+ "end = :end"
				+ " WHERE session_id = :productId",
				params) == 1;
	}
	

	public boolean deleteSession(Session session) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("sessionId", session.getId());
		
		return jdbc.update("DELETE FROM products "
				+ "USING products, sessions "
				+ "WHERE products.product_id = sessions.product_id "
				+ "AND sessions.session_id = :sessionId", params) == 1;

	}

}
