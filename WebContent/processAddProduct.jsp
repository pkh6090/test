<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*,java.util.*,java.sql.*"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
		request.setCharacterEncoding("UTF-8");
		
		String filename = "";
		String realFolder = "E:\\JSPStudy2\\LolMarket\\WebContent\\resources\\images"; //서버에 올릴 예정이므로 변경해야 함
		int maxSize = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");	
		String ability = multi.getParameter("ability");	
			
		Integer price;
		
		if(unitPrice.isEmpty()) price = 0;
		else price = Integer.valueOf(unitPrice);
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt = null;		
		ResultSet rs = null;								
			
		String sql = "insert into product values(?,?,?,?,?,?)";				
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.setString(2, name);
		pstmt.setInt(3, price);
		pstmt.setString(4, description);		
		pstmt.setString(5, ability); 	
		pstmt.setString(6, fileName);
				
		pstmt.executeUpdate();		
		
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();	
		
		response.sendRedirect("products.jsp");	
%>
</body>
</html>