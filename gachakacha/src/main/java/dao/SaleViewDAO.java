package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;
import dto.SaleView;

public class SaleViewDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String all = "SELECT * FROM ProductSaleView";

	public List<SaleView> getAll() {
		List<SaleView> ProductSaleViewList = new ArrayList<>();

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(all);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SaleView productSaleView = new SaleView();
				productSaleView.setSaleId(rs.getInt("Sale_ID"));
				productSaleView.setProductId(rs.getInt("Product_ID"));
				productSaleView.setProductName(rs.getString("Product_Name"));
				productSaleView.setRegularPrice(rs.getInt("Regular_Price"));
				productSaleView.setSalePrice(rs.getInt("Sale_Price"));
				productSaleView.setDiscountRate(rs.getDouble("Discount_Rate"));
				productSaleView.setSaleDescription(rs.getString("Sale_Description"));
				productSaleView.setTotalQty(rs.getInt("Total_Qty"));
				ProductSaleViewList.add(productSaleView);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return ProductSaleViewList;
	}
}