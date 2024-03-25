package dto;

import java.sql.Date;

public class Review {

	private int Review_ID;
	private int Product_ID;
	private String Review_Writer;
	private Date Review_Date;
	private String  Review_Con;
	private  String Review_Image;
	
	
	public Review() {
		super();
	}
	
	public int getReview_ID() {
		return Review_ID;
	}
	public void setReview_ID(int review_ID) {
		Review_ID = review_ID;
	}
	public int getProduct_ID() {
		return Product_ID;
	}
	public void setProduct_ID(int product_ID) {
		Product_ID = product_ID;
	}
	public String getReview_Writer() {
		return Review_Writer;
	}
	public void setReview_Writer(String review_Writer) {
		Review_Writer = review_Writer;
	}
	public Date getReview_Date() {
		return Review_Date;
	}
	public void setReview_Date(Date review_Date) {
		Review_Date = review_Date;
	}
	public String getReview_Con() {
		return Review_Con;
	}
	public void setReview_Con(String review_Con) {
		Review_Con = review_Con;
	}
	public String getReview_Image() {
		return Review_Image;
	}
	public void setReview_Image(String review_Image) {
		Review_Image = review_Image;
	}
	
	
	
	
	
}
