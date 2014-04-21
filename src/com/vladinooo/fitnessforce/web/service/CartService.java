package com.vladinooo.fitnessforce.web.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vladinooo.fitnessforce.web.dao.CartDao;

@Service("cartService")
public class CartService {
	
	@Autowired
	private CartDao cartDao;


	public void getCartItem(Map<String, Object> product) {
		int id = (Integer)product.get("id");
		cartDao.getCartItem(id);
	}
	
	
}
