package com.vladinooo.fitnessforce.web.service;

import java.util.ArrayList;

public class Cart {

	private int totalPrice;
	private ArrayList<CartItem> items;

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public ArrayList<CartItem> getItems() {
		return items;
	}

	public void setItems(ArrayList<CartItem> items) {
		this.items = items;
	}

}
