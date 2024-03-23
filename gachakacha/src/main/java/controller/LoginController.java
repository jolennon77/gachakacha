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

import dao.UserDAO;
import dto.User;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 먼저 한글 필터 처리 부터 하기

	public LoginController() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("로그인 처리");

		// 요청 파라미터에서 이메일과 비밀번호 가져오기
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// 이메일과 비밀번호가 유효한지 확인
		 if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
		        // 이메일 또는 비밀번호가 비어있는 경우 오류 메시지 설정
		        request.setAttribute("errorMessage", "이메일과 비밀번호를 모두 입력해주세요.");
		        // 로그인 페이지로 포워딩
		        RequestDispatcher dispatcher = request.getRequestDispatcher("loginView.do");
		        dispatcher.forward(request, response);
		        return;
		    }

		// DB에서 사용자 정보 가져오기
		UserDAO dao = new UserDAO();
		User user = dao.getUser(email);

		// 사용자가 존재하고 비밀번호가 일치하는지 확인
		if (user != null && user.getPassword().equals(password)) {
			// 세션에 사용자 정보 저장
			 HttpSession session = request.getSession();
	            session.setAttribute("user", user);
	            
	            // JavaScript 함수 호출하여 팝업 알림 표시
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ user.getName() + "님, 환영합니다!'); window.location.href='main.do';</script>");
	            out.flush();
		  } else {
		        // 실패 시 오류 메시지 설정
		        request.setAttribute("errorMessage", "이메일 또는 비밀번호가 올바르지 않습니다.");
		        // 로그인 페이지로 포워딩
		        RequestDispatcher dispatcher = request.getRequestDispatcher("loginView.do");
		        dispatcher.forward(request, response);
		    }
		}
}