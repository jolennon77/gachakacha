package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static dbconnection.DB_Info.*;

public class MyDBConnection { // db접속과 접속&접속 끊기

	public static Connection getConnection() {

		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			System.out.println("예외발생");
		} catch (SQLException e) {
			System.out.println("예외발생");
		}

		return con;
	}

	// 오라클 : Class.forName("oracle.jdbc.OracleDriver");
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {

		if (rs != null) {
			try {
				rs.close();
				System.out.println("rs닫기 성공");
			} catch (SQLException e) {
				System.out.println("rs닫기 실패");
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
				System.out.println("pstmt닫기 성공");
			} catch (SQLException e) {
				System.out.println("pstmt닫기 실패");
			}
		}
		if (con != null) {
			try {
				con.close();
				System.out.println("con닫기 성공");
			} catch (SQLException e) {
				System.out.println("con닫기 실패");
			}
		}
	}

	
	
	
	
	public static void close(ResultSet rs, PreparedStatement pstmt) {
		if (rs != null) {
			try {
				rs.close();
				System.out.println("rs닫기 성공");
			} catch (SQLException e) {
				System.out.println("rs닫기 실패");
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
				System.out.println("pstmt닫기 성공");
			} catch (SQLException e) {
				System.out.println("pstmt닫기 실패");
			}
		}
		
	}

}
