package dto;

public class Product {
	private int product_Id;
	private String product_Type;
	private String product_Cat;
	private String product_Name;
	private int product_Price;
	private String product_Img;
	private String product_Con;

	// setter 및 getter 메서드 추가
	public int getProduct_Id() {
		return product_Id;
	}

	public void setProduct_Id(int product_Id) {
		this.product_Id = product_Id;
	}

	public String getProduct_Type() {
		return product_Type;
	}

	public void setProduct_Type(String product_Type) {
		this.product_Type = product_Type;
	}

	public String getProduct_Cat() {
		return product_Cat;
	}

	public void setProduct_Cat(String product_Cat) {
		this.product_Cat = product_Cat;
	}

	public String getProduct_Name() {
		return product_Name;
	}

	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}

	public int getProduct_Price() {
		return product_Price;
	}

	public void setProduct_Price(int product_Price) {
		this.product_Price = product_Price;
	}

	public String getProduct_Img() {
		return product_Img;
	}

	public void setProduct_Img(String product_Img) {
		this.product_Img = product_Img;
	}

	public String getProduct_Con() {
		return product_Con;
	}

	public void setProduct_Con(String product_Con) {
		this.product_Con = product_Con;
	}
}
