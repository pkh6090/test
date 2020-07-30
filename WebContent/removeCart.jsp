<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product,java.sql.*,java.util.ArrayList" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}			
		
		ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
		Product goodsQnt = new Product();
		for(int i=0;i<cartList.size();i++){
			goodsQnt = cartList.get(i);
			if(goodsQnt.getProductId().equals(id)){ //지우고 싶은 아이디 값을 받아옴
				cartList.remove(goodsQnt); //remove : arrayList에 내용을 지움
			}
		}
		response.sendRedirect("cart.jsp");			
	%>
</body>
</html>