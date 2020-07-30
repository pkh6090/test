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
			<table style="width:100%; height:580px; background-color:black;">
				<tbody>
					<tr>						
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=28">
						<img src="${pageContext.request.contextPath}/lune/images/콩콩이.png" style="width:33%" >
						</a></td>
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=29">
						<img src="${pageContext.request.contextPath}/lune/images/신비로운 유성.png" style="width:33%" >
						</a></td>
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=30">
						<img src="${pageContext.request.contextPath}/lune/images/난입.png" style="width:33%" >
						</a></td>						
					</tr>
					<tr>					
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=31">
						<img src="${pageContext.request.contextPath}/lune/images/무효화 구체.png" style="width:33%" >
						</a></td>
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=32">
						<img src="${pageContext.request.contextPath}/lune/images/마나순환 팔찌.png" style="width:33%" >
						</a></td>
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=33">
						<img src="${pageContext.request.contextPath}/lune/images/빛의 망토.png" style="width:33%" >
						</a></td>					
					</tr>		
					<tr>				
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=34">
						<img src="${pageContext.request.contextPath}/lune/images/깨달음.png" style="width:33%" >
						</a></td>
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=35">
						<img src="${pageContext.request.contextPath}/lune/images/기민함.png" style="width:33%" >
						</a></td>
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=36">
						<img src="${pageContext.request.contextPath}/lune/images/절대 집중.png" style="width:33%" >
						</a></td>									
					</tr>
					<tr>						
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=37">
						<img src="${pageContext.request.contextPath}/lune/images/주문 작열.png" style="width:33%" >
						</a></td>
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=38">
						<img src="${pageContext.request.contextPath}/lune/images/물 위를 걷는 자.png" style="width:33%" >
						</a></td>
						<td style="width:33%;"><a href = "./lune_text03.jsp?id=39">
						<img src="${pageContext.request.contextPath}/lune/images/폭풍의 결집.png" style="width:33%" >
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