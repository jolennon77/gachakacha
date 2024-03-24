package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import dao.SaleDAO;
import dto.Product;
import dto.Sale;
import dto.User;

@WebServlet("*.sale")
public class SaleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SaleDAO saleDAO;
	private ProductDAO productDAO;

	public SaleController() {
		super();
		saleDAO = new SaleDAO();
		productDAO = new ProductDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));

		HttpSession session = request.getSession(false); // 세션이 없으면 null 반환

		if (session != null && session.getAttribute("user") != null) {
			// 세션이 있고, 세션에 user 속성이 존재하는 경우
			// 사용자가 로그인되어 있는 상태이므로 권한을 확인합니다.
			User user = (User) session.getAttribute("user");

			if ("admin".equals(user.getAut())) {
				if (PATH.equals("/insertForm.sale")) {
					// 제품 등록 페이지로 이동
					saleInsertForm(request, response);
				} else if (PATH.equals("/list.sale")) {
					// 판매 리스트 목록 페이지로 이동
					saleList(request, response);
				} else if (PATH.equals("/detail.sale")) {
					// 세일 상세 정보 보기 페이지로 이동
					saleDetail(request, response);
				} else if (PATH.equals("/delete.sale")) {
					// 세일 삭제 처리
					saleDelete(request, response);
				}
			} else {
				// 권한이 없는 사용자인 경우 에러페이지로 리다이렉트
				response.sendRedirect("error.do");
			}
		} else {
			// 세션이 없는 경우 에러페이지로 리다이렉트
			response.sendRedirect("error.do");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));

		if (PATH.equals("/insert.sale")) {
			// 세일 등록 처리
			saleInsert(request, response);
		} else if (PATH.equals("/update.sale")) {
			// 세일 정보 업데이트 처리
			saleUpdate(request, response);
		}
	}

	private void saleDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("주문 삭제");

		// 삭제할 주문의 ID 가져오기
		int saleId = Integer.parseInt(request.getParameter("sId"));
		// saleDAO를 사용하여 해당 주문을 삭제합니다.
		saleDAO.delete(saleId);

		// 삭제 후, 관련된 페이지로 리다이렉트합니다.
		response.sendRedirect("list.sale");
	}

	private void saleUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("회원 정보 업데이트");
		// 버튼 누르면 상세 조회되게
		int saleId = Integer.parseInt(request.getParameter("sId"));
		int productId = Integer.parseInt(request.getParameter("pId"));

		// Sale 객체를 생성하고 업데이트할 정보를 설정합니다.
		Sale sale = new Sale();
		sale.setRegular_Price(Integer.parseInt(request.getParameter("s_RegPrice")));
		sale.setSale_Price(Integer.parseInt(request.getParameter("s_Price")));
		sale.setDiscount_Rate(Double.parseDouble(request.getParameter("s_DiscontRate")) / 100.0);
		sale.setSale_Description(request.getParameter("s_Description"));
		sale.setSale_ID(saleId);

		// saleDAO를 사용하여 해당 세일 정보를 업데이트합니다.
		saleDAO.updateSaleById(sale);

		// 업데이트 후, 관련된 페이지로 리다이렉트합니다.
		response.sendRedirect(request.getContextPath() + "/detail.sale?sId=" + saleId + "&pId=" + productId);
	}

	private void saleInsertForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 제품 등록 페이지로 이동
		int pId = Integer.parseInt(request.getParameter("pId"));
		Product product = productDAO.getProductById(pId);
		request.setAttribute("product", product);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/sale/saleInsert.jsp");
		dispatcher.forward(request, response);
	}

	private void saleInsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 세일 등록 처리
		Sale sale = new Sale();
		int pId = Integer.parseInt(request.getParameter("pId"));
		sale.setProduct_ID(pId);
		sale.setRegular_Price(Integer.parseInt(request.getParameter("s_RegPrice")));
		sale.setSale_Price(Integer.parseInt(request.getParameter("s_Price")));
		sale.setDiscount_Rate(Double.parseDouble(request.getParameter("s_DiscontRate")) / 100.0);
		sale.setSale_Description(request.getParameter("s_Description"));
		saleDAO.saleInsert(sale);

		// 등록 후, 세일 리스트 페이지로 리다이렉트합니다.
		response.sendRedirect("list.sale");
	}

	private void saleList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 판매 리스트 목록 페이지로 이동
		List<Sale> saleList = saleDAO.getAll();
		request.setAttribute("saleList", saleList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/sale/saleList.jsp");
		dispatcher.forward(request, response);
	}

	private void saleDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 세일 상세 정보 보기 페이지로 이동
		int pId = Integer.parseInt(request.getParameter("pId"));
		int sId = Integer.parseInt(request.getParameter("sId"));
		Sale sale = saleDAO.getProductById(sId);
		Product product = productDAO.getProductById(pId);
		request.setAttribute("product", product);
		request.setAttribute("sale", sale);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/sale/saleDetail.jsp");
		dispatcher.forward(request, response);
	}
}
