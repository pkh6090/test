package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO { //데이터베이스 연동부분
	private static BoardDAO instance; //싱글톤 패턴으로 한번만 인스턴스 생성
	//생성하고 다른 클래스에서 공유하여 사용	
	
	private BoardDAO() {
		//매게변수가 없는 기본 생성자				
	}
	
	public static BoardDAO getInstance() {
		//instance 최초 생성
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}
	
	//board 테이블의 레코드 개수
	public int getListCount(String items, String text) {//리스트의 총 건수(items(제목,내용,작성자),text(찾고자하는 문자열))
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		String sql;
		if (items == null && text == null) //검색하고자하는 값이 없으면 전체 수행
			sql = "select count(*) from board";
		else
			sql = "select count(*) from board where " + items + " like '%" + text +	"%'"; //items가 text에서 입력한 단어를 선택
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //select는 executeQuery()
			
			if (rs.next())	{				
				x = rs.getInt(1); //rs에 값을 넣어둠(건수만 불러오므로 if문을 씀)
			}
		} catch (Exception ex) { //SQLException을 써도 무관
			System.out.println("getListCount() 에러: " + ex.getMessage()); //어디에서 오류가 났는지 바로 파악가능
		} finally {	//finally에도 try, catch 를 쓰는게 원칙		
			try { //사용한 것을 다 close를 시킴
				if (rs != null) rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return x;
	}
	
	public int getCommentListCount() {//리스트의 총 건수(items(제목,내용,작성자),text(찾고자하는 문자열))
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		String sql;
		
		sql = "select count(*) from comment  "; //items가 text에서 입력한 단어를 선택
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //select는 executeQuery()
			
			if (rs.next())	{				
				x = rs.getInt(1); //rs에 값을 넣어둠(건수만 불러오므로 if문을 씀)
			}
		} catch (Exception ex) { //SQLException을 써도 무관
			System.out.println("getListCount() 에러: " + ex.getMessage()); //어디에서 오류가 났는지 바로 파악가능
		} finally {	//finally에도 try, catch 를 쓰는게 원칙		
			try { //사용한 것을 다 close를 시킴
				if (rs != null) rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return x;
	}
	
	//board 테이블의 레코드 가져오기
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) { 
		//메개변수(현재 페이지, 한 페이지당 보여주는 행 수, 항목들, 검색어)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getListCount(items, text ); //조건에 맞는 데이터 건 수를 가져옴
		int start = (page - 1) * limit; //한 페이지에 건 수를 5개씩 보여줌
		int index = start + 1; //1페이지 일 경우 1부터 5까지, 2페이지 일 경우 6부터 시작한다는 뜻
		
		String sql;
		if (items == null && text == null)
			sql = "select * from board ORDER BY num DESC";
		else
			sql = "SELECT * FROM board where " + items + " like '%" + text + "%' ORDER BY num DESC ";
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.absolute(index)) {//absolute(숫자) : 숫자에 해당하는 ROW위치로 이동
				BoardDTO board = new BoardDTO(); //BoardDTO에다가 담은 이후 board에다가 담음
				
				board.setNum(rs.getInt("num")); //인덱스가 이동했을 때 값을 다 가지고 옴
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getString("regdate"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				list.add(board);
				
			if (index < (start + limit) && index <= total_record) //쳇 페이지부터 그 페이지의 끝까지 실행
				index++;
			else
				break;
				}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList() 에러 : " + ex);
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
			return null;
	}
	//member 테이블에서 인증된 id의 사용자명 가져오기
	public String getLoginNameById(String id) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String name= null;
			
			String sql = "select * from member where id = ? ";
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if (rs.next())
					name = rs.getString("name"); //여기서의 name은 칼럼명
				
				return name; //이름에 대한 값을 뿌려줌
				
			} catch (Exception ex) {
				System.out.println("getBoardByNum() 에러 : " + ex);
			} finally {
				try {
					if (rs != null)	rs.close();
					if (pstmt != null)	pstmt.close();
					if (conn != null)	conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
			return null;
		}
//board 테이블에 새로운 글 삽입히가
	public void insertBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBConnection.getConnection();
			sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getName());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getRegdate());
			pstmt.setInt(7, board.getHit());
			pstmt.setString(8, board.getIp());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertBoard() 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
				}
			}
		}
	
		//선택된 글의 조회수 증가하기
	public void updateHit(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBConnection.getConnection();
			
			sql = "update board" +
			      "   set hit = hit + 1" +
				  " where num = ?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("updateHit() 오류" + e);
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
	}
		//선택된 글 상세 내용 가져오기(수정, 삭제)
		public BoardDTO getBoardByNum(int num, int page) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BoardDTO board = null;
			String sql = null;
			
			updateHit(num);	//게시물 조회수 증가 함수 num=>게시물 번호		
			
			try {
				conn = DBConnection.getConnection();
				sql = "select * from board where num = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs = pstmt.executeQuery(); //게시판 자료를 rs에 대입
				
				if (rs.next()) { //값이 존재하면
					board = new BoardDTO(); //인스턴스 생성
					
					board.setNum(rs.getInt("num")); //테이블 자료를 board 객체에 대입
					board.setId(rs.getString("id"));
					board.setName(rs.getString("name"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getString("regdate"));
					board.setHit(rs.getInt("hit"));
					board.setIp(rs.getString("ip"));
				}
				return board;
			} catch (Exception ex) {
				System.out.println("getBoardByNum() 에러 : " + ex);
			} finally {
				try {
					if (rs != null)rs.close();
					if (pstmt != null)pstmt.close();
					if (conn != null)conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
			return null;
		}
		//선택된 글 내용 수정하기
		public void updateBoard(BoardDTO board) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			try {
				sql = "update board set subject=?, content=?, hit=0, regdate=? where num=?";
				conn = DBConnection.getConnection();				
				pstmt = conn.prepareStatement(sql);				
				conn.setAutoCommit(false);					
				pstmt.setString(1, board.getSubject());
				pstmt.setString(2, board.getContent());
				pstmt.setString(3, board.getRegdate());
				pstmt.setInt(4, board.getNum());
				pstmt.executeUpdate();
				conn.commit();
			} catch (Exception ex) {
				System.out.println("updateBoard() 에러 : " + ex);
			} finally {
				try {
					if (pstmt != null)pstmt.close();
					if (conn != null)conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
		}
		//선택된 글 삭제하기
		public void deleteBoard(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "delete from board where num=?";
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch (Exception ex) {
				System.out.println("deleteBoard() 에러 : " + ex);
			} finally {
				try {
					if (pstmt != null)pstmt.close();
					if (conn != null)conn.close();
				}
					catch (Exception ex) {
						throw new RuntimeException(ex.getMessage());
					}
				
			}
		}
}