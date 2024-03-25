package dto;

import java.sql.Date;

public class QnA {
	

	private int QnA_Id;
	private String QnA_Cat;
	private int Product_ID;
	private int Customer_ID;
	private String QnA_Title;
	private String QnA_Content;
	private Date QnA_Date;
	private String QnA_Writer;
	
	
	public QnA() {
		super();
	}
	
	public int getQnA_Id() {
		return QnA_Id;
	}
	public void setQnA_Id(int qnA_Id) {
		QnA_Id = qnA_Id;
	}
	public String getQnA_Cat() {
		return QnA_Cat;
	}
	public void setQnA_Cat(String qnA_Cat) {
		QnA_Cat = qnA_Cat;
	}
	public int getProduct_ID() {
		return Product_ID;
	}
	public void setProduct_ID(int product_ID) {
		Product_ID = product_ID;
	}
	public int getCustomer_ID() {
		return Customer_ID;
	}
	public void setCustomer_ID(int customer_ID) {
		Customer_ID = customer_ID;
	}
	public String getQnA_Title() {
		return QnA_Title;
	}
	public void setQnA_Title(String qnA_Title) {
		QnA_Title = qnA_Title;
	}
	public String getQnA_Content() {
		return QnA_Content;
	}
	public void setQnA_Content(String qnA_Content) {
		QnA_Content = qnA_Content;
	}
	public Date getQnA_Date() {
		return QnA_Date;
	}
	public void setQnA_Date(Date qnA_Date) {
		QnA_Date = qnA_Date;
	}
	public String getQnA_Writer() {
		return QnA_Writer;
	}
	public void setQnA_Writer(String qnA_Writer) {
		QnA_Writer = qnA_Writer;
	}

	
	
	
	
}
