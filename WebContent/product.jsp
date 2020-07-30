<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ page errorPage="exceptionNoProductId.jsp" %>   
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart(){		
					
		if(confirm("아이템을 장바구니에 추가하시겠습니까?")){			
			<%
				String id = (String)session.getAttribute("sessionId");
				if(id==null || id.length() == 0){				
			%>
				alert("로그인이 필요한 부분입니다.");				
				return false;
				document.addForm.reset();
			<% 
				}
			%>					
			document.addForm.submit();
		} else{
			document.addForm.reset();
		}
	}
</script>

</head>
<body>
	<jsp:include page ="menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">상품 목록</h1>			
		</div>	
	</div>
		<%@ include file="dbconn.jsp"%>	
		<%
			String productId = request.getParameter("id");
		
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from product where p_id = ?";
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, productId);			
			
			rs = pstmt.executeQuery();
			if(rs.next()) //if문 while문 무관하게 사용가능
			{
		%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">			
				<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("p_fileName") %>" style="width:50%">
			</div>	
			<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p> <b>아이템코드 :  </b><span class="badge badge-danger"> <!--내용을 뱃지모양으로 표현 -->				
				<%=rs.getString("p_id") %></span>	
				<p><%=rs.getString("p_ability")%>					
				<p><%=rs.getString("p_description")%>								
						
				<h4><fmt:formatNumber value='<%=rs.getString("p_unitPrice")%>' pattern="#,###"/>원</h4>
				<p> <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">				
				<a href="#" class="btn btn-info" onclick="addToCart()"> 아이템 구매 &raquo;</a> <!-- btn : 개체, btn-info : 속성(버튼의 색상)-->
				<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
				<a href="./products.jsp" class="btn btn-success"> 아이템 목록 &raquo;</a>
				
				</form>
			</div>
			<% 
			}
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			%>	
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>