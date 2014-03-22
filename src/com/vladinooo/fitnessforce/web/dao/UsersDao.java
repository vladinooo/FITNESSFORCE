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
import org.springframework.transaction.annotation.Transactional;

@Component("usersDao")
public class UsersDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<User> getUsers() {

		return jdbc
				.query("SELECT * FROM users u, user_roles r WHERE u.user_id = r.user_id",
						new RowMapper<User>() {

							public User mapRow(ResultSet rs, int rowNum)
									throws SQLException {
								User user = new User();

								user.setUserId(rs.getInt("u.user_id"));
								user.setUsername(rs.getString("u.username"));
								user.setPassword(rs.getString("u.password"));
								user.setEmail(rs.getString("u.email"));
								user.setDateRegistered(rs
										.getString("u.date_registered"));
								user.setEnabled(rs.getBoolean("u.enabled"));
								user.setRolename(rs.getString("r.rolename"));
								return user;
							}

						});
	}

	@Transactional
	public boolean createUser(User user) {

		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("username", user.getUsername());
		params.addValue("password", user.getPassword());
		params.addValue("email", user.getEmail());
		params.addValue("dateRegistered", user.getDateRegistered());
		params.addValue("rolename", user.getRolename());

		jdbc.update(
				"insert into users (username, password, email, date_registered) values (:username, :password, :email, :dateRegistered)",
				params);

		return jdbc
				.update("insert into user_roles (rolename, user_id) values (:rolename, (select user_id from users where username = :username))",
						params) == 1;
	}

	public User getUser(int userId) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("userId", userId);

		try {

			return jdbc.queryForObject(
					"select * from users where user_id = :userId", params,
					new RowMapper<User>() {

						public User mapRow(ResultSet rs, int rowNum)
								throws SQLException {
							User user = new User();

							user.setUserId(rs.getInt("user_id"));
							user.setUsername(rs.getString("username"));
							user.setPassword(rs.getString("password"));
							user.setEmail(rs.getString("email"));
							user.setDateRegistered(rs
									.getString("date_registered"));
							user.setEnabled(rs.getBoolean("enabled"));

							return user;
						}

					});
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}
	}

	public User getUser(String username) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);

		try {

			return jdbc.queryForObject(
					"select * from users where username = :username", params,
					new RowMapper<User>() {

						public User mapRow(ResultSet rs, int rowNum)
								throws SQLException {
							User user = new User();

							user.setUserId(rs.getInt("user_id"));
							user.setUsername(rs.getString("username"));
							user.setPassword(rs.getString("password"));
							user.setEmail(rs.getString("email"));
							user.setDateRegistered(rs
									.getString("date_registered"));
							user.setEnabled(rs.getBoolean("enabled"));

							return user;
						}

					});
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}
	}

	public boolean userExists(String username) {
		return jdbc.queryForObject(
				"select count(*) from users where username=:username",
				new MapSqlParameterSource("username", username), Integer.class) > 0;
	}

	
	@Transactional
	public boolean editUser(User user) {
		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("userId", user.getUserId());
		params.addValue("password", user.getPassword());
		params.addValue("email", user.getEmail());
		params.addValue("firstname", user.getFirstname());
		params.addValue("surname", user.getSurname());
		params.addValue("age", user.getAge());
		params.addValue("phone", user.getPhone());
		params.addValue("gender", user.getGender());
		params.addValue("bio", user.getBio());
		params.addValue("enabled", user.isEnabled());
		params.addValue("rolename", user.getRolename());

		jdbc.update(
				"update users set "
				+ "password = :password,"
				+ "email = :email,"
				+ "firstname = :firstname,"
				+ "surname = :surname,"
				+ "age = :age,"
				+ "phone = :phone,"
				+ "gender = :gender,"
				+ "bio = :bio,"
				+ "enabled = :enabled",
				params);

		return jdbc.update(
				"update user_roles set rolename = :rolename where user_id = :userId",
						params) == 1;
	}
	

	@Transactional
	public boolean deleteUser(User user) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("userId", user.getUserId());
		jdbc.update("delete from user_roles where user_id = :userId", params);
		return jdbc.update("delete from users where user_id = :userId", params) == 1;
	}

}
