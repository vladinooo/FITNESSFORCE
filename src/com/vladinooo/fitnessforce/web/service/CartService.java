package com.vladinooo.fitnessforce.web.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vladinooo.fitnessforce.web.dao.CartDao;
import com.vladinooo.fitnessforce.web.dao.Product;

@Service("cartService")
public class CartService {
	
	@Autowired
	private CartDao cartDao;


	public CartItem getProduct(Map<String, Object> productData) {
		Product product = cartDao.getProduct(productData);
		CartItem cartItem = new CartItem();
		cartItem.setQuantity((Integer)productData.get("quantity"));
		cartItem.setUnitPrice(product.getPrice());
		cartItem.setTotalPrice(product.getPrice() * (Integer)productData.get("quantity"));
		cartItem.setProduct(product);
		return cartItem;
	}
	
	
}
