<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>      
<%@ page import="dto.Product,dao.ProductRepository,java.util.ArrayList" %>         
<!DOCTYPE html>
<html>
<head>
<script>
	function checkOrder(){
		<%
			ArrayList list = (ArrayList<Product>)session.getAttribute("cartlist"); //session은 object로 return
			String id = (String)session.getAttribute("sessionId");
					
			if(list==null || list.size() == 0){
					
		%>
			alert("선택하신 상품내역이 없습니다.");
			location.href = './cart.jsp';
			return false;
		<%
			}
			if(id==null || id.length() == 0){				
		%>
			alert("로그인이 필요한 부분입니다.");
			location.href = './cart.jsp';
			return false;
		<% 
			}
		%>		
			return true;
	}

</script>

<%
	String cartId = session.getId(); //톰캣서버에서 부여하는 J session id값,F12에서도 확인가능
%>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page ="menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">장바구니</h1>			
		</div>			
	</div>
	
	<div class="container"><!-- 장바구니 화면구현 -->
		<div class="row">
			<table width="100%">
				<tr>
					<td align="right">
					<a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">모두 삭제하기</a>
					<a href="./shippingInfo.jsp?cartId=<%=cartId%>" onclick="return checkOrder()"class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div>
		<div style="padding-top : 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th class="text-right">가격</th>
					<th class="text-right">증가</th>
					<th class="text-right">감소</th>
					<th class="text-right">수량</th>
					<th class="text-right">소계</th>
					<th>비고</th>
				</tr>
				<%
					int sum = 0;
					int qua = 0;
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
					if(cartList == null)
						cartList = new ArrayList<Product>();
					
					for(int i = 0;i<cartList.size();i++){
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity(); //소계 계산 : 가격 * 수량
						sum = sum + total; //총계	
						qua = qua + product.getQuantity(); //갯수
				%>
				<tr>
					<td><%=product.getProductId()%> - <%=product.getPname()%></td>
					<td class="text-right"><fmt:formatNumber value='<%=product.getUnitPrice()%>' pattern="#,###"/>원</td>
					<td align="right"><a href="./upCart.jsp?id=<%=product.getProductId() %>" class="badge badge-danger">증가</a></td>	
					<td align="right"><a href="./downCart.jsp?id=<%=product.getProductId() %>" class="badge badge-danger">감소</a></td>
					<td  class="text-right"><%=product.getQuantity()%></td>				
					<td class="text-right"><fmt:formatNumber value='<%=total%>' pattern="#,###"/>원</td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductId() %>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%			
				
				}	
				
				%>
				<tr>
					<th>합계</th>
					<th></th>
					<th class="text-right"></th>
					<th class="text-right"></th>
					<th class="text-right"><%=qua%></th>
					<th class="text-right"><fmt:formatNumber value='<%=sum%>' pattern="#,###"/>원</th>
					<th></th>
				</tr>
			</table>
			<div align="right">
			<a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>	
			</div>	
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>						   	
	
	<c:if test="${resultSet.rowCount > 0}">
	
	<%
		session.setAttribute("sessionId", id);	
	%>
	
	</c:if>	
</body>
</html>