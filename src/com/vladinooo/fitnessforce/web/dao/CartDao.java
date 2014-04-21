package com.vladinooo.fitnessforce.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("cartDao")
public class CartDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	
	public Product getProduct(Map<String, Object> productData) {
		String productType = (String)productData.get("type");
		if (productType.equals("session")) {
			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("productId", (Integer)productData.get("id"));
			
			try {
				return jdbc.queryForObject(
						"SELECT * FROM products INNER JOIN sessions ON products.product_id = sessions.product_id WHERE products.product_id = :productId", params,
						new RowMapper<Session>() {

							public Session mapRow(ResultSet rs, int rowNum)
									throws SQLException {
								
								Session session = new Session();
								session.setId(rs.getInt("product_id"));
								session.setTitle(rs.getString("title"));
								session.setDescription(rs.getString("description"));
								session.setPrice(rs.getInt("price"));
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
		else if (productType.equals("item")) {
			// get item
			return null;
		}
		else {
			return null;
		}
	}
	
	
}
