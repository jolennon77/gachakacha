package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;
import dto.Product;

//ProductDAO 클래스의 수정
public class ProductDAO {
	Product product;

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private String PRODUCT_INSERT = "INSERT INTO product (Product_Type, Product_Cat, Product_Name, Product_Price, Product_Img, Product_Con)  values(?, ?, ?, ?, ?, ?)";
	private String PRODUCT_LIST = "SELECT * FROM Product";
	private String PRODUCT_GET = "SELECT * FROM Product WHERE Product_ID=?";
	private String PRODUCT_DELET = "DELETE FROM Product WHERE Product_ID = ?";
	private String PRODUCT_UPDATE = "UPDATE product SET Product_Type = ?, Product_Cat = ?, Product_Name = ?, Product_Price = ?, Product_Img = ?, Product_Con = ? WHERE Product_ID = ?";

//  getAll() 메서드 추가
	public List<Product> getAll() {
		// 제품 목록을 가져오는 로직 구현
		List<Product> productList = new ArrayList<>();
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(PRODUCT_LIST);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProduct_Id(rs.getInt("Product_ID"));
				product.setProduct_Type(rs.getString("Product_Type"));
				product.setProduct_Cat(rs.getString("Product_Cat"));
				product.setProduct_Name(rs.getString("Product_Name"));
				product.setProduct_Price(rs.getInt("Product_Price"));
				product.setProduct_Img(rs.getString("Product_Img"));
				product.setProduct_Con(rs.getString("Product_Con"));
				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return productList;
	}

	// insert 메서드 수정
	public int insert(Product product) {
		int productId = -1;
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(PRODUCT_INSERT, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, product.getProduct_Type());
			pstmt.setString(2, product.getProduct_Cat());
			pstmt.setString(3, product.getProduct_Name());
			pstmt.setInt(4, product.getProduct_Price());
			pstmt.setString(5, product.getProduct_Img());
			pstmt.setString(6, product.getProduct_Con());
			pstmt.executeUpdate();

			// 새 제품의 ID를 가져옵니다.
			ResultSet generatedKeys = pstmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				productId = generatedKeys.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return productId;
	}

	public Product getProductById(int productId) {
		Product product = null;

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(PRODUCT_GET);
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				product = new Product();
				product.setProduct_Id(rs.getInt("Product_Id"));
				product.setProduct_Type(rs.getString("Product_Type"));
				product.setProduct_Cat(rs.getString("Product_Cat"));
				product.setProduct_Name(rs.getString("Product_Name"));
				product.setProduct_Price(rs.getInt("Product_Price"));
				product.setProduct_Img(rs.getString("Product_Img"));
				product.setProduct_Con(rs.getString("Product_Con"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return product;
	}

	public void deleteProductById(int productId) {

		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(PRODUCT_DELET);
			pstmt.setInt(1, productId);

			// 쿼리 실행
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}

//	public boolean deleteProductById(int productId) {
//
//		try {
//			con = MyDBConnection.getConnection();
//			pstmt = con.prepareStatement(PRODUCT_DELET);
//			pstmt.setInt(1, productId);
//
//			// 쿼리 실행
//			int rowsAffected = pstmt.executeUpdate();
//
//			return rowsAffected > 0;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		} finally {
//			// PreparedStatement 닫기
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
	public void updateProductById(Product product) {
	    try {
	        con = MyDBConnection.getConnection();
	        pstmt = con.prepareStatement(PRODUCT_UPDATE);
	        
	        pstmt.setString(1, product.getProduct_Type());
	        pstmt.setString(2, product.getProduct_Cat());
	        pstmt.setString(3, product.getProduct_Name());
	        pstmt.setInt(4, product.getProduct_Price());
	        pstmt.setString(5, product.getProduct_Img());
	        pstmt.setString(6, product.getProduct_Con());
	        pstmt.setInt(7, product.getProduct_Id()); // 상품 ID 추가
	        
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        MyDBConnection.close(rs, pstmt, con);
	    }
	}
}
