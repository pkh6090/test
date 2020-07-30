<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">아이템 목록</h1>
		</div>	
	</div>
	
	<div class="container">
		<div class="row" align="center">
		<%@ include file="dbconn.jsp" %>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product order by p_unitPrice asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
		
		<div class="col-md-2">
			<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("p_fileName") %>" style="width:50%">
			<h4><%=rs.getString("p_name")%></h4>	
							
			<p><%=rs.getString("p_unitPrice")  %>원
			<br>	
			<a href = "./product.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button">상세정보 &raquo;></a>	
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