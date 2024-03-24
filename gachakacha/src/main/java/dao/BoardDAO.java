package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconnection.MyDBConnection;
import dto.Board;
import dto.User;

public class BoardDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String BOARD_INSERT = "INSERT INTO Board (Board_Cat1, Board_Cat2, Product_Id, Board_Title, User_ID, Board_Pwd, Board_Content) VALUES (?, ?, ?, ?, ?, ?, ?)";

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

}
