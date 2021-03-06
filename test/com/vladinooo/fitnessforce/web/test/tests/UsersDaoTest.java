package com.vladinooo.fitnessforce.web.test.tests;

import static org.junit.Assert.assertEquals;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vladinooo.fitnessforce.web.dao.UsersDao;

@ActiveProfiles("dev")
@ContextConfiguration(locations = {
		"classpath:com/vladinooo/fitnessforce/web/config/dao-context.xml",
		"classpath:com/vladinooo/fitnessforce/web/test/config/datasource.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class UsersDaoTest {
	
	@Autowired
	private UsersDao usersDao;
	
	@Autowired
	private DataSource dataSource;
	
	@Before
	public void init() {
		JdbcTemplate jdbc = new JdbcTemplate(dataSource);
		
		
		jdbc.execute("delete from user_roles");
		jdbc.execute("delete from users");
	}
	
	@Test
	public void testCreateUser() {
		assertEquals("Dummy test", 1, 1);
	}

}
