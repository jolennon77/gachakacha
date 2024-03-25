package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;
import dto.QnA;

public class QnADAO {
	
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
	
	//QNA							
		private  String QNA_INSERT ="insert into QNA(QnA_Cat, Product_ID, Customer_ID, QnA_Title, QnA_Content, QnA_Date ,QnA_Writer) values(?,?,?,?,?,?,?)";
		private  String QNA_UPDATE = "update QNA set QnA_Title=?, QnA_Content=? where QnA_Id=?";
		private  String QNA_DELETE = "delete from QNA where QnA_Id=?";
		private  String QNA_GET = "select * from QNA where QnA_Id=?";
		private  String QNA_GETALL ="select * from QNA order by QnA_Id desc";
		
		//검색 관련
		private String QNA_LIST_T ="select * from board where title like ? order by seq desc";
		private String QNA_LIST_C ="select * from board where content like ? order by seq desc";
				
		
		
		//글 등록
				public void insertQnA(QnA dto) {
					
					try {
						con = MyDBConnection.getConnection();
						pstmt = con.prepareStatement(QNA_INSERT);
						
						pstmt.setInt(1, dto.getQnA_Id());
						pstmt.setString(2, dto.getQnA_Cat());
						pstmt.setInt(3, dto.getProduct_ID());
						pstmt.setInt(4, dto.getCustomer_ID());
						pstmt.setString(5, dto.getQnA_Title());
						pstmt.setString(6, dto.getQnA_Content());
						pstmt.setTimestamp(7, null);
						pstmt.setString(8, dto.getQnA_Writer());
						
						
						pstmt.executeUpdate();
					
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						MyDBConnection.close(rs, pstmt, con);
					}
				
				}
				
				//글 수정
				//private String BOARD_UPDATE ="update board set title=?, content=? where seq=?";
				public void updateBoard(QnA dto) {
					
					try {
						con = MyDBConnection.getConnection();
						pstmt = con.prepareStatement(QNA_UPDATE);
						
						pstmt.setInt(1, dto.getQnA_Id());
						pstmt.setString(2, dto.getQnA_Cat());
						pstmt.setInt(3, dto.getProduct_ID());
						pstmt.setInt(4, dto.getCustomer_ID());
						pstmt.setString(5, dto.getQnA_Title());
						pstmt.setString(6, dto.getQnA_Content());
						pstmt.setTimestamp(7, null);
						pstmt.setString(8, dto.getQnA_Writer());
						
						pstmt.executeUpdate();
					
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						MyDBConnection.close(rs, pstmt, con);
					}
				
				}
				
				// 글 삭제
				
				public void deleteBoard(QnA dto) {
					
					try {
						con = MyDBConnection.getConnection();
						pstmt = con.prepareStatement(QNA_DELETE);
						pstmt.setInt(1, dto.getQnA_Id());
						
						pstmt.executeUpdate();
					
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						MyDBConnection.close(rs, pstmt, con);
					}
				
				}
				
				
				
				//글 상세 조회
				public QnA getBoard(QnA dto) { 
					// 번호 하나로만 검색하기에 번호를 매개값으로 받아도 되지만
					// 결과를 이용하기 해서 상세 검색을 표현하기 위해 BoardDTO로 받음
					QnA board = null;
					
					try {
						con = MyDBConnection.getConnection();
						pstmt = con.prepareStatement(QNA_GET);
						pstmt.setInt(1,dto.getQnA_Id());
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							board = new QnA();
						    board.setQnA_Id(rs.getInt("QnA_Id"));
						    board.setQnA_Cat(rs.getString("QnA_Cat"));
						    board.setProduct_ID(rs.getInt("Product_ID"));
						    board.setCustomer_ID(rs.getInt("Customer_ID"));
						    board.setQnA_Title(rs.getString("QnA_Title"));
						    board.setQnA_Content(rs.getString("QnA_Content"));
						    board.setQnA_Date(rs.getDate("QnA_Date"));
						    board.setQnA_Writer(rs.getString("QnA_Writer"));
							
						}			
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						MyDBConnection.close(rs, pstmt, con);
					}
					return board;
				}
				
				//글 리스트 검색
				public List<QnA> getQnAList(QnA dto){
					List<QnA> QnAList = new ArrayList<>();
					
					try {
						con = MyDBConnection.getConnection();
						
						if(dto.getQnA_Title().equalsIgnoreCase("TITLE")) {
							pstmt = con.prepareStatement(QNA_LIST_T);
						} else if(dto.getQnA_Content().equalsIgnoreCase("CONTENT")) {
							pstmt = con.prepareStatement(QNA_LIST_C);
						}
						
						String QnA_Title ="%" + dto.getQnA_Title() + "%";
						
						//pstmt.setString(1, dto.getSearchKeyword());
						pstmt.setString(1, QnA_Title);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							QnA board = new QnA();
							
							board = new QnA();
							board.setQnA_Id(rs.getInt("QnA_Id"));
						    board.setQnA_Cat(rs.getString("QnA_Cat"));
						    board.setProduct_ID(rs.getInt("Product_ID"));
						    board.setCustomer_ID(rs.getInt("Customer_ID"));
						    board.setQnA_Title(rs.getString("QnA_Title"));
						    board.setQnA_Content(rs.getString("QnA_Content"));
						    board.setQnA_Date(rs.getDate("QnA_Date"));
						    board.setQnA_Writer(rs.getString("QnA_Writer"));
						    
						    QnAList.add(board);
						}			
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						MyDBConnection.close(rs, pstmt, con);
					}
				
					return QnAList;
					
				}
				
				
				
				public List<QnA> getBoardAll(QnA dto){
					List<QnA> QnAList = new ArrayList<>();
					
					try {
						con = MyDBConnection.getConnection();
						pstmt = con.prepareStatement(QNA_GETALL);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							QnA board = new QnA();
							
							board = new QnA();
							board.setQnA_Id(rs.getInt("QnA_Id"));
						    board.setQnA_Cat(rs.getString("QnA_Cat"));
						    board.setProduct_ID(rs.getInt("Product_ID"));
						    board.setCustomer_ID(rs.getInt("Customer_ID"));
						    board.setQnA_Title(rs.getString("QnA_Title"));
						    board.setQnA_Content(rs.getString("QnA_Content"));
						    board.setQnA_Date(rs.getDate("QnA_Date"));
						    board.setQnA_Writer(rs.getString("QnA_Writer"));
						    
						    
						    QnAList.add(board);
						}			
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						MyDBConnection.close(rs, pstmt, con);
					}
				
					return QnAList;
					
				}
				

}
