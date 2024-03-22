package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;
import dto.Orders;

public class OrderDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs =null;

	private String ORDERLIST = "SELECT * FROM Orders";
	private String ORDERDELETE = "DELETE FROM Orders WHERE Orders_ID = ?";
	private String GETORDERSBYID = "SELECT * FROM Orders WHERE Orders_ID = ?";

	public List<Orders> getAll(){
		List<Orders> orders = new ArrayList<Orders>();

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(ORDERLIST);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				Orders order = new Orders();

				order.setOrders_ID(rs.getInt("Orders_ID"));
				order.setUser_ID(rs.getInt("User_ID"));
				
				int productId = rs.getInt("Product_ID");
				order.setProduct_ID(productId);
				String img = getProductImgByProductId(productId);
				
				order.setOrders_Date(rs.getDate("Orders_Date"));
				order.setOrders_Status(rs.getString("Orders_Status"));
				order.setShip_Number(rs.getString("Ship_Number"));
				order.setProduct_Img(img);


				
	        	
	        	
				
				
				orders.add(order);

			}//end of while

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("예외");
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}//end of try
		return orders;
	}//end of getAll

	
	
	
	public void delete(int ordersId) {
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(ORDERDELETE);
			pstmt.setInt(1, ordersId);
			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			System.out.println("예외");

		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}

	
	
	
	public Orders getOrderId(int ordersId) {
		Orders order = null;
	    try {
	        con = MyDBConnection.getConnection();
	        pstmt = con.prepareStatement(GETORDERSBYID);
	        pstmt.setInt(1, ordersId);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            // OrdersDetail 객체 생성 및 값 설정
	        	order = new Orders();
	        	order.setOrders_ID(rs.getInt("Orders_ID"));
	        	order.setUser_ID(rs.getInt("User_ID"));
	        	order.setOrders_Date(rs.getDate("Orders_Date"));
	        	order.setOrders_Status(rs.getString("Orders_Status"));
	        	order.setShip_Number(rs.getString("Ship_Number"));
	            
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("예외");
	    } finally {
	        MyDBConnection.close(rs, pstmt, con);
	    }
	    return order;
	}

	
	private String getProductImgByProductId(int productId) {
	    String productImg = null;
	    
	    try {
	        Connection con = MyDBConnection.getConnection(); // 지역 변수로 변경
	        PreparedStatement pstmt = con.prepareStatement("SELECT Product_Img FROM Product WHERE Product_ID = ?");
	        pstmt.setInt(1, productId);
	        ResultSet rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	        	productImg = rs.getString("Product_Img");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // ResultSet 닫기
	        // MyDBConnection.close(rs, pstmt, con); // 필드에서 사용하지 않으므로 이 부분은 제거합니다.
	    }
	    
	    return productImg;
	}

	
}
