<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product,java.sql.*,java.util.ArrayList" %>    
<%@ include file="dbconn.jsp"%>	    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		if(id == null || id.trim().equals("")){ //trim() : 문자열 좌우의 공백을 제거해줌
			response.sendRedirect("products.jsp"); // sendRedirect : 강제로 해당 페이지로 보냄
			return;
		}			
		
		ArrayList<Product> list = (ArrayList<Product>)session.
		getAttribute("cartlist"); //장바구니를 처음으로 클릭했을 때 맨 처음에는 null값이 됨
		if(list == null){
			list = new ArrayList<Product>(); //비어있으면 리스트를 만듬
			session.setAttribute("cartlist",list); //상품을 담기위해 cartlist라는 세션을 만듬
		}
		
		//데이터베이스 접근 여기서 함
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;	
		Product goodsQnt = new Product();
		
		for(int i = 0; i< list.size(); i++){
			goodsQnt = list.get(i);
			if(goodsQnt.getProductId().equals(id)){ //동일한 상품을 선택하면 해당 상품의 수량을 증가시킴
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity); //화면에도 1을 증가시킴
			}			
		}
		
		if(cnt == 0){ //장바구니의 목록이 아니면 해당 상품의 수량을 1로 한다.
			
			try{
				Product goods = new Product();
				String sql = "select * from product where p_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					goods.setPname(rs.getString("p_name"));
					goods.setProductId(rs.getString("p_id"));
					goods.setUnitPrice(rs.getInt("p_unitPrice"));
					goods.setQuantity(1);					
					list.add(goods);
				}
				
				}catch(SQLException e){
					out.println("upCart.jsp 오류");
					out.println("SQLException" + e.getMessage());
				}finally{
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
		}				
		response.sendRedirect("cart.jsp");		
	%>
</body>
</html>