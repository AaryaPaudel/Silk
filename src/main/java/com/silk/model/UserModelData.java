package com.silk.model;

import java.time.LocalDate;

public class UserModelData {
	public int user_id;
	public String firstName;
	public String lastName;
	public LocalDate birthDate;
	public String phonenumber;
	public String address;
	public String email;
	public String username;
	public String password;
	public String imageUrl;
	
	public UserModelData() {}

	public UserModelData(String firstName, String lastName, LocalDate birthDate, String phonenumber,
			String address, String email, String username, String password, String imageUrl) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthDate = birthDate;
		this.phonenumber = phonenumber;
		this.address = address;
		this.email = email;
		this.username = username;
		this.password = password;
		this.imageUrl = imageUrl;
		
	}
	
	public UserModelData(String username, String password) {
		this.username= username;
		this.password = password;
	}
	
	public UserModelData(String username, LocalDate birthDate, String phonenumber,
			String email, String password,String imageUrl) {
		this.birthDate = birthDate;
		this.phonenumber = phonenumber;
		this.email = email;
		this.username = username;
		this.password = password;
		this.imageUrl = imageUrl;
		
	}

	public int getuser_id() {
		return user_id;
	}

	public void setuser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getfirstName() {
		return firstName;
	}

	public void setfirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getlastName() {
		return lastName;
	}

	public void setlastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDate getbirthDate() {
		return birthDate;
	}

	public void setbirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public String getphonenumber() {
		return phonenumber;
	}

	public void setphonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getaddress() {
		return address;
	}

	public void setaddress(String address) {
		this.address = address;
	}

	public String getemail() {
		return email;
	}

	public void setemail(String email) {
		this.email = email;
	}

	public String getusername() {
		return username;
	}

	public void setusername(String username) {
		this.username = username;
	}

	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password = password;
	}
	
	public String getimageUrl() {
		return imageUrl;
	}

	public void setimageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	
}