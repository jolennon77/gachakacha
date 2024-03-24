package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.startup.Tomcat.ExistingStandardWrapper;

import dbconnection.MyDBConnection;
import dto.Product;
import dto.User;

public class UserDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String GET_USER_BY_EMAIL = "SELECT * FROM User WHERE User_Email = ?";
	private String GET_USER_BY_ID = "SELECT * FROM User WHERE User_ID = ?";
	private String USER_INSERT = "INSERT INTO User(User_Email, User_Name, User_Pwd, User_Phone, User_Gender, User_Birth, User_Address) values(?, ?, ?, ?, ?, ?, ?)";
	private String USER_LIST = "SELECT * FROM User";
	private String USER_DELETE = "DELETE FROM User WHERE User_ID = ?";
	private String USER_UPDATE = "UPDATE User SET User_Email = ?, User_name = ?, User_Pwd = ?, User_Phone = ?, User_Gender = ?, User_Birth = ?, User_Address = ?, User_Aut = ? WHERE User_ID = ?";
	   
	public User getUserByEmail(String email) {
		User user = null;

		try {

			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(GET_USER_BY_EMAIL);
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
				user.setAddress(rs.getString("User_Address"));
				user.setBirth(rs.getString("User_Birth"));
				user.setAut(rs.getString("User_Aut"));
				user.setsingupDate(rs.getDate("User_SignupDate"));// authority
			}

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
	
	public User getUserById(int uId) {
		User user = null;

		try {

			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(GET_USER_BY_ID);
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

	public List<User> userList() {
		List<User> members = new ArrayList<>();

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(USER_LIST);
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
				user.setAddress(rs.getString(8));// address
				user.setsingupDate(rs.getDate(9));// date
				user.setAut(rs.getString(10));// authority

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

	public void userInsert(User user) {
		

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(USER_INSERT);

			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getBirth());
			pstmt.setString(7, user.getAddress());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		} // end of try

	}// end of insert

	
	  public void userDelete(int userId) {
	      
	      try {
	         con = MyDBConnection.getConnection();
	         pstmt = con.prepareStatement(USER_DELETE);
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

		public void userUpdate(User user) {
		    try {
		        con = MyDBConnection.getConnection();
		        pstmt = con.prepareStatement(USER_UPDATE);
		        
		        pstmt.setString(1, user.getEmail());
		        pstmt.setString(2, user.getName());
		        pstmt.setString(3, user.getPassword());
		        pstmt.setString(4, user.getPhone());
		        pstmt.setString(5, user.getGender());
		        pstmt.setString(6, user.getBirth());
		        pstmt.setString(7, user.getAddress());
		        pstmt.setString(8, user.getAut());
		        pstmt.setInt(9, user.getId());
		        pstmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        MyDBConnection.close(rs, pstmt, con);
		    }
		}
		
		   // 이메일 중복 확인 메서드
		public boolean checkEmailExists(String email) {
		    boolean exists = false;

		    try {
		        con = MyDBConnection.getConnection();
		        String sql = "SELECT COUNT(*) FROM User WHERE User_Email = ?"; // 수정된 부분
		        pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, email);
		        rs = pstmt.executeQuery();
		        if (rs.next()) {
		            int count = rs.getInt(1);
		            exists = count > 0;
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		          MyDBConnection.close(rs, pstmt, con);
		    }

		    return exists;
		}
}
		
