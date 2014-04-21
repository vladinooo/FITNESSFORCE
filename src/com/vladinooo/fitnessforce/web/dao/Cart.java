package com.vladinooo.fitnessforce.web.dao;

import java.util.ArrayList;

public class Cart {

	private int totalPrice;
	private ArrayList<Object> items;

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public ArrayList<Object> getItems() {
		return items;
	}

	public void setItems(ArrayList<Object> items) {
		this.items = items;
	}

}
