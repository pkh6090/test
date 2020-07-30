<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*,java.util.*,java.sql.*"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ include file="dbconn.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		
		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(fileName != null){ //파일 이름이 있으면 
				sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_ability=?, p_fileName=? where p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, price);
				pstmt.setString(3, description);
				pstmt.setString(4, ability);				
				pstmt.setString(5, fileName);
				pstmt.setString(6, productId); //수정할려고 하는 상품번호
				
				
			} else{ //파일 이름이 없는 것
				sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_ability=? where p_id=?";				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, price);
				pstmt.setString(3, description);
				pstmt.setString(4, ability);
				pstmt.setString(5, productId); //수정할려고 하는 상품번호
				
			}	
			pstmt.executeUpdate();
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();	
		
		response.sendRedirect("editProduct.jsp?edit=update");		
	%>
</body>
</html>