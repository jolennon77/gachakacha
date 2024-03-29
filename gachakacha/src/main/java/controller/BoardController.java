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

import dao.BoardDAO;
import dao.UserDAO;
import dto.Board;
import dto.User;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDAO boardDAO;
	private UserDAO userDAO;

	// 생성자에서 UserDAO 객체 초기화
	public BoardController() {
		super();
		boardDAO = new BoardDAO();
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

//		// 요청에 따라 처리
				if (PATH.equals("/insertForm.board")) { // 재고등록 페이지로 이동 요청
					boardInsertForm(request, response);
				}

				else if (PATH.equals("/list.board")) { // 재고리스트 목록 페이지 요청
					boardList(request, response);
				} else if (PATH.equals("/detail.board")) { // 재고리스트 목록 페이지 요청
					boardDetail(request, response);
				} else if (PATH.equals("/delete.board")) {
					boardDelete(request, response);
				} else if (PATH.equals("/detailByUser.board")) {
					boardListByUserId(request, response);
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

		if (PATH.equals("/insert.board")) {
			boardInsert(request, response);
		} else if (PATH.equals("/update.board")) {
			boardUpdate(request, response);
		
		}

	}

	private void boardList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String boardcat1 = request.getParameter("bcat"); //
		List<Board> boardList = boardDAO.getAll(boardcat1); // 모든 제품 정보를 가져옴

		request.setAttribute("boardcat1", boardcat1);
		request.setAttribute("boardList", boardList); // request에 productList 속성 추가
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/board/boardList.jsp");
		dispatcher.forward(request, response); // productList.jsp로 포워딩
	}
	
	
	private void boardListByUserId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("uId")); //
		List<Board> boardList = boardDAO.getAllByUserId(userId); // 모든 제품 정보를 가져옴
		System.out.println("dd");
		request.setAttribute("boardList", boardList); // request에 productList 속성 추가
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/board/boardListByUserId.jsp");
		dispatcher.forward(request, response); // productList.jsp로 포워딩
	}


	private void boardInsertForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String boardcat1 = request.getParameter("bcat"); //
		request.setAttribute("boardcat1", boardcat1);
		// 게시글 등록 페이지로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/board/boardInsert.jsp");
		dispatcher.forward(request, response); // productInsert.jsp로 포워딩
	}

	private void boardInsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Board board = new Board();
		board.setBoard_Cat1(request.getParameter("bcat1"));
		board.setBoard_Cat2(request.getParameter("Board_Cat2"));
		board.setProduct_Id(1);
		board.setBoard_Title(request.getParameter("Board_Title"));
		int userId = Integer.parseInt(request.getParameter("uId"));
		board.setUser_ID(userId);
		board.setBoard_Pwd(request.getParameter("Board_Pwd"));
		board.setBoard_Content(request.getParameter("Board_Content"));

		boardDAO.insert(board);

		// 등록 후, 세일 리스트 페이지로 리다이렉트합니다.
		response.sendRedirect(request.getContextPath() + "/list.board?bcat=" + board.getBoard_Cat1());
	}

	private void boardDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("bId")); // 요청 파라미터에서 상품 ID 가져옴
		Board board = boardDAO.getBoardById(boardId); // 해당 ID의 제품 정보 가져옴
//		int a = board.getUser_ID();
//		System.out.println(a);
		User user = userDAO.getUserById(board.getUser_ID());

		request.setAttribute("board", board); // request에 product 속성 추가
		request.setAttribute("user", user); // request에 optionList 속성 추가
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/board/boardDetail.jsp");
		dispatcher.forward(request, response); // productDetail.jsp로 포워딩
	}

	public void boardUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(" 정보 업데이트");
		// 버튼 누르면 상세 조회되게
		int bId = Integer.parseInt(request.getParameter("bId"));
		int userId = Integer.parseInt(request.getParameter("uId"));

		Board board = new Board();

		board.setBoard_ID(bId);
		board.setBoard_Cat1(request.getParameter("bcat1"));
		board.setBoard_Cat2(request.getParameter("Board_Cat2"));
		board.setProduct_Id(1);
		board.setBoard_Title(request.getParameter("Board_Title"));
		board.setUser_ID(userId);
		board.setBoard_Pwd(request.getParameter("Board_Pwd"));
		board.setBoard_Content(request.getParameter("Board_Content"));
		boardDAO.boardUpdate(board);

		response.sendRedirect(request.getContextPath() + "/detail.board?bId=" + bId);
	}

	
	private void boardDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 삭제");

		// 삭제할 주문의 ID 가져오기
		int boardId = Integer.parseInt(request.getParameter("bId"));
		String board_Cat1 = request.getParameter("bcat1");
		// saleDAO를 사용하여 해당 주문을 삭제합니다.
		boardDAO.boardDelete(boardId);

		// 삭제 후, 관련된 페이지로 리다이렉트합니다.
		response.sendRedirect("list.board?bcat="+board_Cat1);
	}
}
