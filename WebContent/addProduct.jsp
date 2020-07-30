<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ include file="dbconn.jsp"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/validation.js">
</script>
<title>아이템 등록</title>
</head>
<body>
	<jsp:include page ="menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">아이템 등록</h1>			
		</div>			
	</div>	
	
	<div class="container">		
		<form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post"
		enctype="multipart/form-data">
		
			<div class="form-group row">
				<label class="col-sm-2">아이템코드</label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control">				
				</div>				
			</div>			
			
			<div class="form-group row">
				<label class="col-sm-2">아이템이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">				
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">아이템가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">				
				</div>				
			</div>			
						
			<div class="form-group row">
				<label class="col-sm-2">아이템능력</label>
				<div class="col-sm-5">
					<textarea class="form-control" id="ability" name="ability" cols="100" rows="2" wrap="hard"></textarea>					
				</div>			
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-5">
					<textarea class="form-control" name="description" rows="2"></textarea>			
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">아이템 이미지</label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">				
				</div>				
			</div>
		
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">			
				</div>				
			</div>
		</form>
	</div>
</body>
</html>