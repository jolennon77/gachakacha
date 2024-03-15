package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import dbconnection.MyDBConnection;
import dto.Product;
import dto.User;

public class UserDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String GETUSER = "SELECT * FROM User WHERE User_Email = ?";
	private String GETUSERBYUID = "SELECT * FROM User WHERE User_ID = ?";
	private String ADDUSER = "INSERT INTO User(User_Email, User_Name, User_Pwd, User_Phone, User_Gender, User_Birth, User_Zonecode, User_Address) values(?, ?, ?, ?, ?, ?, ?, ?)";
	private String GETALLUSER = "SELECT * FROM User";
	private String DELETEUSER = "DELETE FROM User WHERE User_ID = ?";
	private String UPDATEUSER = "UPDATE User SET User_Email = ?, User_name = ?, User_Pwd = ?, User_Phone = ?, User_Gender = ?, User_Birth = ?, User_Zonecode = ?, User_Address = ?, User_Aut = ? WHERE User_ID = ?";
	   
	public User getUser(String email) {
		User user = null;

		try {

			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(GETUSER);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("User_ID"));
				user.setEmail(rs.getString("User_Email"));
				user.setName(rs.getString("User_Name"));
				user.setPassword(rs.getString("User_Pwd"));
				user.setPhone(rs.getString("User_Phone"));
				user.setGender(rs.getString("User_Gender"));
				user.setZonecode(rs.getString("User_Zonecode"));
				user.setAddress(rs.getString("User_Address"));
				user.setBirth(rs.getString("User_Birth"));
				user.setAut(rs.getString("User_Aut"));
				user.setsingupDate(rs.getDate("User_SignupDate"));// authority
			}
			;

		} catch (

		SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}

		return user;

	}
	
	public User getUser(int uId) {
		User user = null;

		try {

			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(GETUSERBYUID);
			pstmt.setInt(1, uId);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("User_ID"));
				user.setEmail(rs.getString("User_Email"));
				user.setName(rs.getString("User_Name"));
				user.setPassword(rs.getString("User_Pwd"));
				user.setPhone(rs.getString("User_Phone"));
				user.setGender(rs.getString("User_Gender"));
				user.setZonecode(rs.getString("User_Zonecode"));
				user.setAddress(rs.getString("User_Address"));
				user.setBirth(rs.getString("User_Birth"));
				user.setAut(rs.getString("User_Aut"));
				user.setsingupDate(rs.getDate("User_SignupDate"));// authority
			}
			;

		} catch (

		SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}

		return user;

	}

	public List<User> getAll() {
		List<User> members = new ArrayList<>();

		

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(GETALLUSER);
			rs = pstmt.executeQuery();// select일 때 executeQuery 사용

			// ResultSet에 있는 내용을 가져오기
			while (rs.next()) {
				User user = new User();

				user.setId(rs.getInt(1));// id
				user.setEmail(rs.getString(2));// email
				user.setName(rs.getString(3));// name
				user.setPassword(rs.getString(4)); //pwd
				user.setPhone(rs.getString(5));// phone
				user.setGender(rs.getString(6));// gender
				user.setBirth(rs.getString(7));// birth
				user.setZonecode(rs.getString(8));// zonecode
				user.setAddress(rs.getString(9));// address
				user.setsingupDate(rs.getDate(10));// date
				user.setAut(rs.getString(11));// authority

				members.add(user);
			} // end of while
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("예외");
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		} // end of try
		return members;
	}// end of getAll

	public void insert(User user) {
		

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(ADDUSER);

			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getBirth());
			pstmt.setString(7, user.getZonecode());
			pstmt.setString(8, user.getAddress());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		} // end of try

	}// end of insert

	
	  public void delete(int userId) {
	      
	      try {
	         con = MyDBConnection.getConnection();
	         pstmt = con.prepareStatement(DELETEUSER);
	         pstmt.setInt(1, userId);
	         pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         
	         e.printStackTrace();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         MyDBConnection.close(rs, pstmt, con);
	      }
	   }

		public void updateUserById(User user) {
		    try {
		        con = MyDBConnection.getConnection();
		        pstmt = con.prepareStatement(UPDATEUSER);
		        
		        pstmt.setString(1, user.getEmail());
		        pstmt.setString(2, user.getName());
		        pstmt.setString(3, user.getPassword());
		        pstmt.setString(4, user.getPhone());
		        pstmt.setString(5, user.getGender());
		        pstmt.setString(6, user.getBirth());
		        pstmt.setString(7, user.getZonecode());
		        pstmt.setString(8, user.getAddress());
		        pstmt.setString(9, user.getAut());
		        pstmt.setInt(10, user.getId());
		        pstmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        MyDBConnection.close(rs, pstmt, con);
		    }
		}
}