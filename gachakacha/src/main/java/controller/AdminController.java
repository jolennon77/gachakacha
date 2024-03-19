package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OptionDAO;
import dao.ProductDAO;
import dao.SaleDAO;
import dao.SaleViewDAO;
import dao.UserDAO;
import dto.Option;
import dto.Product;
import dto.Sale;
import dto.SaleView;
import dto.User;

/**
 * Servlet implementation class infoBordServlet
 */
@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAO pDao;
	OptionDAO oDao;
	UserDAO uDao;
	SaleDAO sDao;

	public AdminController() {
		super();
		pDao = new ProductDAO();
		oDao = new OptionDAO();
		uDao = new UserDAO();
		sDao = new SaleDAO();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// #1. 사용자 요청이 들어오면 요청 경로(path)를 추출
		final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));

		// 요청에 따라 처리하기
		// ---------------------------------

		if (PATH.equals("/adminPage.admin")) {
			System.out.println("관리자페이지 메인으로 이동");

			// 세션에서 사용자 권한을 확인하여 관리자인지 확인
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if (user != null && "admin".equals(user.getAut())) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/viewAdmin/dashBoard.jsp");
				dispatcher.forward(request, response);
			} else {
				// 사용자가 로그인하지 않았거나 권한이 없는 경우에는 에러 페이지로 리다이렉트
				response.sendRedirect("view/errorPage.jsp");
			}
			// ---------------------------------

		} else if (PATH.equals("/userList.admin")) {
			System.out.println("유저리스트 페이지로로 이동");

			request.setAttribute("userAll", uDao.getAll());

			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewAdmin/userList.jsp");
			dispatcher.forward(request, response);

			// ---------------------------------

		} else if (PATH.equals("/userDetail.admin")) {
			System.out.println("회원 정보 상세보기 페이지");
			// 버튼 누르면 상세 조회되게
			int uId = Integer.parseInt(request.getParameter("uId"));

			User user = uDao.getUser(uId); // 이 메서드는 해당 pId에 해당하는 제품 정보를 데이터베이스에서 가져오는 것을 가정합니다.

			// 가져온 제품 정보를 request 객체에 저장합니다.
			request.setAttribute("user", user);

			// 상세 페이지로 포워딩합니다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewAdmin/userDetail.jsp");
			dispatcher.forward(request, response);

			// ---------------------------------

		} else if (PATH.equals("/userDelete.admin")) {
			System.out.println("유저 삭제");

			// 삭제할 회원의 ID 가져오기
			int userId = Integer.parseInt(request.getParameter("uId"));

			// UserDAO를 사용하여 해당 회원을 삭제합니다.
			uDao.delete(userId); // 해당 memberId에 해당하는 회원을 삭제하는 메소드를 가정합니다.

			// 삭제 후, 관련된 페이지로 리다이렉트합니다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("userList.admin");
			dispatcher.forward(request, response);

			// ---------------------------------

		} else if (PATH.equals("/updateUser.admin")) {
			System.out.println("회원 정보 업데이트");
			// 버튼 누르면 상세 조회되게
			int uId = Integer.parseInt(request.getParameter("uId"));

			User user = new User();

			// userDTO 객체로 매핑 후
			// request.getParameter()로 입력값 가져오기
			user.setEmail(request.getParameter("u_Email"));
			user.setName(request.getParameter("u_Name"));
			user.setPassword(request.getParameter("u_Pwd"));
			user.setPhone(request.getParameter("u_Phone"));
			user.setGender(request.getParameter("u_Gender"));
			user.setBirth(request.getParameter("u_Birth"));
			user.setZonecode(request.getParameter("u_Zonecode"));
			user.setAddress(request.getParameter("u_Address"));

			user.setAut(request.getParameter("u_Aut"));
			user.setId(uId);

			// userDAO를 생성하고 updateProductById 메서드 호출
			uDao = new UserDAO();
			uDao.updateUserById(user);

			// 상세 페이지로 포워딩
			RequestDispatcher dispatcher = request.getRequestDispatcher("userDetail.admin?uId=" + uId);
			dispatcher.forward(request, response);

		} else if (PATH.equals("/productInsertForm.admin")) {
			System.out.println("재고등록 페이지로로 이동");

			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewAdmin/productInsert.jsp");
			dispatcher.forward(request, response);

			// ---------------------------------

		} else if (PATH.equals("/productInsert.admin")) {
			System.out.println("재고등록 처리");

			Product pro = new Product();
			// productDTO 객체로 매핑 후
			// request.getParameter()로 입력값 가져오기
			pro.setProduct_Type(request.getParameter("p_Type")); // 상품타입
			pro.setProduct_Cat(request.getParameter("p_Cat")); // 상품카테고리
			pro.setProduct_Name(request.getParameter("p_Name")); // 상품이름
			int price = Integer.parseInt(request.getParameter("p_Price")); // 상품가격 입력값은 문자열이므로 정수형으로 변환
			pro.setProduct_Price(price); // 변환한 값 담기
			pro.setProduct_Img(request.getParameter("p_Img")); // 상품이미지
			pro.setProduct_Con(request.getParameter("p_Con")); // 상품설명

			// pdao.insert() 메소드 호출

			int productId = pDao.insert(pro);

			// 옵션 등록 처리
			String[] optionNames = request.getParameterValues("o_Name[]");
			String[] optionGrades = request.getParameterValues("o_Grade[]");
			String[] optionQtysStr = request.getParameterValues("o_Qty[]");
			String[] optionImages = request.getParameterValues("o_Img[]");

			OptionDAO odao = new OptionDAO();
			for (int i = 0; i < optionNames.length; i++) {
				Option option = new Option();
				option.setProduct_ID(productId);
				option.setOption_Name(optionNames[i]);
				option.setOption_Grade(optionGrades[i]);
				option.setOption_Qty(Integer.parseInt(optionQtysStr[i]));
				option.setOption_Img(optionImages[i]);
				odao.insert(option);
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher("productInsertForm.admin");
			dispatcher.forward(request, response);

			// ---------------------------------

		} else if (PATH.equals("/productList.admin")) {
			System.out.println("재고리스트 목록 페이지");

			ProductDAO productDAO = new ProductDAO();

			// 모든 제품 목록을 가져옴
			List<Product> productList = productDAO.getAll();

			// 가져온 제품 목록을 productList.jsp로 전달
			request.setAttribute("productList", productList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewAdmin/productList.jsp");
			dispatcher.forward(request, response);

			// ---------------------------------

		} else if (PATH.equals("/productDetail.admin")) {
			System.out.println("상품 정보 상세보기 페이지");
			// 버튼 누르면 상세 조회되게
			int pId = Integer.parseInt(request.getParameter("pId"));

			Product product = pDao.getProductById(pId); // 이 메서드는 해당 pId에 해당하는 제품 정보를 데이터베이스에서 가져오는 것을 가정합니다.
			List<Option> optionList = oDao.getProductOptionsById(pId);

			// 가져온 제품 정보를 request 객체에 저장합니다.
			request.setAttribute("product", product);
			request.setAttribute("optionList", optionList);

			// 상세 페이지로 포워딩합니다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewAdmin/productDetail.jsp");
			dispatcher.forward(request, response);

			// ---------------------------------

		} else if (PATH.equals("/updateProduct.admin")) {
			System.out.println("상품 정보 업데이트");
			// 버튼 누르면 상세 조회되게
			int pId = Integer.parseInt(request.getParameter("pId"));

			Product pro = new Product();

			// productDTO 객체로 매핑 후
			// request.getParameter()로 입력값 가져오기
			pro.setProduct_Type(request.getParameter("p_Type")); // 상품타입
			pro.setProduct_Cat(request.getParameter("p_Cat")); // 상품카테고리
			pro.setProduct_Name(request.getParameter("p_Name")); // 상품이름
			int price = Integer.parseInt(request.getParameter("p_Price")); // 상품가격 입력값은 문자열이므로 정수형으로 변환
			pro.setProduct_Price(price); // 변환한 값 담기
			pro.setProduct_Img(request.getParameter("p_Img")); // 상품이미지
			pro.setProduct_Con(request.getParameter("p_Con")); // 상품설명
			pro.setProduct_Id(pId); // 상품 ID 설정

			// ProductDAO를 생성하고 updateProductById 메서드 호출
			ProductDAO pdao = new ProductDAO();
			pdao.updateProductById(pro);

			// 상세 페이지로 포워딩
			RequestDispatcher dispatcher = request.getRequestDispatcher("productDetail.admin?pId=" + pId);
			dispatcher.forward(request, response);

			// ---------------------------------

		} else if (PATH.equals("/deleteProduct.admin")) {
			System.out.println("재고 삭제 처리");

			int pId = Integer.parseInt(request.getParameter("pId"));

			// ProductDAO를 사용하여 해당 제품을 삭제합니다.
			pDao = new ProductDAO();
			pDao.deleteProductById(pId); // 해당 pId에 해당하는 제품을 삭제하는 메소드를 가정합니다.

			// 삭제 후, 관련된 페이지로 리다이렉트합니다.
			response.sendRedirect("productList.admin");

			// ---------------------------------

		} else if (PATH.equals("/optionInserForm.admin")) {
			System.out.println("옵션추가 페이지로로 이동");

			int pId = Integer.parseInt(request.getParameter("pId"));

			Product product = pDao.getProductById(pId); // 이 메서드는 해당 pId에 해당하는 제품 정보를 데이터베이스에서 가져오는 것을 가정합니다.

			// 가져온 제품 정보를 request 객체에 저장합니다.
			request.setAttribute("product", product);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewAdmin/optionInsert.jsp");
			dispatcher.forward(request, response);

			// ---------------------------------

		} else if (PATH.equals("/optinInsert.admin")) {
			System.out.println("옵션추가 처리");
			int pId = Integer.parseInt(request.getParameter("pId"));

			// 옵션 등록 처리
			String[] optionNames = request.getParameterValues("o_Name[]");
			String[] optionGrades = request.getParameterValues("o_Grade[]");
			String[] optionQtysStr = request.getParameterValues("o_Qty[]");
			String[] optionImages = request.getParameterValues("o_Img[]");

			oDao = new OptionDAO();
			for (int i = 0; i < optionNames.length; i++) {
				Option option = new Option();
				option.setProduct_ID(pId);
				option.setOption_Name(optionNames[i]);
				option.setOption_Grade(optionGrades[i]);
				option.setOption_Qty(Integer.parseInt(optionQtysStr[i]));
				option.setOption_Img(optionImages[i]);
				oDao.insert(option);
			}
			// 옵션 추가 후에 부모 창을 새로고침하는 JavaScript를 출력
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("window.opener.location.reload();"); // 부모 창 새로고침
			out.println("window.close();"); // 팝업 창 닫기
			out.println("</script>");

			// ---------------------------------

		} else if (PATH.equals("/updateOption.admin")) {
			System.out.println("옵션 수정 처리");

			int oId = Integer.parseInt(request.getParameter("oId"));
			int pId = Integer.parseInt(request.getParameter("pId"));
			Option opt = new Option();

			// productDTO 객체로 매핑 후
			// request.getParameter()로 입력값 가져오기
			opt.setOption_ID(oId);
			opt.setProduct_ID(pId);
			opt.setOption_Name(request.getParameter("option_name")); // 상품타입
			opt.setOption_Grade(request.getParameter("option_Grade")); // 상품카테고리
			opt.setOption_Img(request.getParameter("option_Img")); // 상품이름
			int qty = Integer.parseInt(request.getParameter("option_Qty")); // 상품가격 입력값은 문자열이므로 정수형으로 변환
			opt.setOption_Qty(qty); // 변환한 값 담기

			// ProductDAO를 생성하고 updateProductById 메서드 호출
			oDao.update(opt);
			response.sendRedirect("productDetail.admin?pId=" + pId);

			// ---------------------------------

		} else if (PATH.equals("/deleteOption.admin")) {
			System.out.println("옵션 삭제 처리");

			int oId = Integer.parseInt(request.getParameter("oId"));
			int pId = Integer.parseInt(request.getParameter("pId"));
			// ProductDAO를 사용하여 해당 제품을 삭제합니다.
			oDao = new OptionDAO();
			oDao.delete(oId); // 해당 pId에 해당하는 제품을 삭제하는 메소드 호출.

			// 삭제 후, 관련된 페이지로 리다이렉트합니다.
			response.sendRedirect("productDetail.admin?pId=" + pId);

		} else if (PATH.equals("/saleInsertForm.admin")) {
			System.out.println("제품 등록 페이지");
			// 버튼 누르면 상세 조회되게
			int pId = Integer.parseInt(request.getParameter("pId"));

			Product product = pDao.getProductById(pId); // 이 메서드는 해당 pId에 해당하는 제품 정보를 데이터베이스에서 가져오는 것을 가정합니다.
//			List<Option> optionList = oDao.getProductOptionsById(pId);

			// 가져온 제품 정보를 request 객체에 저장합니다.
			request.setAttribute("product", product);
//			request.setAttribute("optionList", optionList);

			// 상세 페이지로 포워딩합니다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewAdmin/saleInsert.jsp");
			dispatcher.forward(request, response);
			// ---------------------------------

		} else if (PATH.equals("/saleInsert.admin")) {

			Sale sale = new Sale();

			int pId = Integer.parseInt(request.getParameter("pId"));
			sale.setProduct_ID(pId);

			int Ragular_Price = Integer.parseInt(request.getParameter("s_RegPrice"));
			sale.setRegular_Price(Ragular_Price);

			int Sale_Price = Integer.parseInt(request.getParameter("s_Price"));
			sale.setSale_Price(Sale_Price);

			double Discount_Rate = Double.parseDouble(request.getParameter("s_DiscontRate")) / 100.0;
			sale.setDiscount_Rate(Discount_Rate);

			sale.setSale_Description(request.getParameter("s_Description"));

			sDao.saleInsert(sale);

			response.sendRedirect("adminPage.admin");

			// ---------------------------------

		} else if (PATH.equals("/saleList.admin")) {
			System.out.println("판매리스트 목록 페이지");

			SaleViewDAO saleViewDAO = new SaleViewDAO();

			// 모든 제품 목록을 가져옴
			List<SaleView> saleList = saleViewDAO.getAll();

			// 가져온 제품 목록을 productList.jsp로 전달
			request.setAttribute("saleList", saleList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewAdmin/saleList.jsp");
			dispatcher.forward(request, response);

		} else if (PATH.equals("/saleDetail.admin")) {
			System.out.println("상품 정보 상세보기 페이지");
			// 버튼 누르면 상세 조회되게
			int pId = Integer.parseInt(request.getParameter("pId"));
			int sId = Integer.parseInt(request.getParameter("sId"));

//			Product product = pDao.getProductById(pId); // 이 메서드는 해당 pId에 해당하는 제품 정보를 데이터베이스에서 가져오는 것을 가정합니다.
			Sale sale = sDao.getProductById(sId);
			Product product = pDao.getProductById(pId);
			
			// 가져온 제품 정보를 request 객체에 저장합니다.
			request.setAttribute("product", product);
			request.setAttribute("sale", sale);
			

			// 상세 페이지로 포워딩합니다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewAdmin/saleDetail.jsp");
			dispatcher.forward(request, response);

			// ---------------------------------
		}

	}
}