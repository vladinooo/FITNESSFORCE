package com.vladinooo.fitnessforce.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component("usersDao")
public class UsersDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<User> getUsers() {

		return jdbc.query("select * from users", new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();

				user.setUserId(rs.getInt("user_id"));
				user.setUsername(rs.getString("user_name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setDateRegistered(rs.getString("date_registered"));
				user.setEnabled(rs.getBoolean("enabled"));
				return user;
			}

		});
	}
	
//	public boolean update(Offer offer) {
//		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(offer);
//		
//		return jdbc.update("update offers set name=:name, text=:text, email=:email where id=:id", params) == 1;
//	}
//	
	@Transactional
	public boolean createUser(User user) {
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(user);
		
		jdbc.update("insert into users (username, password, email) values (:username, :password, :email)", params);
		
		return jdbc.update("insert into user_roles (rolename, password, email) values (:username, :password, :email)", params) == 1;
	}
//	
//	@Transactional
//	public int[] create(List<Offer> offers) {
//		
//		SqlParameterSource[] params = SqlParameterSourceUtils.createBatch(offers.toArray());
//		
//		return jdbc.batchUpdate("insert into offers (id, name, text, email) values (:id, :name, :text, :email)", params);
//	}
//	
//	public boolean delete(int id) {
//		MapSqlParameterSource params = new MapSqlParameterSource("id", id);
//		
//		return jdbc.update("delete from offers where id=:id", params) == 1;
//	}
//
//	public Offer getOffer(int id) {
//
//		MapSqlParameterSource params = new MapSqlParameterSource();
//		params.addValue("id", id);
//
//		return jdbc.queryForObject("select * from offers where id=:id", params,
//				new RowMapper<Offer>() {
//
//					public Offer mapRow(ResultSet rs, int rowNum)
//							throws SQLException {
//						Offer offer = new Offer();
//
//						offer.setId(rs.getInt("id"));
//						offer.setName(rs.getString("name"));
//						offer.setText(rs.getString("text"));
//						offer.setEmail(rs.getString("email"));
//
//						return offer;
//					}
//
//				});
//	}
	
}
