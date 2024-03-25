package dto;

import java.sql.Date;

public class Info {

	
	private int Info_Id;
	private int Member_ID;
	private String Info_Title;
	private Date Info_Date;
	private String Info_Con;
	private String Info_Image;
	
	
	public Info() {
		super();
	}
	
	
	public int getInfo_Id() {
		return Info_Id;
	}
	public void setInfo_Id(int info_Id) {
		Info_Id = info_Id;
	}
	public int getMember_ID() {
		return Member_ID;
	}
	public void setMember_ID(int member_ID) {
		Member_ID = member_ID;
	}
	public String getInfo_Title() {
		return Info_Title;
	}
	public void setInfo_Title(String info_Title) {
		Info_Title = info_Title;
	}
	public Date getInfo_Date() {
		return Info_Date;
	}
	public void setInfo_Date(Date info_Date) {
		Info_Date = info_Date;
	}
	public String getInfo_Con() {
		return Info_Con;
	}
	public void setInfo_Con(String info_Con) {
		Info_Con = info_Con;
	}
	public String getInfo_Image() {
		return Info_Image;
	}
	public void setInfo_Image(String info_Image) {
		Info_Image = info_Image;
	}
	
	
	
	
	
	
	

}
