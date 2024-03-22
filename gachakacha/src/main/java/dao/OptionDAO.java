package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;
import dto.Option;
import dto.Product;

//ProductDAO 클래스의 수정
public class OptionDAO {
//	Product product;
	Option option;

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private String OPTION_INSERT = "INSERT INTO ProductOption (Product_ID, Option_Name, Option_Grade, Option_Img, Option_Qty)  values(?, ?, ?, ?, ?)";
	private String OPTION_LIST = "SELECT * FROM ProductOption WHERE Product_ID = ?";
	private String OPTION_DELETE = "DELETE FROM ProductOption WHERE Option_ID = ?";
	private String OPTION_UPDATE = "UPDATE ProductOption SET Option_Name = ?, Option_Grade = ?, Option_Img = ?, Option_Qty = ? WHERE Option_ID = ?";
	private String TOTALCOUNT = "SELECT Product_ID, SUM(Option_Qty) AS Total_Qty FROM ProductOption WHERE Product_ID = ? GROUP BY Product_ID;";

	
//  getAll() 메서드 추가
	public List<Option> getProductOptionsById(int productId) {
		// 제품 목록을 가져오는 로직 구현
		List<Option> optionList = new ArrayList<>();
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(OPTION_LIST);
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				Option option = new Option();
				option.setOption_ID(rs.getInt("Option_ID"));
				option.setProduct_ID(rs.getInt("Product_ID"));
				option.setOption_Name(rs.getString("Option_Name"));
				option.setOption_Grade(rs.getString("Option_Grade"));
				option.setOption_Qty(rs.getInt("Option_Qty"));
				option.setOption_Img(rs.getString("Option_Img"));
				optionList.add(option);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return optionList;
	}

	// insert 메서드 수정
	public void insert(Option option) {
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(OPTION_INSERT);
			pstmt.setInt(1, option.getProduct_ID());
			pstmt.setString(2, option.getOption_Name());
			pstmt.setString(3, option.getOption_Grade());
			pstmt.setString(4, option.getOption_Img());
			pstmt.setInt(5, option.getOption_Qty());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
	
	public void delete(int optionId) {
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(OPTION_DELETE);
			pstmt.setInt(1, optionId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
	
	public void update(Option option) {
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(OPTION_UPDATE);
			
			pstmt.setString(1, option.getOption_Name());
			pstmt.setString(2, option.getOption_Grade());
			pstmt.setString(3, option.getOption_Img());
			pstmt.setInt(4, option.getOption_Qty());
			pstmt.setInt(5, option.getOption_ID()); // 옵션 ID 추가
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
		
		


		public List<Option> getOptionbyOrderId(int orderId) {
			
			
			List<Option> options = new ArrayList<>();
			try {
				con = MyDBConnection.getConnection();
				String query = "SELECT ProductOption.* " +
                        "FROM OrdersDetail " +
                        "JOIN ProductOption ON OrdersDetail.Option_ID = ProductOption.Option_ID " +
                        "WHERE OrdersDetail.Orders_ID = ?";
				
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, orderId);
				rs = pstmt.executeQuery();
				while (rs.next()) {

					Option option = new Option();
					option.setOption_ID(rs.getInt("Option_ID"));
					option.setProduct_ID(rs.getInt("Product_ID"));
					option.setOption_Name(rs.getString("Option_Name"));
					option.setOption_Grade(rs.getString("Option_Grade"));
					option.setOption_Qty(rs.getInt("Option_Qty"));
					option.setOption_Img(rs.getString("Option_Img"));
					options.add(option);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				MyDBConnection.close(rs, pstmt, con);
			}
			return options;
		}
		
}
