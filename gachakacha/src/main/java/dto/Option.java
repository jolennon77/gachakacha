package dto;

public class Option {
	private int option_ID;
	private int product_ID;
	private String option_Name;
	private String option_Grade;
	private int option_Qty;
	private String option_Img;
	private int order_Qty;
	
	
	public int getOrder_Qty() {
		return order_Qty;
	}

	public void setOrder_Qty(int order_Qty) {
		this.order_Qty = order_Qty;
	}

	public int getOption_ID() {
		return option_ID;
	}

	public void setOption_ID(int option_ID) {
	this.option_ID = option_ID;
	}

	public int getProduct_ID() {
		return product_ID;
	}

	public void setProduct_ID(int product_ID) {
		this.product_ID = product_ID;
	}

	public String getOption_Name() {
		return option_Name;
	}

	public void setOption_Name(String option_Name) {
		this.option_Name = option_Name;
	}

	public String getOption_Grade() {
		return option_Grade;
	}

	public void setOption_Grade(String option_Grade) {
		this.option_Grade = option_Grade;
	}

	public int getOption_Qty() {
		return option_Qty;
	}

	public void setOption_Qty(int option_Qty) {
		this.option_Qty = option_Qty;
	}

	public String getOption_Img() {
		return option_Img;
	}

	public void setOption_Img(String option_Img) {
		this.option_Img = option_Img;
	}

}
