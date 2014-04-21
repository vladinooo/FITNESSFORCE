package com.vladinooo.fitnessforce.web.service;

import java.io.Serializable;

import com.vladinooo.fitnessforce.web.dao.Product;

public class CartItem implements Serializable {


	private static final long serialVersionUID = 7236422082878488839L;
	
	private int quantity;
	private int unitPrice;
	private int totalPrice;
	private Product product;

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
