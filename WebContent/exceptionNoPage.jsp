<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 오류</title>
</head>
<body>
	<jsp:include page ="menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h2 class = "alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>			
		</div>			
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString()%>
		<p> <a href ="products.jsp" class="btn btn-secondary">아이템 목록 &raquo;</a>
	</div>

</body>
</html>