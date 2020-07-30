<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="../resources/js/validation.js"></script>



<script>
	document.getElementById("regdate").value = 123;	
	</script>

<title>회원 가입</title>
</head>
<body>	
	<jsp:useBean id="now" class="java.util.Date"/>
	<jsp:include page ="/menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">회원가입</h1>			
		</div>	
	</div>
	
			<div class="form-group row">			
				<label class="col-sm-2">가입일자</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-3">					
					<input type="text" name="regdate" readonly="readonly" value="<fmt:formatDate value="${now}" type="both"/>" class="form-control">
				</div>				
			</div>								
			
</body>
</html>