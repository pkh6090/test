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
		border: 1px solid white;
		text-align: center;
	}
</style>

</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">룬(지배) 목록</h1>
		</div>	
	</div>	
	
	<div class="container">
		<div class="row" align="center" style="width:100%; ">
		<%@ include file="dbconn.jsp" %>
			<table style="width:100%; height:130px;">
				<tbody>
					<tr>						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text02.jsp?id=14">
						<img src="${pageContext.request.contextPath}/lune/images/감전.png" style="width:50%" ></a>
						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text02.jsp?id=15">
						<img src="${pageContext.request.contextPath}/lune/images/포식자.png" style="width:50%" ></a>
						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text02.jsp?id=16">
						<img src="${pageContext.request.contextPath}/lune/images/어둠의 수확.png" style="width:50%" ></a>
						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text02.jsp?id=17">
						<img src="${pageContext.request.contextPath}/lune/images/칼날비.png" style="width:50%" ></a>								
					</tr>
				</tbody>
			</table>
			<table style="width:100%; height:320px; background-color:black;">
			<tbody>
				<tr>					
					<td style="width:33%;"><a href = "./lune_text02.jsp?id=18">
					<img src="${pageContext.request.contextPath}/lune/images/비열한 한 방.png" style="width:33%" >
					</a></td>
					<td style="width:33%;"><a href = "./lune_text02.jsp?id=19">
					<img src="${pageContext.request.contextPath}/lune/images/피의 맛.png" style="width:33%" >
					</a></td>
					<td style="width:33%;"><a href = "./lune_text02.jsp?id=20">
					<img src="${pageContext.request.contextPath}/lune/images/돌발 일격.png" style="width:33%" >
					</a></td>					
				</tr>				
				<tr>				
					<td style="width:33%;"><a href = "./lune_text02.jsp?id=21">
					<img src="${pageContext.request.contextPath}/lune/images/좀비 와드.png" style="width:33%" >
					</a></td>
					<td style="width:33%;"><a href = "./lune_text02.jsp?id=22">
					<img src="${pageContext.request.contextPath}/lune/images/유령 포로.png" style="width:33%" >
					</a></td>
					<td style="width:33%;"><a href = "./lune_text02.jsp?id=23">
					<img src="${pageContext.request.contextPath}/lune/images/사냥의 증표.png" style="width:33%" >
					</a></td>									
				</tr>				
			</tbody>
			</table>	
			<table style="width:100%; height:130px;">
				<tbody>
					<tr>						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text02.jsp?id=24">
						<img src="${pageContext.request.contextPath}/lune/images/굶주린 사냥꾼.png" style="width:50%" ></a>
						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text02.jsp?id=25">
						<img src="${pageContext.request.contextPath}/lune/images/영리한 사냥꾼.png" style="width:50%" ></a>
						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text02.jsp?id=26">
						<img src="${pageContext.request.contextPath}/lune/images/끈질긴 사냥꾼.png" style="width:50%" ></a>
						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text02.jsp?id=27">
						<img src="${pageContext.request.contextPath}/lune/images/궁극의 사냥꾼.png" style="width:50%" ></a>								
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>