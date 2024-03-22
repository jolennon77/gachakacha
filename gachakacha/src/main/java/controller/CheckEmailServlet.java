package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserDAO;

@WebServlet("/checkEmail")
public class CheckEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 클라이언트에서 전송된 이메일 가져오기
        String email = request.getParameter("User_Email"); // 수정된 부분
        
        // 이메일 중복 확인을 위해 DAO를 사용
        UserDAO dao = new UserDAO();
        
        // 이메일이 이미 존재하는지 확인
        boolean emailExists = dao.checkEmailExists(email);
        
        // 결과를 클라이언트에게 응답
        response.setContentType("text/plain");
        response.getWriter().write(String.valueOf(emailExists));
    }
}

