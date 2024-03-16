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

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 먼저 한글 필터 처리 부터 하기

	public DispatcherServlet() {
		super();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// #1. 사용자 요청이 들어오면 요청 경로(path)를 추출
		final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));

		if (PATH.equals("/loginView.do")) {
			System.out.println("로그인 화면으로 이동");

			RequestDispatcher dispatcher = request.getRequestDispatcher("view/login.jsp");
			dispatcher.forward(request, response);
			
		} else if (PATH.equals("/main.do")) {
			System.out.println("쇼핑몰메인화면이동");

			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			
//		} else if (PATH.equals("/insertBoardView.do")) {
//			System.out.println("글 등록 화면으로 이동");
//
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/board/insertBoard.jsp");
//			dispatcher.forward(request, response);
//
//		} else if (PATH.equals("/insertUserView.do")) {
//			System.out.println("회원 가입 화면으로 이동");
//
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/board/insertUser.jsp");
//			dispatcher.forward(request, response);

		} else if (PATH.equals("/infoBord.do")) {
			System.out.println("공지사항으로 이동");

			RequestDispatcher dispatcher = request.getRequestDispatcher("/infoBord");
			dispatcher.forward(request, response);

			
			//로그아웃
		} else if (PATH.equals("/logout.do")) {
			System.out.println("로그아웃 처리");
			// 로그아웃을 처리하는 서블릿으로 포워딩
			RequestDispatcher dispatcher = request.getRequestDispatcher("/logout");
			dispatcher.forward(request, response);
			
			
			
//-----------------------------------------어드민 영역--------------------------------------
//			//어드민 페이지로 이동
//		} else if (PATH.equals("/adminPage.do")) {
//			System.out.println("어드민페이지 이동");
//			// 어드민페이지 이동을 처리하는 서블릿으로 포워딩
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/adminPage.admin");
//			dispatcher.forward(request, response);
//			
		}
	}
}