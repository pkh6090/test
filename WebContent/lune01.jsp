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
			<h1 class="display-3">룬(정밀) 목록</h1>
		</div>	
	</div>	
	
	<div class="container">
		<div class="row" align="center" style="width:100%; ">
		<%@ include file="dbconn.jsp" %>
			<table style="width:100%; height:120px;">
				<tbody>
					<tr>						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text01.jsp?id=1"><img src="${pageContext.request.contextPath}/lune/images/집중 공격.png" style="width:50%" ></a>
						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text01.jsp?id=2"><img src="${pageContext.request.contextPath}/lune/images/치명적 속도.png" style="width:50%" ></a>
						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text01.jsp?id=3"><img src="${pageContext.request.contextPath}/lune/images/기민한 발놀림.png" style="width:50%" ></a>
						
						<td style="width:25%; background-color:black; color:gold; border: 1px solid white;">
						<a href = "./lune_text01.jsp?id=4"><img src="${pageContext.request.contextPath}/lune/images/정복자.png" style="width:50%" ></a>								
					</tr>
				</tbody>
			</table>
			<table style="width:100%; height:360px; background-color:black;">
			<tbody>
				<tr>					
					<td style="width:33%;"><a href = "./lune_text01.jsp?id=5">
					<img src="${pageContext.request.contextPath}/lune/images/과다치유.png" style="width:33%" >
					</a></td>
					<td style="width:33%;"><a href = "./lune_text01.jsp?id=6">
					<img src="${pageContext.request.contextPath}/lune/images/승전보.png" style="width:33%" >
					</a></td>
					<td style="width:33%;"><a href = "./lune_text01.jsp?id=7">
					<img src="${pageContext.request.contextPath}/lune/images/침착.png" style="width:33%" >
					</a></td>					
				</tr>				
				<tr>				
					<td style="width:33%;"><a href = "./lune_text01.jsp?id=8">
					<img src="${pageContext.request.contextPath}/lune/images/전설-민첩함.png" style="width:33%" >
					</a></td>
					<td style="width:33%;"><a href = "./lune_text01.jsp?id=9">
					<img src="${pageContext.request.contextPath}/lune/images/전설-강인함.png" style="width:33%" >
					</a></td>
					<td style="width:33%;"><a href = "./lune_text01.jsp?id=10">
					<img src="${pageContext.request.contextPath}/lune/images/전설-핏빛 길.png" style="width:33%" >
					</a></td>										
				</tr>
				<tr>	
					<td style="width:33%;"><a href = "./lune_text01.jsp?id=11">
					<img src="${pageContext.request.contextPath}/lune/images/최후의 일격.png" style="width:33%" >
					</a></td>
					<td style="width:33%;"><a href = "./lune_text01.jsp?id=12">
					<img src="${pageContext.request.contextPath}/lune/images/체력차 극복.png" style="width:33%" >
					</a></td>
					<td style="width:33%;"><a href = "./lune_text01.jsp?id=13">
					<img src="${pageContext.request.contextPath}/lune/images/최후의 저항.png" style="width:33%" >
					</a></td>									
				</tr>
			</tbody>
			</table>	
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>