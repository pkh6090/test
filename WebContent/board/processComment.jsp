<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mvc.model.BoardDAO,mvc.model.CommentDTO, java.sql.*" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../dbconn.jsp"%>
		
	<%
		
		PreparedStatement pstmt = null;
		String sql = null;
		
		BoardDAO dao = BoardDAO.getInstance();
		CommentDTO comment = new CommentDTO();			
		
		comment.setId(request.getParameter("id"));			
		comment.setContent(request.getParameter("content"));
		comment.setNum2(Integer.parseInt(request.getParameter("num2")));
		comment.setNowpage(Integer.parseInt(request.getParameter("nowpage")));
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");			
		String regdate = formatter.format(new java.util.Date()); //현재 오늘 일자가 넘어옴(그걸 formatter형식으로 바꿈)
					
		comment.setRegdate(regdate);
		
		int a = comment.getNum2();
		int b = comment.getNowpage();
		
		try {
			
			sql = "insert into Comment values(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, comment.getNum());
			pstmt.setString(2, comment.getId());
			pstmt.setString(3, comment.getContent());
			pstmt.setString(4, comment.getRegdate());
			pstmt.setInt(5, comment.getNum2());
			
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("insertComment() 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
				}
			}	
				
		response.sendRedirect("http://localhost/BoardViewAction.do?num="+ a + "&pageNum=" + b);
		%>	
	
</body>
</html>