<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>룬 페이지</title>
<style>

	tr,td{
		border: 1px solid black;
		text-align: center;
	}

</style>

</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">룬 페이지</h1>
		</div>	
	</div>	
	
	<div class="container">
		<div class="row" align="center" style="width:100%; ">
			<table style="width:100%; height:420px; border: 2px solid;">
			<tbody>
				<tr>			
					<td colspan="5" style="background-color:black; color:gold; border: 1px solid white; font-size:30px;"> <img src="${pageContext.request.contextPath}/resources/images/main.png" style="width:50px"><strong>리그 오브 레전드의 룬</strong></td>									
				</tr>
				<tr>
					<td style="background-color:black; color:gold; border: 1px solid white;"><img src="${pageContext.request.contextPath}/resources/images/a1.png" style="width:65px"><br><strong>정밀</strong></td>
					<td style="background-color:black; color:gold; border: 1px solid white;"><img src="${pageContext.request.contextPath}/resources/images/a2.png" style="width:65px"><br><strong>지배</strong></td>
					<td style="background-color:black; color:gold; border: 1px solid white;"><img src="${pageContext.request.contextPath}/resources/images/a3.png" style="width:65px"><br><strong>마법</strong></td>
					<td style="background-color:black; color:gold; border: 1px solid white;"><img src="${pageContext.request.contextPath}/resources/images/a4.png" style="width:65px"><br><strong>결의</strong></td>
					<td style="background-color:black; color:gold; border: 1px solid white;"><img src="${pageContext.request.contextPath}/resources/images/a5.png" style="width:65px"><br><strong>영감</strong></td>
				</tr>
				<tr style="height:60px;">
					<td><a href="./lune01.jsp"><b>[ → ]</b></a></td>
					<td><a href="./lune02.jsp"><b>[ → ]</b></a></td>
					<td><a href="./lune03.jsp"><b>[ → ]</b></a></td>
					<td><a href="./lune04.jsp"><b>[ → ]</b></a></td>
					<td><a href="./lune05.jsp"><b>[ → ]</b></a></td>
				</tr>
			</tbody>
			</table>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>