package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconnection.MyDBConnection;
import dto.Sale;
import dto.User;

public class SaleDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String GETALL = "SELECT * FROM sale";
	private String SALE_INSERT = "INSERT INTO Sale(Product_ID, Regular_Price, Sale_Price, Discount_Rate, Sale_Description) values(?, ?, ?, ?, ?)";
	private String SALE_GET = "SELECT * FROM Sale WHERE Sale_ID=?";
	private String SALE_DELETE = "DELETE FROM Sale WHERE Sale_ID = ?";
	private String SALE_UPDATE = "UPDATE Sale SET Regular_Price = ?, Sale_Price = ?, Discount_Rate = ?, Sale_Description = ? WHERE Sale_ID = ?";
	
	public void saleInsert(Sale sale) {
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(SALE_INSERT);
			
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

	public List<Sale> getAll() {
	    List<Sale> saleList = new ArrayList<>();

	    try {
	        con = MyDBConnection.getConnection();
	        pstmt = con.prepareStatement(GETALL);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            Sale sale = new Sale();
	            
	            sale.setSale_ID(rs.getInt("Sale_ID"));
	            
	            int productId = rs.getInt("Product_ID");
	            sale.setProduct_ID(productId);

	            
	            // 상품 아이디로부터 상품 이름 가져오기
	            String productName = getProductNameByProductId(productId);
	            sale.setProduct_Name(productName);
//	            
	            sale.setRegular_Price(rs.getInt("Regular_Price"));
	            sale.setSale_Price(rs.getInt("Sale_Price"));
	            sale.setDiscount_Rate(rs.getDouble("Discount_Rate"));
	            sale.setSale_Description(rs.getString("Sale_Description"));
	            
	            // 상품 아이디별 옵션 수량을 가져와 Sale 객체에 추가
	            int optionQty = getTotalQtyByProductId(productId);
	            sale.setTotalQty(optionQty);
	            
	            String productImg = getProductImgByProductId(productId);
	            sale.setProduct_Img(productImg);
	            
	            saleList.add(sale);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // DB 연결 닫기
	        MyDBConnection.close(rs, pstmt, con);
	    }
	    return saleList;
	}
	
	public void delete(int saleId) {
		try {
			con = MyDBConnection.getConnection();
			pstmt = con.prepareStatement(SALE_DELETE);
			pstmt.setInt(1, saleId);
			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			System.out.println("예외");

		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
	
	
	
	
	
	public void updateSaleById(Sale sale) {
	    try {
	        con = MyDBConnection.getConnection();
	        pstmt = con.prepareStatement(SALE_UPDATE);
	        
	        pstmt.setInt(1, sale.getRegular_Price());
	        pstmt.setInt(2, sale.getSale_Price());
	        pstmt.setDouble(3, sale.getDiscount_Rate());
	        pstmt.setString(4, sale.getSale_Description());
	        pstmt.setInt(5, sale.getSale_ID());
	        
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        MyDBConnection.close(rs, pstmt, con);
	    }
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	private String getProductNameByProductId(int productId) {
	    String productName = null;
	    
	    try {
	        Connection con = MyDBConnection.getConnection(); // 지역 변수로 변경
	        PreparedStatement pstmt = con.prepareStatement("SELECT Product_Name FROM Product WHERE Product_ID = ?");
	        pstmt.setInt(1, productId);
	        ResultSet rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            productName = rs.getString("Product_Name");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // ResultSet 닫기
	        // MyDBConnection.close(rs, pstmt, con); // 필드에서 사용하지 않으므로 이 부분은 제거합니다.
	    }
	    
	    return productName;
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


	private int getTotalQtyByProductId(int productId) {
	    int totalQty = -1; // 기본적으로 -1로 설정
	    
	    try {
	        Connection con = MyDBConnection.getConnection(); // 지역 변수로 변경
	        PreparedStatement pstmt = con.prepareStatement("SELECT SUM(Option_Qty) AS Total_Qty FROM ProductOption WHERE Product_ID = ?");
	        pstmt.setInt(1, productId);
	        ResultSet rs = pstmt.executeQuery();
	        
	        // 쿼리 결과가 있는 경우
	        if (rs.next()) {
	            totalQty = rs.getInt("Total_Qty"); // 총 수량을 가져옴
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // ResultSet 닫기
	        // MyDBConnection.close(rs, pstmt, con); // 필드에서 사용하지 않으므로 이 부분은 제거합니다.
	    }

	    return totalQty; // 총 수량 반환
	}
}