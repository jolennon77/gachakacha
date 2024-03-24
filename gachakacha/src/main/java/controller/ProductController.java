package controller;

import dao.ProductDAO;
import dao.OptionDAO;
import dto.Product;
import dto.Option;
import dto.User;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import java.io.IOException;
import java.util.List;

@WebServlet("*.product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO pDao;
	private OptionDAO oDao;

	// 서블릿 초기화 시 ProductDAO와 OptionDAO 객체 생성
	public void init() {
		pDao = new ProductDAO();
		oDao = new OptionDAO();
	}

	// GET 요청 처리
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

				// 요청에 따라 처리하기
				if (PATH.equals("/list.product")) { // 재고리스트 목록 페이지 요청
					productList(request, response);
				} else if (PATH.equals("/detail.product")) { // 상품 정보 상세보기 페이지 요청
					productDetail(request, response);
				} else if (PATH.equals("/insertForm.product")) { // 재고등록 페이지로 이동 요청
					productInsertForm(request, response);
				} else if (PATH.equals("/delete.product")) { // 재고 삭제 처리 요청
					productDelete(request, response);
				}
			} else {
				//관리가권한이 아닐경우 에러페이지로 리다이렉트
				response.sendRedirect("error.do");
			}

		} else {
			//세션정보가 없을 경우에러페이지로 리다이렉트
			response.sendRedirect("error.do");}
	}

	
	
	
	
	// POST 요청 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));

		if (PATH.equals("/insert.product")) { // 상품 등록 처리 요청
			productInsert(request, response);
		} else if (PATH.equals("/update.product")) { // 상품 업데이트 처리 요청
			productUpdate(request, response);
		}
	}

	// 재고리스트 목록 페이지 처리 메서드
	private void productList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Product> productList = pDao.getAll(); // 모든 제품 정보를 가져옴
		request.setAttribute("productList", productList); // request에 productList 속성 추가
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/product/productList.jsp");
		dispatcher.forward(request, response); // productList.jsp로 포워딩
	}

	// 상품 정보 상세보기 페이지 처리 메서드
	private void productDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pId = Integer.parseInt(request.getParameter("pId")); // 요청 파라미터에서 상품 ID 가져옴
		Product product = pDao.getProductById(pId); // 해당 ID의 제품 정보 가져옴
		List<Option> optionList = oDao.getProductOptionsById(pId); // 해당 ID의 제품 옵션 정보 가져옴
		request.setAttribute("product", product); // request에 product 속성 추가
		request.setAttribute("optionList", optionList); // request에 optionList 속성 추가
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/product/productDetail.jsp");
		dispatcher.forward(request, response); // productDetail.jsp로 포워딩
	}

	// 재고등록 페이지로 이동 처리 메서드
	private void productInsertForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/product/productInsert.jsp");
		dispatcher.forward(request, response); // productInsert.jsp로 포워딩
	}

	// 재고 삭제 처리 메서드
	private void productDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pId = Integer.parseInt(request.getParameter("pId")); // 요청 파라미터에서 상품 ID 가져옴
		pDao.deleteProductById(pId); // 해당 ID의 제품 삭제
		response.sendRedirect("list.product"); // 재고리스트 목록 페이지로 리다이렉트
	}

	// 상품 등록 처리 메서드
	private void productInsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자 입력을 통해 새로운 상품 정보 생성 및 등록
		Product pro = new Product();
		pro.setProduct_Type(request.getParameter("p_Type"));
		pro.setProduct_Cat(request.getParameter("p_Cat"));
		pro.setProduct_Name(request.getParameter("p_Name"));
		pro.setProduct_Price(Integer.parseInt(request.getParameter("p_Price")));
		pro.setProduct_Img(request.getParameter("p_Img"));
		pro.setProduct_Con(request.getParameter("p_Con"));

		int productId = pDao.insert(pro); // 새로 등록된 상품의 ID 가져옴

		// 상품 옵션 등록 처리
		String[] optionNames = request.getParameterValues("o_Name[]");
		String[] optionGrades = request.getParameterValues("o_Grade[]");
		String[] optionQtysStr = request.getParameterValues("o_Qty[]");
		String[] optionImages = request.getParameterValues("o_Img[]");

		for (int i = 0; i < optionNames.length; i++) {
			Option option = new Option();
			option.setProduct_ID(productId);
			option.setOption_Name(optionNames[i]);
			option.setOption_Grade(optionGrades[i]);
			option.setOption_Qty(Integer.parseInt(optionQtysStr[i]));
			option.setOption_Img(optionImages[i]);
			oDao.insert(option);
		}

		response.sendRedirect(request.getContextPath() + "/list.product"); // 재고리스트 목록 페이지로 리다이렉트
	}

	// 상품 업데이트 처리 메서드
	private void productUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pId = Integer.parseInt(request.getParameter("pId")); // 요청 파라미터에서 상품 ID 가져옴

		// 수정된 상품 정보 업데이트
		Product pro = new Product();
		pro.setProduct_Type(request.getParameter("p_Type"));
		pro.setProduct_Cat(request.getParameter("p_Cat"));
		pro.setProduct_Name(request.getParameter("p_Name"));
		pro.setProduct_Price(Integer.parseInt(request.getParameter("p_Price")));
		pro.setProduct_Img(request.getParameter("p_Img"));
		pro.setProduct_Con(request.getParameter("p_Con"));
		pro.setProduct_Id(pId);

		pDao.updateProductById(pro); // 상품 업데이트

		response.sendRedirect(request.getContextPath() + "/list.product?pId=" + pId); // 재고리스트 목록 페이지로 리다이렉트
	}
}
