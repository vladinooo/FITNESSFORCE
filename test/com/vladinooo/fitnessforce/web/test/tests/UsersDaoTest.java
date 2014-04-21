package com.vladinooo.fitnessforce.web.test.tests;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ActiveProfiles("dev")
@ContextConfiguration(locations = {
		"classpath:com/vladinooo/fitnessforce/web/config/dao-context.xml",
		"classpath:com/vladinooo/fitnessforce/web/test/config/datasource.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class UsersDaoTest {
	
	@Test
	public void testCreateUser() {
		assertEquals("Dummy test", 1, 1);
	}

}
