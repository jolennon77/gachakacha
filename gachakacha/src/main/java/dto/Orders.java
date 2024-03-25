package dto;

import java.sql.Timestamp;

public class Orders {
	
	 private int Orders_ID;
	 private int User_ID;
	 private int Product_ID;
	 private Timestamp Orders_Date;
	 private String Orders_Status;
	 private String Ship_Number;
	 private String Product_Img;
	 private String Orders_Memo;
	 
	public String getOrders_Memo() {
		return Orders_Memo;
	}
	public void setOrders_Memo(String orders_Memo) {
		Orders_Memo = orders_Memo;
	}
	public String getProduct_Img() {
		return Product_Img;
	}
	public void setProduct_Img(String product_Img) {
		Product_Img = product_Img;
	}
	public int getOrders_ID() {
		return Orders_ID;
	}
	public void setOrders_ID(int orders_ID) {
		Orders_ID = orders_ID;
	}
	public int getUser_ID() {
		return User_ID;
	}
	public void setUser_ID(int user_ID) {
		User_ID = user_ID;
	}
	public int getProduct_ID() {
		return Product_ID;
	}
	public void setProduct_ID(int product_ID) {
		Product_ID = product_ID;
	}
	public Timestamp getOrders_Date() {
		return Orders_Date;
	}
	public void setOrders_Date(Timestamp orders_Date) {
		Orders_Date = orders_Date;
	}
	public String getOrders_Status() {
		return Orders_Status;
	}
	public void setOrders_Status(String orders_Status) {
		Orders_Status = orders_Status;
	}
	public String getShip_Number() {
		return Ship_Number;
	}
	public void setShip_Number(String ship_Number) {
		Ship_Number = ship_Number;
	}
	
	
	
	
	
	
}