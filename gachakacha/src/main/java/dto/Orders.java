package dto;

import java.sql.Date;

public class Orders {
	
	private int Order_Id;
	private int User_Id;
	private int Product_ID;	
	private Date Order_Date ;
	private String Orders_Status;
	private String Ship_Number;
	
	
	public Orders(int order_Id, int user_Id, int product_ID, Date order_Date, String orders_Status,
			String ship_Number) {
		super();
		Order_Id = order_Id;
		User_Id = user_Id;
		Product_ID = product_ID;
		Order_Date = order_Date;
		Orders_Status = orders_Status;
		Ship_Number = ship_Number;
	}


	public Orders() {
		
	}


	public int getOrder_Id() {
		return Order_Id;
	}


	public void setOrder_Id(int order_Id) {
		Order_Id = order_Id;
	}


	public int getUser_Id() {
		return User_Id;
	}


	public void setUser_Id(int user_Id) {
		User_Id = user_Id;
	}


	public int getProduct_ID() {
		return Product_ID;
	}


	public void setProduct_ID(int product_ID) {
		Product_ID = product_ID;
	}


	public Date getOrder_Date() {
		return Order_Date;
	}


	public void setOrder_Date(Date order_Date) {
		Order_Date = order_Date;
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
