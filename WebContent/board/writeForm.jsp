<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String name = (String)request.getAttribute("name");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>
function CheckAddBoard(){	
	
	var subject = document.getElementById("subject");		
	var content = document.getElementById("content");	
	
	if(subject == "" || subject.value.length == 0 ){
		alert("[제목]\n제목을 입력하세요.");
		subject.select();
		subject.focus();
		return false;
	}	
	
	if(content == "" || content.value.length == 0 ){
		alert("[내용]\n내용을 입력하세요.");
		content.select();
		content.focus();
		return false;
	}		
		
	document.newWrite.submit();
}

</script>

<title>게시판 등록</title>
</head>
<body>
	<jsp:include page="../menu.jsp"/>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판 등록</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newWrite" action="./BoardWriteAction.do" class="form-horizontal" method="post">
			<input name="id" type="hidden" class="form-control" value="${sessionId}">
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-6">
					<input id="subject" name="subject" type="text" class="form-control" placeholder="제목부분입니다.">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-6">
					<textarea class="form-control" id="content" name="content" cols="100" rows="5" placeholder="내용입력"></textarea>					
				</div>			
			</div>
				
			<div class="form-group row">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
					<input name="name" class="form-control" value="<%=name %>" readonly="readonly">
				</div>
			</div>			
		
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddBoard()">
					<input type="reset" class="btn btn-warning" value="초기화">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>