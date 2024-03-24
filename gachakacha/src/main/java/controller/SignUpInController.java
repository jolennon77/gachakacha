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

@WebServlet({ "/login", "/logout", "/signup", "/checkEmail" })
public class SignUpInController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAO userDAO;

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String servletPath = request.getServletPath();
		switch (servletPath) {
		case "/login":
			login(request, response);
			break;
		case "/signup":
			signup(request, response);
			break;
		case "/checkEmail":
			checkEmail(request, response);
                break;
		}
	}

	public void checkEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("User_Email"); // 수정된 부분

		// 이메일 중복 확인을 위해 DAO를 사용
		UserDAO dao = new UserDAO();

		// 이메일이 이미 존재하는지 확인
		boolean emailExists = dao.checkEmailExists(email);

		// 결과를 클라이언트에게 응답
		response.setContentType("text/plain");
		response.getWriter().write(String.valueOf(emailExists));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String servletPath = request.getServletPath();
		switch (servletPath) {
		case "/logout":
			logout(request, response);
			break;
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그인 처리");

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
			request.setAttribute("errorMessage", "이메일과 비밀번호를 모두 입력해주세요.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginView.do");
			dispatcher.forward(request, response);
			return;
		}

		User user = userDAO.getUserByEmail(email);

		if (user != null && user.getPassword().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('" + user.getName() + "님, 환영합니다!'); window.location.href='main.do';</script>");
			out.flush();
		} else {
			request.setAttribute("errorMessage", "이메일 또는 비밀번호가 올바르지 않습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginView.do");
			dispatcher.forward(request, response);
		}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		String redirectURL = request.getContextPath() + "/index.jsp";
		response.sendRedirect(redirectURL);
	}

	private void signup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();

		user.setEmail(request.getParameter("email"));
		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));

		String phone = request.getParameter("phone_1") + "-" + request.getParameter("phone_2") + "-"
				+ request.getParameter("phone_3");
		user.setPhone(phone);

		user.setGender(request.getParameter("gender"));

		String birth = request.getParameter("year") + "-" + request.getParameter("month") + "-"
				+ request.getParameter("date");
		user.setBirth(birth);

		String address = request.getParameter("address1") + " " + request.getParameter("address2");
		user.setAddress(address);

		userDAO.userInsert(user);

		request.setAttribute("errorMessage", "회원가입 성공");
		RequestDispatcher dispatcher = request.getRequestDispatcher("loginView.do");
		dispatcher.forward(request, response);
	}
}