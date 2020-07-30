<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<style>

	.prod-list .caption{
		position: absolute;
		top:512px;
		width:220px;		
		height:200px;
		padding-top:20px;
		background: rgba(0,0,0,0.6);
		opacity:0;
		-moz-transition: all 0.3s ease-in-out;
		-o-transition: all 0.3s ease-in-out;
		-webkit-transition: all 0.3s ease-in-out;
		transition: all 0.3s ease-in-out;
		z-index:20;
		
	}
	
	.prod-list li:hover .caption{
		opacity: 1;
		-moz-transform: translateY(-200px);
		-ms-transform: translateY(-200px);
		-o-transform: translateY(-200px);
		-webkit-transform: translateY(-200px);
		transform: translateY(-200px);
		
	}
		
	.prod-list .caption h2, .prod-list .caption a{
		color: #fff;
		text-align: center;
	}

	ul {
    	list-style:none;        
	}

	li {  
    	float: left;    
	}
	
</style>



<meta charset="UTF-8">
<title>롤 백과사전</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">롤 백과사전</h1>
		</div>	
	</div>		
	<div class="container">
		<div id="inline" align="center">
			<ul class="prod-list">
				<li>			
					<a href = "./products.jsp" class="btn btn-secondary" role="button" style="padding:0px 10px;">
					<img src="${pageContext.request.contextPath}/resources/images/items.jpg" style="width:200px"></a>
						<div class="caption">
							<h2>아이템 목록</h2>
							<br>
							<a href="./products.jsp" class="btn btn-info">이동하기 &raquo;</a>
						</div>				
				<li>			
					<a href = "./champs.jsp" class="btn btn-secondary" role="button" style="padding:0px 10px;">
					<img src="${pageContext.request.contextPath}/resources/images/champs.png" style="width:200px"></a>
						<div class="caption">
							<h2>챔피언 목록</h2>
							<br>
							<a href="./champs.jsp" class="btn btn-info">이동하기 &raquo;</a>
						</div>
				</li>
				<li>	
					<a href = "./lunes.jsp" class="btn btn-secondary" role="button" style="padding:0px 10px;">
					<img src="${pageContext.request.contextPath}/resources/images/룬 페이지.jpg" style="width:200px"></a>
						<div class="caption">
							<h2>룬 페이지</h2>
							<br>
							<a href="./lunes.jsp" class="btn btn-info">이동하기 &raquo;</a>
						</div>
				</li>	
				<li>
					<a href = "./BoardListAction.do?pageNum=1" class="btn btn-secondary" role="button" style="padding:0px 10px;">
					<img src="${pageContext.request.contextPath}/resources/images/memo.png" style="width:200px"></a>
						<div class="caption">
							<h2>자유게시판</h2>
							<br>
							<a href="./BoardListAction.do" class="btn btn-info">이동하기 &raquo;</a>
						</div>
				</li>
			</ul>
		</div>		
	</div>
	<hr>
	<jsp:include page="footer.jsp"/>
</body>
</html>