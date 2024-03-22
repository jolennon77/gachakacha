package controller;

import java.io.IOException;

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

		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		String phone_1 = request.getParameter("phone_1");
		String phone_2 = request.getParameter("phone_2");
		String phone_3 = request.getParameter("phone_3");
		String phone = phone_1+"-"+phone_2+"-"+phone_3;
		
		String gender = request.getParameter("gender");
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date = request.getParameter("date");
		String birth = year+"-"+month+"-"+date;
		
		String address1 = request.getParameter("address");
		String address2 = request.getParameter("address");
		String address = address1 +" "+address2;
		
		
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setPhone(phone);
		user.setGender(gender);
		user.setBirth(birth);
		user.setAddress(address);
		uDao.insert(user);
		
		 response.sendRedirect("index.jsp");
	}

}
