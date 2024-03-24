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

import dao.OrderDAO;
import dao.OptionDAO;
import dao.UserDAO;
import dto.Orders;
import dto.Option;
import dto.User;

@WebServlet("*.order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO orderDAO;
	private OptionDAO optionDAO;
	private UserDAO userDAO;

	public OrderController() {
		super();
		orderDAO = new OrderDAO();
		optionDAO = new OptionDAO();
		userDAO = new UserDAO();
	}

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
				if (PATH.equals("/list.order")) {
					// 주문 관리 페이지로 이동
					orderList(request, response);
				} else if (PATH.equals("/delete.order")) {
					// 주문 삭제 처리
					orderDelete(request, response);
				} else if (PATH.equals("/detail.order")) {
					// 주문 정보 상세보기 페이지로 이동
					orderDetail(request, response);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String URI = request.getRequestURI();
		final String PATH = URI.substring(URI.lastIndexOf("/"));

		if (PATH.equals("/update.order")) {
			// 주문 정보 업데이트 처리
			orderUpdate(request, response);
		}
	}

	// 주문 정보 업데이트 처리
	public void orderUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("주문 정보 업데이트");

		// 주문 ID 가져오기
		int orderId = Integer.parseInt(request.getParameter("odId"));

		// 수정할 주문 정보 설정
		Orders order = new Orders();
		order.setOrders_Status(request.getParameter("Orders_Status"));
		order.setShip_Number(request.getParameter("Ship_Number"));
		order.setOrders_Memo(request.getParameter("Orders_Memo"));
		order.setOrders_ID(orderId);

		// 주문 정보 업데이트
		orderDAO.updateOrderById(order);

		// 주문 리스트 페이지로 리다이렉트
		response.sendRedirect("list.order");
	}

	// 주문 관리 페이지로 이동
	private void orderList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("주문 관리 페이지");

		// 모든 주문 목록을 가져와서 request에 설정
		request.setAttribute("orderAll", orderDAO.getAll());

		// 주문 관리 페이지로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/order/orderList.jsp");
		dispatcher.forward(request, response);
	}

	// 주문 삭제 처리
	private void orderDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("주문 삭제");

		// 삭제할 주문의 ID 가져오기
		int orderId = Integer.parseInt(request.getParameter("odId"));

		// 주문 삭제
		orderDAO.delete(orderId);

		// 삭제 후, 관련된 페이지로 리다이렉트
		response.sendRedirect("list.order");
	}

	// 주문 정보 상세보기 페이지로 이동
	private void orderDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("주문 정보 상세보기 페이지");

		// 주문 ID 가져오기
		int orderId = Integer.parseInt(request.getParameter("odId"));

		// 해당 주문의 상세 정보 가져오기
		Orders order = orderDAO.getOrderId(orderId);
		int userId = order.getUser_ID();

		// 주문을 한 사용자의 정보 가져오기
		User user = userDAO.getUserById(userId);

		// 주문에 대한 옵션 목록 가져오기
		List<Option> options = optionDAO.getOptionbyOrderId(orderId);

		// 가져온 정보를 request 객체에 설정
		request.setAttribute("order", order);
		request.setAttribute("user", user);
		request.setAttribute("options", options);

		// 주문 정보 상세보기 페이지로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/adminView/order/orderDetail.jsp");
		dispatcher.forward(request, response);
	}
}
