package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.QnA;

public class BoardDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
										
									
	private  String QNA_INSERT ="insert into QNA(QnA_Cat, Product_ID, Customer_ID, QnA_Title, QnA_Content, QnA_Date ,QnA_Writer) values(?,?,?,?,?,?,?)";
	private  String QNA_UPDATE = "update QNA set title=?, content=? where QnA_Id=?";
	private  String QNA_DELETE = "delete from QNA where QnA_Id=?";
	private  String QNA_GET = "select * from QNA where QnA_Id=?";
	private  String QNA_GETALL ="select * from QNA order by QnA_Id desc";
	
	
	//검색 관련
		//private String BOARD_LIST_T ="select * from board where title like ? order by seq desc";
		//private String BOARD_LIST_C ="select * from board where content like ? order by seq desc";
		//private String BOARD_LIST_C ="select * from board where content like ? order by seq desc";
		
		//글 등록
		public void insertBoard(QnA dto) {
			
			try {
				con = MyDBConnection.getConnection();
				pstmt = con.prepareStatement(BOARD_INSERT);
				pstmt.setString(1,dto.getTitle());
				pstmt.setString(2,dto.getWriter());
				pstmt.setString(3,dto.getContent());
				
				pstmt.executeUpdate();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
		
		}
		
		//글 수정
		//private String BOARD_UPDATE ="update board set title=?, content=? where seq=?";
		public void updateBoard(BoardDTO dto) {
			
			try {
				con = MyDBConnection.getConnection();
				pstmt = con.prepareStatement(BOARD_UPDATE);
				pstmt.setString(1,dto.getTitle());
				pstmt.setString(2,dto.getContent());
				//pstmt.setString(3,dto.getWriter());
				pstmt.setInt(3,dto.getSeq());
				
				pstmt.executeUpdate();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
		
		}
		
		// 글 삭제
		
		public void deleteBoard(BoardDTO dto) {
			
			try {
				con = MyDBConnection.getConnection();
				pstmt = con.prepareStatement(BOARD_DELETE);
				pstmt.setInt(1, dto.getSeq());
				
				pstmt.executeUpdate();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
		
		}
		
		
		
		//글 상세 조회
		public BoardDTO getBoard(BoardDTO dto) { 
			// 번호 하나로만 검색하기에 번호를 매개값으로 받아도 되지만
			// 결과를 이용하기 해서 상세 검색을 표현하기 위해 BoardDTO로 받음
			BoardDTO board = null;
			
			try {
				con = MyDBConnection.getConnection();
				pstmt = con.prepareStatement(BOARD_GET);
				pstmt.setInt(1,dto.getSeq());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					board = new BoardDTO();
				    board.setSeq(rs.getInt("seq"));
				    board.setTitle(rs.getString("title"));
				    board.setWriter(rs.getString("writer"));
				    board.setContent(rs.getString("content"));
				    board.setRegDate(rs.getTimestamp("regDate"));
				    board.setCount(rs.getInt("count"));			
				}			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
			return board;
		}
		
		//글 리스트 검색
		public List<BoardDTO> getBoardList(BoardDTO dto){
			List<BoardDTO> boardList = new ArrayList<>();
			
			try {
				con = MyDBConnection.getConnection();
				
				if(dto.getSearchCondition().equalsIgnoreCase("TITLE")) {
					pstmt = con.prepareStatement(BOARD_LIST_T);
				} else if(dto.getSearchCondition().equalsIgnoreCase("CONTENT")) {
					pstmt = con.prepareStatement(BOARD_LIST_C);
				}
				
				String searchKeyword ="%" + dto.getSearchKeyword() + "%";
				
				//pstmt.setString(1, dto.getSearchKeyword());
				pstmt.setString(1, searchKeyword);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardDTO board = new BoardDTO();
					
					board = new BoardDTO();
				    board.setSeq(rs.getInt("seq"));
				    board.setTitle(rs.getString("title"));
				    board.setWriter(rs.getString("writer"));
				    board.setContent(rs.getString("content"));
				    board.setRegDate(rs.getTimestamp("regDate"));
				    board.setCount(rs.getInt("count"));	
				    
				    boardList.add(board);
				}			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
		
			return boardList;
			
		}
		
		
		
		public List<BoardDTO> getBoardAll(BoardDTO dto){
			List<BoardDTO> boardList = new ArrayList<>();
			
			try {
				con = MyDBConnection.getConnection();
				pstmt = con.prepareStatement(BOARD_GETALL);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardDTO board = new BoardDTO();
					
					board = new BoardDTO();
				    board.setSeq(rs.getInt("seq"));
				    board.setTitle(rs.getString("title"));
				    board.setWriter(rs.getString("writer"));
				    board.setContent(rs.getString("content"));
				    board.setRegDate(rs.getTimestamp("regDate"));
				    board.setCount(rs.getInt("count"));	
				    
				    boardList.add(board);
				}			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				MyDBConnection.close(rs, pstmt, con);
			}
		
			return boardList;
			
		}

}
