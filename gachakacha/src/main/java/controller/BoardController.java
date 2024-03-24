package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.UserDAO;
import dto.Board;
import dto.Product;
import dto.Sale;
import dto.User;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO;

    // 생성자에서 UserDAO 객체 초기화
    public BoardController() {
        super();
        boardDAO = new BoardDAO();
    }

    // GET 요청 처리
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        // URI 및 경로 추출
    	final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));
		
//		// 요청에 따라 처리
		if (PATH.equals("/insertForm.board")) { // 재고등록 페이지로 이동 요청
			boardInsertForm(request, response);
		}
    }

    // POST 요청 처리
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // GET 요청과 동일한 처리
        
       	final String URI = request.getRequestURI();
    	final String PATH = URI.substring(URI.lastIndexOf("/"));
        
    	if (PATH.equals("/insert.board")) {
    		boardInsert(request, response);
    	}
        
    }
    
    
    private void boardInsertForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 게시글 등록 페이지로 이동
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/board/boardInsert.jsp");
        dispatcher.forward(request, response); // productInsert.jsp로 포워딩
    }
    
        private void boardInsert(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            // 세일 등록 처리
            Board board = new Board();
            board.setBoard_Cat1(request.getParameter("Board_Cat1"));
            board.setBoard_Cat2(request.getParameter("Board_Cat2"));
            board.setProduct_Id(1);
            board.setBoard_Title(request.getParameter("Board_Title"));
            int userId = Integer.parseInt(request.getParameter("uId"));
            board.setUser_ID(userId);
            board.setBoard_Pwd(request.getParameter("Board_Pwd"));
            board.setBoard_Content(request.getParameter("Board_Content"));
           
            
            
            
            
            boardDAO.insert(board);

            // 등록 후, 세일 리스트 페이지로 리다이렉트합니다.
            response.sendRedirect("list.sale");
        }

}

    


    
    
    
    
    
    
    
    
    
    
    
    
    
