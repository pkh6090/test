<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository,java.util.ArrayList"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%		
	
		String id = request.getParameter("cartId");
		if(id == null || id.trim().equals("")){
			response.sendRedirect("cart.jsp");
			return;
		}	
		
		ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");		
		if(list!=null || list.size() != 0){
			list.clear();
		}
		
		 response.sendRedirect("cart.jsp"); 
	%>
</body>
</html>