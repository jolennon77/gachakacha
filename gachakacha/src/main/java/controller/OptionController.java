package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OptionDAO;
import dao.ProductDAO;
import dto.Option;
import dto.Product;
import dto.User;

@WebServlet("*.option")
public class OptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO pDao;
	private OptionDAO oDao;

	public void init() {
		pDao = new ProductDAO();
		oDao = new OptionDAO();
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

				if (PATH.equals("/insertForm.option")) {
					// 옵션 추가 페이지로 이동
					insertForm(request, response);

				} else if (PATH.equals("/delete.option")) {
					// 옵션 삭제 처리
					deleteOption(request, response);
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

		if (PATH.equals("/insert.option")) { // 상품 등록 처리 요청
			insertOption(request, response);
		} else if (PATH.equals("/update.option")) { // 옵션 수정 처리
			updateOption(request, response);
		}
	}

	// 옵션 추가 페이지 이동 처리 메서드
	private void insertForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pId = Integer.parseInt(request.getParameter("pId"));
		// 해당 제품의 정보를 가져와 request에 설정
		Product product = pDao.getProductById(pId);
		request.setAttribute("product", product);
		// 옵션 추가 페이지로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/product/optionInsert.jsp");
		dispatcher.forward(request, response);
	}

	// 옵션 추가 처리 메서드
	private void insertOption(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		// 옵션 추가 후 부모 창을 새로고침하는 JavaScript 출력
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();"); // 부모 창 새로고침
		out.println("window.close();"); // 팝업 창 닫기
		out.println("</script>");
	}

	// 옵션 수정 처리 메서드
	private void updateOption(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int oId = Integer.parseInt(request.getParameter("oId"));
		int pId = Integer.parseInt(request.getParameter("pId"));
		Option opt = new Option();
		// 옵션 정보 설정
		opt.setOption_ID(oId);
		opt.setProduct_ID(pId);
		opt.setOption_Name(request.getParameter("option_name")); // 옵션 이름
		opt.setOption_Grade(request.getParameter("option_Grade")); // 옵션 등급
		opt.setOption_Img(request.getParameter("option_Img")); // 옵션 이미지
		int qty = Integer.parseInt(request.getParameter("option_Qty")); // 옵션 수량
		opt.setOption_Qty(qty);
		// 옵션 수정 처리
		oDao.update(opt);
		response.sendRedirect(request.getContextPath() + "/detail.product?pId=" + pId);
	}

	// 옵션 삭제 처리 메서드
	private void deleteOption(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int oId = Integer.parseInt(request.getParameter("oId"));
		int pId = Integer.parseInt(request.getParameter("pId"));
		oDao = new OptionDAO();
		// 옵션 삭제 처리
		oDao.delete(oId);
		// 삭제 후 제품 상세 페이지로 리다이렉트
		response.sendRedirect(request.getContextPath() + "/detail.product?pId=" + pId);
	}

}