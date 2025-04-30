package com.silk.model;

import java.time.LocalDate;

public class TakeawayModel {
	private int takeaway_id;
	private int user_id;
	private int icecream_id;
	private int quantity;
	private LocalDate order_date;
	private String status;
	public TakeawayModel(int takeaway_id, int user_id, int icecream_id, int quantity, LocalDate order_date,
			String status) {
		super();
		this.takeaway_id = takeaway_id;
		this.user_id = user_id;
		this.icecream_id = icecream_id;
		this.quantity = quantity;
		this.order_date = order_date;
		this.status = status;
	}
	public int gettakeaway_id() {
		return takeaway_id;
	}
	public void settakeaway_id(int takeaway_id) {
		this.takeaway_id = takeaway_id;
	}
	public int getuser_id() {
		return user_id;
	}
	public void setuser_id(int user_id) {
		this.user_id = user_id;
	}
	public int geticecream_id() {
		return icecream_id;
	}
	public void seticecream_id(int icecream_id) {
		this.icecream_id = icecream_id;
	}
	public int getquantity() {
		return quantity;
	}
	public void setquantity(int quantity) {
		this.quantity = quantity;
	}
	public LocalDate getorder_date() {
		return order_date;
	}
	public void setorder_date(LocalDate order_date) {
		this.order_date = order_date;
	}
	public String getstatus() {
		return status;
	}
	public void setstatus(String status) {
		this.status = status;
	}
	
	

}
