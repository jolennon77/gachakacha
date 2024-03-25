package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import dbconnection.MyDBConnection;
import dto.Info;


public class InfoDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
										
	
	private  String Info_INSERT ="insert into Review(Review_ID, Product_ID, Review_Writer, Review_Date, Review_Con, Review_Image) values(?,?,?,?,?,?)";
	private  String Info_UPDATE = "update Review set Review_Writer=?, Review_Con=? where Review_ID=?";
	private  String Info_DELETE = "delete from Review where Review_ID=?";
	private  String Info_GET = "select * from Review where Review_ID=?";
	private  String Info_GETALL ="select * from Review order by Review_ID desc";
	
	
	//검색 관련
		private String QNA_LIST_T ="select * from board where title like ? order by seq desc";
		private String QNA_LIST_C ="select * from board where content like ? order by seq desc";
		
		
		
		
		

				//Info 글 등록
					public void insertInfo(Info dto) {
						
						try {
							con = MyDBConnection.getConnection();
							pstmt = con.prepareStatement(Info_INSERT);
							
							pstmt.setInt(1, dto.getInfo_Id());
							pstmt.setInt(2, dto.getMember_ID());
							pstmt.setString(3, dto.getInfo_Title());
							pstmt.setDate(4, dto.getInfo_Date());
							pstmt.setString(5, dto.getInfo_Con());
							pstmt.setString(6, dto.getInfo_Image());
							
							pstmt.executeUpdate();
						
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}finally {
							MyDBConnection.close(rs, pstmt, con);
						}
					
					}
					
					//Review 수정
					//private String BOARD_UPDATE ="update board set title=?, content=? where seq=?";
					public void updateInfo(Info dto) {
						
						try {
							con = MyDBConnection.getConnection();
							pstmt = con.prepareStatement(Info_UPDATE);
							
							pstmt.setInt(1, dto.getInfo_Id());
							pstmt.setInt(2, dto.getMember_ID());
							pstmt.setString(3, dto.getInfo_Title());
							pstmt.setDate(4, dto.getInfo_Date());
							pstmt.setString(5, dto.getInfo_Con());
							pstmt.setString(6, dto.getInfo_Image());
							
							
							pstmt.executeUpdate();
						
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}finally {
							MyDBConnection.close(rs, pstmt, con);
						}
					
					}
					
					//Review 삭제
					
					public void deleteInfo(Info dto) {
						
						try {
							con = MyDBConnection.getConnection();
							pstmt = con.prepareStatement(Info_DELETE);
							pstmt.setInt(1, dto.getInfo_Id());
							
							pstmt.executeUpdate();
						
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}finally {
							MyDBConnection.close(rs, pstmt, con);
						}
					
					}
					
					
					
					//Review 상세 조회
					public Info getInfo(Info dto) { 
						// 번호 하나로만 검색하기에 번호를 매개값으로 받아도 되지만
						// 결과를 이용하기 해서 상세 검색을 표현하기 위해 BoardDTO로 받음
						Info board = null;
						
						try {
							con = MyDBConnection.getConnection();
							pstmt = con.prepareStatement(Info_GET);
							pstmt.setInt(1,dto.getInfo_Id());
							
							rs = pstmt.executeQuery();
							
							if(rs.next()) {
								board = new Info();
							    board.setInfo_Id(rs.getInt("Info_Id"));
							    board.setMember_ID(rs.getInt("Member_ID"));
							    board.setInfo_Title(rs.getString("Info_Title"));
							    board.setInfo_Date(rs.getDate("Info_Date"));
							    board.setInfo_Con(rs.getString("Info_Con"));
							    board.setInfo_Image(rs.getString("Info_Image"));
							    
								
							}			
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}finally {
							MyDBConnection.close(rs, pstmt, con);
						}
						return board;
					}
					
					//Review 리스트 검색
					public List<Info> getInfoList(Info dto){
						List<Info> InfoList = new ArrayList<>();
						
						try {
							con = MyDBConnection.getConnection();
							
							if(dto.getInfo_Title().equalsIgnoreCase("TITLE")) {
								pstmt = con.prepareStatement(QNA_LIST_T);
							} else if(dto.getInfo_Con().equalsIgnoreCase("CONTENT")) {
								pstmt = con.prepareStatement(QNA_LIST_C);
							}
							
							String Info_Title ="%" + dto.getInfo_Title() + "%";
							
							//pstmt.setString(1, dto.getSearchKeyword());
							pstmt.setString(1, Info_Title);
							rs = pstmt.executeQuery();
							
							while(rs.next()) {
								Info board = new Info();
								
								 board = new Info();
								
								 board.setInfo_Id(rs.getInt("Info_Id"));
								 board.setMember_ID(rs.getInt("Member_ID"));
								 board.setInfo_Title(rs.getString("Info_Title"));
								 board.setInfo_Date(rs.getDate("Info_Date"));
								 board.setInfo_Con(rs.getString("Info_Con"));
								 board.setInfo_Image(rs.getString("Info_Image"));
							    
								 InfoList.add(board);
							}			
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}finally {
							MyDBConnection.close(rs, pstmt, con);
						}
					
						return InfoList;
						
					}
									
					
					public List<Info> getInfoAll(){
						List<Info> InfoList = new ArrayList<>();
						
						try {
							con = MyDBConnection.getConnection();
							pstmt = con.prepareStatement(Info_GETALL);
							rs = pstmt.executeQuery();
							
							while(rs.next()) {
								Info board = new Info();
								
								board = new Info();
							    board.setInfo_Id(rs.getInt("Info_Id"));
							    board.setMember_ID(rs.getInt("Member_ID"));
							    board.setInfo_Title(rs.getString("Info_Title"));
							    board.setInfo_Date(rs.getDate("Info_Date"));
							    board.setInfo_Con(rs.getString("Info_Con"));
							    board.setInfo_Image(rs.getString("Info_Image"));
							    
							    
							    InfoList.add(board);
							}			
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}finally {
							MyDBConnection.close(rs, pstmt, con);
						}
					
						return InfoList;
						
					}
					


}
