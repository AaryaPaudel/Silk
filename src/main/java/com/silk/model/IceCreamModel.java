package com.silk.model;

public class IceCreamModel {
	private int icecream_Id;
	private String iceCream_Name;
	private int iceCream_Price;
	private String iceCream_Type;
	private String iceCream_Desc;
	private String iceCream_Availability;
	
	public IceCreamModel(int icecream_Id, String iceCream_Name, int iceCream_Price, String iceCream_Type, String iceCream_Desc,
			String iceCream_Availability) {
		super();
		this.icecream_Id = icecream_Id;
		this.iceCream_Name = iceCream_Name;
		this.iceCream_Price = iceCream_Price;
		this.iceCream_Type = iceCream_Type;
		this.iceCream_Desc = iceCream_Desc;
		this.iceCream_Availability = iceCream_Availability;
	}
	
	public int geticecream_Id() {
		return icecream_Id;
	}
	public void seticecream_Id(int icecream_Id) {
		this.icecream_Id = icecream_Id;
	}
	public String geticeCream_name() {
		return iceCream_Name;
	}
	public void seticeCream_Name(String iceCream_Name) {
		this.iceCream_Name = iceCream_Name;
	}
	public int geticeCream_Price() {
		return iceCream_Price;
	}
	public void seticeCream_Price(int iceCream_Price) {
		this.iceCream_Price = iceCream_Price;
	}
	public String geticeCream_Type() {
		return iceCream_Type;
	}
	public void seticeCream_Type(String iceCream_Type) {
		this.iceCream_Type = iceCream_Type;
	}
	public String geticeCream_Desc() {
		return iceCream_Desc;
	}
	public void seticeCream_Desc(String iceCream_Desc) {
		this.iceCream_Desc = iceCream_Desc;
	}
	public String geticeCream_Availability() {
		return iceCream_Availability;
	}
	public void seticeCream_Availability(String iceCream_Availability) {
		this.iceCream_Availability = iceCream_Availability;
	}
	
	
	

}
