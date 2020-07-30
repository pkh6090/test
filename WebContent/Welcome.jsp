<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>lolDictionary</title>
</head>
<body>	
	<jsp:include page="menu.jsp"/>
	<%!
		String greeting = "Welcome to league of legends";
		String tagline = "Welcome to lol Dictionary!";
	%>
	
	<%
			response.setHeader("Refresh","2;URL=./Frontpage.jsp");
	%>	 
	
	<!-- 
	container : 반응형(고정형) 디자인 적용(창 크기 변경시 글자 간격 조절) 	
	display-3 : 글자크기(뒤에 숫자가 클수록 글자가 작아짐)
	-->
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>			
		</div>	
	</div>
	<div class = "container">
		<div class = "text-center">
			<h3>
				<%= tagline %>
			</h3>		
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>