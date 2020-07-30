<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>     
<%@ page import="dto.Product,dao.ProductRepository,java.util.ArrayList" %>  
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*,java.util.*,java.sql.*"%>  
<%@ include file="dbconn.jsp" %> 

<%
	String sessionId = (String) session.getAttribute("sessionId");	
%>  
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
</head>
<body>
	<%
		String shipping_cartId = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_shippingDate2 = "";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName = "";
		String shipping_addressName2 = "";
	
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if(n.equals("Shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if(n.equals("Shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");	
				if(n.equals("Shipping_name"))
					shipping_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("Shipping_shippingDate2"))
					shipping_shippingDate2 = URLDecoder.decode((thisCookie.getValue()),"utf-8");				
			}
		}
	%>
			
	<jsp:include page ="menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">주문 완료</h1>				
		</div>	
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문이 완료되었습니다.</h2>
		<p> <% out.println(shipping_name); %> 님 주문해주셔서 감사합니다.
		<p> 주문은 <% out.println(shipping_shippingDate); %>에 배송될 예정입니다.
		<p> 주문번호 : <% out.println(shipping_cartId); %>
		<p> 주문날짜 : <% out.println(shipping_shippingDate2); %>
		<p> 배송일자 : <% out.println(shipping_shippingDate); %>
		<p> 아이디 : <%=sessionId %>
		<%
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
					if(cartList == null)
						cartList = new ArrayList<Product>();
					for(int i = 0;i < cartList.size();i++){
						Product product = cartList.get(i);	
						
						int total = product.getUnitPrice() * product.getQuantity();
						sum = sum + total;						
						
						String id = product.getProductId();
						int qu = product.getQuantity();	
						String name = product.getPname();				
						PreparedStatement pstmt = null;									
					
					 try{
						String sql = "insert into orderlist(m_name,p_name,p_cartId,p_count,p_total,p_date,p_date2,m_id) values(?,?,?,?,?,?,?,?)";
						pstmt = conn.prepareStatement(sql);						
						pstmt.setString(1, shipping_name);
						pstmt.setString(2, name);
						pstmt.setString(3, shipping_cartId);
						pstmt.setInt(4, qu);
						pstmt.setInt(5, total);
						pstmt.setString(6, shipping_shippingDate);	
						pstmt.setString(7, shipping_shippingDate2);	
						pstmt.setString(8, sessionId);	
						pstmt.executeUpdate();
						out.println("");
					}catch(SQLException ex){
						out.println("주문목록 추가에 실패하셨습니다.");
						out.println("SQLException : " + ex.getMessage());
					}	 
					 
					
				}
				%>
				</div>
			<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
	</div>
</body>
</html>
<%
	session.removeAttribute("cartlist");
	
	for(int i = 0; i < cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		
		if(n.equals("Shipping_cartId")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_name")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_shippingDate")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_shippingDate2")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_country")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_zipCode")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_addressName")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_addressName2")) thisCookie.setMaxAge(0);		
		
	}


%>