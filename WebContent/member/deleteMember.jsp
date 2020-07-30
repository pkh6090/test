<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>         
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<title>회원 삭제</title>
</head>
<body>	
	<%		
		String sessionId = (String)session.getAttribute("sessionId");
	%>
	<!-- db 접속 설정 -->	
	<sql:setDataSource	var="dataSource" driver="com.mysql.jdbc.Driver"	url="jdbc:mysql://localhost:3306/loldb"
			user="root"	password="1234"/>
	
	<!-- member테이블에서 정보를 가져오기 위해
	     sql 쿼리 정의-->
	<sql:query 	dataSource="${dataSource}"	var="resultSet">
		select * from member where id = ?<sql:param value="<%=sessionId%>"/>
	</sql:query>
	
	<jsp:include page ="/menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">회원 삭제</h1>			
		</div>	
	</div>
		
	<div class="container">	
		
		<form name="newMember" action="processdeleteMember.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			
			<div class="form-group row">			
				<label class="col-sm-2">아이디</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-3">
					<input type="text" name="id" class="form-control">
				</div>				
			</div>		
			
			<div class="form-group row">			
				<label class="col-sm-2">비밀번호</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-3">
					<input type="password" name="passwd" class="form-control">
				</div>				
			</div>			
			
			<div class="form-group row">				
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="회원 탈퇴">
				</div>				
			</div>
		</form>
	</div>

</body>
</html>