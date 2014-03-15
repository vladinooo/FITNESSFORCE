package com.vladinooo.fitnessforce.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
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
		
		MapSqlParameterSource params = new MapSqlParameterSource();
		
		params.addValue("username", user.getUsername());
		params.addValue("password", user.getPassword());
		params.addValue("email", user.getEmail());
		params.addValue("dateRegistered", user.getDateRegistered());
		params.addValue("rolename", user.getRolename());
		
		jdbc.update("insert into users (username, password, email, date_registered) values (:username, :password, :email, :dateRegistered)", params);
		
		return  jdbc.update("insert into user_roles (rolename, user_id) values (:rolename, (select user_id from users where username = :username))", params) == 1;
	}
	
	public User getUser(String username) {
		return jdbc.queryForObject("select * from users where username = :username", 
				new MapSqlParameterSource("username", username), User.class);
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

	public boolean userExists(String username) {
		return jdbc.queryForObject("select count(*) from users where username=:username", 
				new MapSqlParameterSource("username", username), Integer.class) > 0;
	}
	
}
