package controller;

import java.io.IOException;

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
@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 세션을 가져옵니다.
        HttpSession session = request.getSession(false);
        
        // 세션이 존재하면 세션을 무효화하고 모든 세션 데이터를 삭제
        if (session != null) {
            session.invalidate();
        }
        
        // 로그아웃 후 리다이렉트할 페이지를 지정
        String redirectURL = request.getContextPath() + "/index.jsp"; // 로그아웃 후 index.jsp로 이동하도록 설정
        
        // 로그아웃 후 지정된 페이지로 리다이렉트
        response.sendRedirect(redirectURL);
    }
}