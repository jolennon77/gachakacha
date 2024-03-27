package dto;

import java.sql.Timestamp;

public class Board {

	
	private int Board_ID;
	private String Board_Cat1; 
	private String Board_Cat2;
	private int Product_Id;
    private String Board_Title;
	private int User_ID;
    private Timestamp Board_CreateDate;
    private String Board_Pwd;
    private String Board_Content;
    private String User_Name;
    private String Product_Img;
    
    
    public String getProduct_Img() {
		return Product_Img;
	}
	public void setProduct_Img(String product_Img) {
		Product_Img = product_Img;
	}
	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}
	public String getUser_Name() {
		return User_Name;
	}
	public int getBoard_ID() {
		return Board_ID;
	}
	public void setBoard_ID(int board_ID) {
		Board_ID = board_ID;
	}
	public String getBoard_Cat1() {
		return Board_Cat1;
	}
	public void setBoard_Cat1(String board_Cat1) {
		Board_Cat1 = board_Cat1;
	}
	public String getBoard_Cat2() {
		return Board_Cat2;
	}
	public void setBoard_Cat2(String board_Cat2) {
		Board_Cat2 = board_Cat2;
	}
	public int getProduct_Id() {
		return Product_Id;
	}
	public void setProduct_Id(int product_Id) {
		Product_Id = product_Id;
	}
	public String getBoard_Title() {
		return Board_Title;
	}
	public void setBoard_Title(String board_Title) {
		Board_Title = board_Title;
	}
	public int getUser_ID() {
		return User_ID;
	}
	public void setUser_ID(int user_ID) {
		User_ID = user_ID;
	}
	public Timestamp getBoard_CreateDate() {
		return Board_CreateDate;
	}
	public void setBoard_CreateDate(Timestamp board_CreateDate) {
		Board_CreateDate = board_CreateDate;
	}
	public String getBoard_Pwd() {
		return Board_Pwd;
	}
	public void setBoard_Pwd(String board_Pwd) {
		Board_Pwd = board_Pwd;
	}
	public String getBoard_Content() {
		return Board_Content;
	}
	public void setBoard_Content(String board_Content) {
		Board_Content = board_Content;
	}

}
