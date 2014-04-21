package com.vladinooo.fitnessforce.web.dao;

import java.io.Serializable;

public class Test implements Serializable{


	private static final long serialVersionUID = 7108816692759471823L;
	
	private int total;
	
	public Test() {
		this.total = 0;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
