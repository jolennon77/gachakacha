package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;
import dto.Board;
import dto.Product;
import dto.User;

public class BoardDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String BOARD_INSERT = "INSERT INTO Board (Board_Cat1, Board_Cat2, Product_Id, Board_Title, User_ID, Board_Pwd, Board_Content) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private String BOARD_LIST = "SELECT * FROM Board WHERE Board_Cat1=?";
	private String BOARD_GET = "SELECT * FROM Board WHERE Board_ID=?";
	public void insert(Board board) {

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(BOARD_INSERT);

			pstmt.setString(1, board.getBoard_Cat1());
			pstmt.setString(2, board.getBoard_Cat2());
			pstmt.setInt(3, board.getProduct_Id());
			pstmt.setString(4, board.getBoard_Title());
			pstmt.setInt(5, board.getUser_ID());
			pstmt.setString(6, board.getBoard_Pwd());
			pstmt.setString(7, board.getBoard_Content());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		} // end of try

	}// end of insert

	
	 
	public List<Board> getAll(String board_cat1) {
		// 제품 목록을 가져오는 로직 구현
		
		List<Board> boardList = new ArrayList<>();
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(BOARD_LIST);
			pstmt.setString(1, board_cat1);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBoard_ID(rs.getInt("Board_ID"));
				board.setBoard_Cat1(rs.getString("Board_Cat1"));
				board.setBoard_Cat2(rs.getString("Board_Cat2"));
				board.setProduct_Id(rs.getInt("Product_Id"));
				board.setBoard_Title(rs.getString("Board_Title"));
				int UserId = rs.getInt("User_ID");
				board.setUser_ID(UserId);
				String UserName = getUserNameByUserId(UserId);
				board.setUser_Name(UserName);
				board.setBoard_CreateDate(rs.getTimestamp("Board_CreateDate"));
				board.setBoard_Pwd(rs.getString("Board_Pwd"));
				board.setBoard_Content(rs.getString("Board_Content"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return boardList;
	}
	
	
	
	private String getUserNameByUserId(int userId) {
	    String userName = null;
	    
	    try {
	        Connection con = MyDBConnection.getConnection(); // 지역 변수로 변경
	        PreparedStatement pstmt = con.prepareStatement("SELECT User_name FROM User WHERE User_ID = ?");
	        pstmt.setInt(1, userId);
	        ResultSet rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	        	userName = rs.getString("User_name");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // ResultSet 닫기
	        // MyDBConnection.close(rs, pstmt, con); // 필드에서 사용하지 않으므로 이 부분은 제거합니다.
	    }
	    
	    return userName;
	}

	public Board getBoardById(int boardId) {
		Board board = null;

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(BOARD_GET);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new Board();
				board.setBoard_ID(rs.getInt("Board_ID"));
				board.setBoard_Cat1(rs.getString("Board_Cat1"));
				board.setBoard_Cat2(rs.getString("Board_Cat2"));
				board.setProduct_Id(rs.getInt("Product_Id"));
				board.setBoard_Title(rs.getString("Board_Title"));
				board.setUser_ID(rs.getInt("User_ID"));
				board.setBoard_CreateDate(rs.getTimestamp("Board_CreateDate"));
				board.setBoard_Pwd(rs.getString("Board_Pwd"));
				board.setBoard_Content(rs.getString("Board_Content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return board;
	}
}
