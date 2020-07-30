<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mvc.model.BoardDAO, mvc.model.CommentDTO, java.sql.*, mvc.model.BoardDTO" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../dbconn.jsp"%>
		
	<%					
		int num = Integer.parseInt(request.getParameter("num"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));		
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;		
					
		try{
			String sql = "delete from comment where num = ?" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();								
			}				
			catch(SQLException ex){
			out.println("호출 실패");
			}finally{
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
		}		
		
		response.sendRedirect("http://localhost/BoardViewAction.do?num="+ num2 +"&pageNum="+ pageNum);
	%>		
		
	
	
</body>
</html>