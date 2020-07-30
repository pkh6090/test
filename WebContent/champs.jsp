<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챔피언 목록</title>
<style>	

	#b{
		background: black;		
		color: white;
	}	
	
</style>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron" id="c">
		<div class="container">
			<h1 class="display-3">챔피언 목록</h1>
		</div>	
	</div>
	
	<div class="container" id="b" style="width:100%;">
		<div class="row" align="center">
		<%@ include file="dbconn.jsp" %>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from champ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
		
		<div class="col-md-12">
			<img src="${pageContext.request.contextPath}/champs/<%=rs.getString("c_image") %>" style="width:55%">
		</div>
		
		<div align="right" id="a" style="width:54%">	
			<h2><%=rs.getString("c_name")%></h2>
			<a href = "./champ.jsp?name=<%=rs.getString("c_name")%>" class="btn btn-success" role="button">상세정보 &raquo;></a>
			<br>	
		</div>
		<br>
		<%
			}			
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();			
		%>
		</div>
		
	</div>
	<hr>
	<jsp:include page="footer.jsp"/>
</body>
</html>