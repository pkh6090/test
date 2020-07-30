<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ include file="dbconn.jsp"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String number = request.getParameter("o_number");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from orderlist";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();	
		
		if(rs.next()){
			sql = "delete from orderlist where o_number = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, number);
			pstmt.executeUpdate();			
		} else
			out.println("일치하는 상품이 없습니다.");
		
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();	
		
		response.sendRedirect("orderlist.jsp");
		
		
	%>
</body>
</html>