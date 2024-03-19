package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconnection.MyDBConnection;
import dto.Sale;

public class SaleDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String ADDSALE = "INSERT INTO Sale(Product_ID, Regular_Price, Sale_Price, Discount_Rate, Sale_Description) values(?, ?, ?, ?, ?)";
	private String SALE_GET = "SELECT * FROM Sale WHERE Sale_ID=?";

	public void saleInsert(Sale sale) {
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(ADDSALE);
			pstmt.setInt(1, sale.getProduct_ID());
			pstmt.setInt(2, sale.getRegular_Price());
			pstmt.setInt(3, sale.getSale_Price());
			pstmt.setDouble(4, sale.getDiscount_Rate());
			pstmt.setString(5, sale.getSale_Description());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}

	public Sale getProductById(int saleId) {
		Sale sale = null;
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(SALE_GET);
			pstmt.setInt(1, saleId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sale = new Sale();
				sale.setSale_ID(rs.getInt("Sale_ID"));
				sale.setProduct_ID(rs.getInt("Product_ID"));
				sale.setRegular_Price(rs.getInt("Regular_Price"));
				sale.setSale_Price(rs.getInt("Sale_Price"));
				sale.setDiscount_Rate(rs.getDouble("Discount_Rate"));
				sale.setSale_Description(rs.getString("sale_Description"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return sale;
	}
}
