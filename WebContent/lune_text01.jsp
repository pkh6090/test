<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ page errorPage="exceptionNoProductId.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>룬 상세 정보</title>
</head>
<body>
	<jsp:include page ="menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">룬 상세 정보</h1>			
		</div>	
	</div>
		<%@ include file="dbconn.jsp"%>	
		<%
			String Id = request.getParameter("id");
		
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from lune where l_num = ?";
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, Id);			
			
			rs = pstmt.executeQuery();
			if(rs.next()) //if문 while문 무관하게 사용가능
			{
		%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">			
				<img src="${pageContext.request.contextPath}/lune/images/<%=rs.getString("l_image") %>" style="width:50%">
			</div>	
			<div class="col-md-6">
				<h3><%=rs.getString("l_name")%></h3>								
				<p><%=rs.getString("l_description")%>
				<p> 
				<a href="./lune01.jsp" class="btn btn-warning">정밀 룬 목록 &raquo;</a>				
				<a href="./lunes.jsp" class="btn btn-dark">룬 목록 &raquo;</a>		
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