package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.User;

@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDAO uDao;

	public SignupController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		uDao = new UserDAO();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = new User();
		
		user.setEmail(request.getParameter("email"));
		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
		
		String phone = request.getParameter("phone_1")+"-"+
					   request.getParameter("phone_2")+"-"+
					   request.getParameter("phone_3");
		user.setPhone(phone);
		
		user.setGender(request.getParameter("gender"));
		
		String birth = request.getParameter("year")+"-"+
					   request.getParameter("month")+"-"+
					   request.getParameter("date");
		user.setBirth(birth);
		
		String address = request.getParameter("address1")+" "+
						 request.getParameter("address2");
		user.setAddress(address);
		
		uDao.insert(user);
		
		
        request.setAttribute("errorMessage", "회원가입 성공");
        // 로그인 페이지로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("loginView.do");
        dispatcher.forward(request, response);
	}

}
