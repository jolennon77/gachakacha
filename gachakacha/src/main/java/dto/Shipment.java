package dto;

public class Shipment {

	private int Shipment_ID;
	private int Order_ID;
	private String Shipping_Status;
	private String Tracking_Number;
	
	
	
	public Shipment(int shipment_ID, int order_ID, String shipping_Status, String tracking_Number) {
		super();
		Shipment_ID = shipment_ID;
		Order_ID = order_ID;
		Shipping_Status = shipping_Status;
		Tracking_Number = tracking_Number;
	}
	
	public Shipment() {
		super();
	}



	public int getShipment_ID() {
		return Shipment_ID;
	}



	public void setShipment_ID(int shipment_ID) {
		Shipment_ID = shipment_ID;
	}



	public int getOrder_ID() {
		return Order_ID;
	}



	public void setOrder_ID(int order_ID) {
		Order_ID = order_ID;
	}



	public String getShipping_Status() {
		return Shipping_Status;
	}



	public void setShipping_Status(String shipping_Status) {
		Shipping_Status = shipping_Status;
	}



	public String getTracking_Number() {
		return Tracking_Number;
	}



	public void setTracking_Number(String tracking_Number) {
		Tracking_Number = tracking_Number;
	}
	
	
	
	
	
	
}
