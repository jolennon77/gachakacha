package dto;

public class Sale {

	private int sale_ID;
	private int product_ID;
	private int regular_Price;
	private int sale_Price;
	private double discount_Rate;
	private String sale_Description;

	
	
	public int getSale_ID() {
		return sale_ID;
	}
	public void setSale_ID(int sale_ID) {
		this.sale_ID = sale_ID;
	}
	public int getProduct_ID() {
		return product_ID;
	}
	public void setProduct_ID(int product_ID) {
		this.product_ID = product_ID;
	}
	public int getRegular_Price() {
		return regular_Price;
	}
	public void setRegular_Price(int regular_Price) {
		this.regular_Price = regular_Price;
	}
	public int getSale_Price() {
		return sale_Price;
	}
	public void setSale_Price(int sale_Price) {
		this.sale_Price = sale_Price;
	}
	public double getDiscount_Rate() {
		return discount_Rate;
	}
	public void setDiscount_Rate(double discount_Rate) {
		this.discount_Rate = discount_Rate;
	}
	public String getSale_Description() {
		return sale_Description;
	}
	public void setSale_Description(String sale_Description) {
		this.sale_Description = sale_Description;
	}
	
}