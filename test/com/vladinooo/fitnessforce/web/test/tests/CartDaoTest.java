package com.vladinooo.fitnessforce.web.test.tests;

import static org.junit.Assert.assertTrue;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vladinooo.fitnessforce.web.dao.CartDao;
import com.vladinooo.fitnessforce.web.dao.Session;
import com.vladinooo.fitnessforce.web.dao.TimetableDao;

@ActiveProfiles("dev")
@ContextConfiguration(locations = {
		"classpath:com/vladinooo/fitnessforce/web/config/dao-context.xml",
		"classpath:com/vladinooo/fitnessforce/web/test/config/datasource.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class CartDaoTest {
	

	@Autowired
	private TimetableDao timetableDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private DataSource dataSource;
	
	@Before
	public void init() {
		JdbcTemplate jdbc = new JdbcTemplate(dataSource);
		
		
		jdbc.execute("delete from products");
		jdbc.execute("delete from items");
		jdbc.execute("delete from sessions");
	}
	
//	@Test
//	public void testCreateSession() {
//		
//		Session session = new Session("Body pump", "Very intense training.", "50", "Blue", false, "1398067200", "1398070800");
//		assertTrue("Create session should return true", timetableDao.createSession(session));
//	}
//	
//	@Test
//	public void testGetCartItem() {
//		
//		
//		assertNotNull("Get cart item should return true", cartDao.getCartItem(1));
//	}

}
