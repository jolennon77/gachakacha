package dto;

public class OrdersDetail {

	private int OdersDetail_ID;
	private int Orders_ID;
	private int Product_ID;
	private int Option_ID;
	private int Order_Qty;
	
	
	public OrdersDetail(int odersDetail_ID, int orders_ID, int product_ID, int option_ID, int order_Qty) {
		super();
		OdersDetail_ID = odersDetail_ID;
		Orders_ID = orders_ID;
		Product_ID = product_ID;
		Option_ID = option_ID;
		Order_Qty = order_Qty;
	}


	public OrdersDetail() {
		// TODO Auto-generated constructor stub
	}


	public int getOdersDetail_ID() {
		return OdersDetail_ID;
	}


	public void setOdersDetail_ID(int odersDetail_ID) {
		OdersDetail_ID = odersDetail_ID;
	}


	public int getOrders_ID() {
		return Orders_ID;
	}


	public void setOrders_ID(int orders_ID) {
		Orders_ID = orders_ID;
	}


	public int getProduct_ID() {
		return Product_ID;
	}


	public void setProduct_ID(int product_ID) {
		Product_ID = product_ID;
	}


	public int getOption_ID() {
		return Option_ID;
	}


	public void setOption_ID(int option_ID) {
		Option_ID = option_ID;
	}


	public int getOrder_Qty() {
		return Order_Qty;
	}


	public void setOrder_Qty(int order_Qty) {
		Order_Qty = order_Qty;
	}
	
	
	
}
