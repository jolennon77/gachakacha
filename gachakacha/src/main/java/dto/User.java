package dto;

import java.sql.Date;

public class User {
    private int id;
    private String email;
    private String name;
    private String password;
    private String phone;
    private String gender;
    private String birth;
    private String zonecode;
    private String address;
    private String aut;
    private Date singupDate;
    
    
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getZonecode() {
		return zonecode;
	}
	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getsingupDate() {
		return singupDate;
	}
	public void setsingupDate(Date singupDate) {
		this.singupDate = singupDate;
	}
	public String getAut() {
		return aut;
	}
	public void setAut(String aut) {
		this.aut = aut;
	}
    
    
}
