package com.vladinooo.fitnessforce.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
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

//	
//	public void getCartItem(int id) {
//
//		MapSqlParameterSource params = new MapSqlParameterSource();
//		params.addValue("id", id);
//		
//		Product product = jdbc.queryForObject( "select * from products where id = :id", params, new RowMapper<Product>() {
//							public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
//							Product product = new Product();
//							product.setProductId(rs.getInt("product_id"));
//							product.setType(rs.getString("type"));
//							return product;
//						}
//
//		});
//		
//		System.out.println(product.getProductId() + " - " + product.getType());
//		
//		
//	}

	
}
