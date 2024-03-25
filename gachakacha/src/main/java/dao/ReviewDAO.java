package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;
import dto.Review;

public class ReviewDAO {
	
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
	
	//Review
		private  String Review_INSERT ="insert into Review(Review_ID, Product_ID, Review_Writer, Review_Date, Review_Con, Review_Image) values(?,?,?,?,?,?)";
		private  String Review_UPDATE = "update Review set Review_Writer=?, Review_Con=? where Review_ID=?";
		private  String Review_DELETE = "delete from Review where Review_ID=?";
		private  String Review_GET = "select * from Review where Review_ID=?";
		private  String Review_GETALL ="select * from Review order by Review_ID desc";
		
		//검색 관련
		private String QNA_LIST_T ="select * from board where title like ? order by seq desc";
		private String QNA_LIST_C ="select * from board where content like ? order by seq desc";
		
		

		//Review 글 등록
			public void insertReview(Review dto) {
				
				try {
					con = MyDBConnection.getConnection();
					pstmt = con.prepareStatement(Review_INSERT);
					
					pstmt.setInt(1, dto.getReview_ID());
					pstmt.setInt(2, dto.getProduct_ID());
					pstmt.setString(3, dto.getReview_Writer());
					pstmt.setDate(4, dto.getReview_Date());
					pstmt.setString(5, dto.getReview_Con());
					pstmt.setString(6, dto.getReview_Image());
					
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
			public void updateReview(Review dto) {
				
				try {
					con = MyDBConnection.getConnection();
					pstmt = con.prepareStatement(Review_UPDATE);
					
					pstmt.setInt(1, dto.getReview_ID());
					pstmt.setInt(2, dto.getProduct_ID());
					pstmt.setString(3, dto.getReview_Writer());
					pstmt.setDate(4, dto.getReview_Date());
					pstmt.setString(5, dto.getReview_Con());
					pstmt.setString(6, dto.getReview_Image());
					
					
					pstmt.executeUpdate();
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					MyDBConnection.close(rs, pstmt, con);
				}
			
			}
			
			//Review 삭제
			
			public void deleteReview(Review dto) {
				
				try {
					con = MyDBConnection.getConnection();
					pstmt = con.prepareStatement(Review_DELETE);
					pstmt.setInt(1, dto.getReview_ID());
					
					pstmt.executeUpdate();
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					MyDBConnection.close(rs, pstmt, con);
				}
			
			}
			
			
			
			//Review 상세 조회
			public Review getReview(Review dto) { 
				// 번호 하나로만 검색하기에 번호를 매개값으로 받아도 되지만
				// 결과를 이용하기 해서 상세 검색을 표현하기 위해 BoardDTO로 받음
				Review board = null;
				
				try {
					con = MyDBConnection.getConnection();
					pstmt = con.prepareStatement(Review_GET);
					pstmt.setInt(1,dto.getReview_ID());
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						board = new Review();
					    board.setReview_ID(rs.getInt("Review_ID"));
					    board.setProduct_ID(rs.getInt("Product_ID"));
					    board.setReview_Writer(rs.getString("Review_Writer"));
					    board.setReview_Date(rs.getDate("Review_Date"));
					    board.setReview_Con(rs.getString("Review_Con"));
					    board.setReview_Image(rs.getString("Review_Image"));
					    
						
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
			public List<Review> getReviewList(Review dto){
				List<Review> ReviewList = new ArrayList<>();
				
				try {
					con = MyDBConnection.getConnection();
					
					if(dto.getReview_Writer().equalsIgnoreCase("Writer")) {
						pstmt = con.prepareStatement(QNA_LIST_T);
					} else if(dto.getReview_Con().equalsIgnoreCase("CONTENT")) {
						pstmt = con.prepareStatement(QNA_LIST_C);
					}
					
					String Review_Writer ="%" + dto.getReview_Writer() + "%";
					
					//pstmt.setString(1, dto.getSearchKeyword());
					pstmt.setString(1, Review_Writer);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						Review board = new Review();
						
						board = new Review();
					    board.setReview_ID(rs.getInt("Review_ID"));
					    board.setProduct_ID(rs.getInt("Product_ID"));
					    board.setReview_Writer(rs.getString("Review_Writer"));
					    board.setReview_Date(rs.getDate("Review_Date"));
					    board.setReview_Con(rs.getString("Review_Con"));
					    board.setReview_Image(rs.getString("Review_Image"));
					    
					    ReviewList.add(board);
					}			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					MyDBConnection.close(rs, pstmt, con);
				}
			
				return ReviewList;
				
			}
							
			
			public List<Review> getReviewAll(Review dto){
				List<Review> ReviewList = new ArrayList<>();
				
				try {
					con = MyDBConnection.getConnection();
					pstmt = con.prepareStatement(Review_GETALL);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						Review board = new Review();
						
						board = new Review();
					    board.setReview_ID(rs.getInt("Review_ID"));
					    board.setProduct_ID(rs.getInt("Product_ID"));
					    board.setReview_Writer(rs.getString("Review_Writer"));
					    board.setReview_Date(rs.getDate("Review_Date"));
					    board.setReview_Con(rs.getString("Review_Con"));
					    board.setReview_Image(rs.getString("Review_Image"));
					    
					    
					    ReviewList.add(board);
					}			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					MyDBConnection.close(rs, pstmt, con);
				}
			
				return ReviewList;
				
			}
			
			

}
