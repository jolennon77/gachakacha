package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;
import dto.Orders;
import dto.OrdersDetail;

public class Order1DAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs =null;
	
	private String ORDERLIST = "SELECT * FROM Orders";
	private String ORDERDELETE = "DELETE FROM Orders WHERE Orders_ID = ?";
	private String ORDERUPDATE = "UPDATE OrdersDetail SET OdersDetail_ID = ?, Orders_ID = ? WHERE OdersDetail_ID = ?";
	
	public List<Orders> getAll(){
		List<Orders> orders = new ArrayList<Orders>();
		
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(ORDERLIST);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Orders order = new Orders();
				
				order.setOrder_Id(rs.getInt(1));
				order.setUser_Id(rs.getInt(2));
				order.setProduct_ID(rs.getInt(3));
				order.setOrder_Date(rs.getDate(4));
				order.setOrders_Status(rs.getString(5));
				order.setShip_Number(rs.getString(6));
				
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
	
	public OrdersDetail getOrderDetailById(int odId) {
	    OrdersDetail orderDetail = null;
	    try {
	        con = MyDBConnection.getConnection();
	        pstmt = con.prepareStatement(ORDERUPDATE);
	        pstmt.setInt(1, odId);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            // OrdersDetail 객체 생성 및 값 설정
	            orderDetail = new OrdersDetail();
	            orderDetail.setOdersDetail_ID(rs.getInt("OdersDetail_ID"));
	            orderDetail.setOrders_ID(rs.getInt("Orders_ID"));
	            orderDetail.setProduct_ID(rs.getInt("Product_ID"));
	            orderDetail.setOption_ID(rs.getInt("Option_ID"));
	            orderDetail.setOrder_Qty(rs.getInt("Order_Qty"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("예외");
	    } finally {
	        MyDBConnection.close(rs, pstmt, con);
	    }
	    return orderDetail;
	}

	
}
