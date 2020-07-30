package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;
import mvc.model.CommentDTO;

public class BoardController extends HttpServlet { //남이 만들어놓은 함수를 쓰기만 함
	
	private static final long serialVersionUID = 1L; 
	static final int LISTCOUNT = 5; //페이지당 보여지는 행 수
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
		IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
		IOException { //실질적인 처리 위치
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length()); //
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if (command.equals("/BoardListAction.do")) {//등록된 글 목록 페이지 출력하기
			requestBoardList(request); //게시판 데이터를 들고와 담는 작업
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp"); //webcontent밑에 폴더 board 밑에 list.jsp
			rd.forward(request, response);
			
		} else if (command.equals("/BoardWriteForm.do")) { // 글 등록 페이지 출력하기
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/BoardWriteAction.do")) {// 새로운 글 등록하기
			requestBoardWrite(request); //게시판 등록
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
			
		} else if (command.equals("/BoardViewAction.do")) {//선택된 글 상세 페이지 가져오기
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);	
		} 		
		  else if (command.equals("/BoardView.do")) { //글 상세 페이지 출력하기
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/BoardUpdateAction.do")) { //선택된 글의 조회수 증가하기
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
			
		}else if (command.equals("/BoardDeleteAction.do")) { //선택된 글 삭제하기
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
	}
	//등록된 글 목록 가져오기
	public void requestBoardList(HttpServletRequest request){
		
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		int pageNum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null) {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
			String items = request.getParameter("items"); //검색하고자 하는 종류
			String text = request.getParameter("text"); //검색하고자 하는 문자
			
			int total_record = dao.getListCount(items, text);
			boardlist = dao.getBoardList(pageNum,limit, items, text); //getBoardList : 검색 했던 내용을 담음
			
			int total_page; //한 페이지당 5개씩 보여주기 위해 만약 마지막에 5개 미만인경우 한 페이지 추가 처리를 해줌
		
			if (total_record % limit == 0){
				total_page =total_record/limit;
				Math.floor(total_page); //소수점 자리 밑을 내림 예) 5.7 => 5
			}
			else{ //짜투리 게시물들이 남을 경우
				total_page =total_record/limit;
				Math.floor(total_page);
				total_page = total_page + 1; //나머지 짜투리 페이지를 위한 페이지가 필요
			}			
			
			request.setAttribute("pageNum", pageNum); //현재페이지
			request.setAttribute("total_page", total_page); //전체 페이지 수
			request.setAttribute("total_record",total_record); //전체 행의 수
			request.setAttribute("boardlist", boardlist); //조회된 ArrayList형태의 자료
			}
	
	//인증된 사용자명 가져오기
		public void requestLoginName(HttpServletRequest request){
			
			String id = request.getParameter("id");
			BoardDAO dao = BoardDAO.getInstance();
			String name = dao.getLoginNameById(id);
			request.setAttribute("name", name); //함수를 실행하면 이름이 넣어옴(이후에 작성자에게 뿌려줌)
		}
	// 새로운 글 등록하기
		public void requestBoardWrite(HttpServletRequest request){ //게시판 등록 처리
			
			BoardDAO dao = BoardDAO.getInstance();			
			BoardDTO board = new BoardDTO();
			
			board.setId(request.getParameter("id"));
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));
			
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("subject"));
			System.out.println(request.getParameter("content"));
			
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			
			String regdate = formatter.format(new java.util.Date()); //현재 오늘 일자가 넘어옴(그걸 formatter형식으로 바꿈)
			
			board.setHit(0);
			board.setRegdate(regdate);
			board.setIp(request.getRemoteAddr());
			
			dao.insertBoard(board);
		}				
		
	//선택된 글 상세 페이지 가져오기
		public void requestBoardView(HttpServletRequest request){
			BoardDAO dao = BoardDAO.getInstance();
			
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
			BoardDTO board = new BoardDTO();						
			board = dao.getBoardByNum(num, pageNum);
			
			request.setAttribute("num", num);
			request.setAttribute("page", pageNum);
			request.setAttribute("board", board);
	}
	//선택된 글 내용 수정하기
		public void requestBoardUpdate(HttpServletRequest request){
			
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
			BoardDAO dao = BoardDAO.getInstance();
			BoardDTO board = new BoardDTO();
			
			board.setNum(num);
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));
			
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			
			String regdate = formatter.format(new java.util.Date());
			
			board.setHit(0); //수정을 했으므로 조회수는 0으로 초기화
			board.setRegdate(regdate); //수정일자로 변경
			board.setIp(request.getRemoteAddr()); //사용자가 등록했던 pc의 ip
			
			dao.updateBoard(board);
	}
	//선택된 글 삭제하기
		public void requestBoardDelete(HttpServletRequest request){
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
			BoardDAO dao = BoardDAO.getInstance();
			
			dao.deleteBoard(num);
	}
	}