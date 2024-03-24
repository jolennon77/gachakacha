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

@WebServlet("*.user")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    // 생성자에서 UserDAO 객체 초기화
    public UserController() {
        super();
        userDAO = new UserDAO();
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
                // 요청에 따라 처리
                if (PATH.equals("/list.user")) { // 사용자 목록 페이지 요청
                    userList(request, response);
                } else if (PATH.equals("/detail.user")) { // 사용자 상세 정보 보기 페이지 요청
                    userDetail(request, response);
                } else if (PATH.equals("/delete.user")) { // 사용자 삭제 처리 요청
                    userDelete(request, response);
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

    // POST 요청 처리
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // GET 요청과 동일한 처리
        
        final String URI = request.getRequestURI();
        final String PATH = URI.substring(URI.lastIndexOf("/"));
        
        if (PATH.equals("/update.user")) {
            userUpdate(request, response);
        }
    }
    
    // 사용자 정보 업데이트 처리 메서드
    public void userUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("회원 정보 업데이트");
        // 버튼 누르면 상세 조회되게
        int uId = Integer.parseInt(request.getParameter("uId"));

        User user = new User();

        // 사용자 정보 설정
        user.setEmail(request.getParameter("u_Email"));
        user.setName(request.getParameter("u_Name"));
        user.setPassword(request.getParameter("u_Pwd"));
        user.setPhone(request.getParameter("u_Phone"));
        user.setGender(request.getParameter("u_Gender"));
        user.setBirth(request.getParameter("u_Birth"));
        user.setAddress(request.getParameter("u_Address"));
        user.setAut(request.getParameter("u_Aut"));
        user.setId(uId);

        // 사용자 정보 업데이트
        userDAO.userUpdate(user);

        // 상세 페이지로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/detail.user?uId=" + uId);
    }

    // 사용자 목록 페이지 처리 메서드
    private void userList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 모든 사용자 목록을 가져와서 request에 설정
        request.setAttribute("userList", userDAO.userList());
        // 사용자 목록 페이지로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/user/userList.jsp");
        dispatcher.forward(request, response);
    }

    // 사용자 상세 정보 보기 페이지 처리 메서드
    private void userDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("uId")); // 요청 파라미터에서 사용자 ID 가져옴
        // 해당 사용자의 상세 정보를 가져와서 request에 설정
        User user = userDAO.getUserById(userId);
        request.setAttribute("user", user);
        // 사용자 상세 정보 페이지로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/user/userDetail.jsp");
        dispatcher.forward(request, response);
    }

    // 사용자 삭제 처리 메서드
    private void userDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("uId")); // 요청 파라미터에서 사용자 ID 가져옴
        // 사용자 삭제 처리
        userDAO.userDelete(userId);
        // 사용자 목록 페이지로 리다이렉트
        response.sendRedirect("list.user");
    }
}
