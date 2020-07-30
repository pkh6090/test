<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.util.*, mvc.model.BoardDTO, java.sql.*" %>   

<%
	String sessionId = (String) session.getAttribute("sessionId");
	ArrayList boardList = (ArrayList) request.getAttribute("boardlist");
	String name = (String)request.getAttribute("name");
%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">
function checkForm(){
	if(${sessionId == null}){
		alert("로그인 하세요!");
		return false;
		}
	
	document.newComment.submit();
}
</script>

<title>Insert title here</title>
</head>
<body>
	<%	
		BoardDTO notice = (BoardDTO) request.getAttribute("board");
		int num = (Integer)request.getAttribute("num");
		int nowpage = (Integer)request.getAttribute("page");
	%>
	
	<jsp:include page="../menu.jsp"/>

		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">게시판 보기</h1>
			</div>
		</div>

		<div class="container">
			<form name="newUpdate" action="./BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control" value="<%=notice.getSubject() %>">
				</div>
			</div>	
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-6" style="word-break:break-all;">
					<textarea class="form-control" name="content" cols="100" rows="5" ><%=notice.getContent() %></textarea>					
				</div>			
			</div>	
				
			<div class="form-group row">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
					<input name="name" class="form-control" value="<%=notice.getName() %>" readonly="readonly">					
				</div>
			</div>			
				
			<div class="form-group row">				
				<div class="col-sm-offset-2 com-sm-10">
					<c:set var="userId" value="<%=notice.getId() %>"/>					
					<c:if test="${sessionId == userId || sessionId == 'admin'}">
						<p>
						<input type="submit" class="btn btn-success" value="수정">
						<a href="./BoardDeleteAction.do?num=<%=notice.getNum() %>&pageNum=<%=nowpage %>" class="btn btn-danger">삭제</a>
					</c:if>
					
					<a href="./BoardListAction.do?pageNum=<%=nowpage %>" class="btn btn-primary">목록</a>
					
				</div>
			</div>	
		</form>
	</div>		
	
	<%@ include file="../dbconn.jsp"%>
		<div class="container">					
			<div style="padding-top:20px; width:80%; margin-left:75px">
				<table  class="table table-hover table-striped">
					<tr>
						<th width="22%">아이디</th>
						<th>내용</th>
						<th width="36%">작성일</th>	
						<th>댓글삭제</th>									
					</tr>
					<%
						ResultSet rs = null;
						Statement stmt = null;
					
						try{
							String sql = "select * from comment where num2 = " + notice.getNum();
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
						
						while (rs.next()){
							String id = rs.getString("id");
							String content = rs.getString("content");
							String regdate = rs.getString("regdate");
							int num1 = rs.getInt("num");
							int num2 = notice.getNum();
					%>
					<tr>
						<td><%=id %></td>
						<td><%=content %></td>
						<td><%=regdate %></td>	
						<td>																	
						<c:set var="userId" value="<%=id %>"/>					
						<c:if test="${sessionId == userId || sessionId == 'admin'}">																	
							<a href="../board/processCommentDelete.jsp?num=<%=rs.getInt("num")%>&num2=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-danger">삭제</a>
						</c:if>							
						</td>																
					</tr>
					<%
						}
						}
						catch(SQLException ex){
							out.println("호출 실패");
						}finally{
							if (rs != null) rs.close();
							if (stmt != null) stmt.close();
							if (conn != null) conn.close();
						}
					
					%>	
					
				</table>
			</div>	
	</div>
	
	<p><jsp:useBean id="now" class="java.util.Date" />
	
	<div class="container">
		<form name="newComment" action="../board/processComment.jsp" class="form-horizontal" method="post">			
			<div class="form-group row">
				<label class="col-sm-1 control-label"></label>							
				
				<div class="col-sm-2">
					<input name="id" class="form-control" value="${sessionId}" readonly="readonly">
				</div>				
				
				<div class="col-sm-4">
					<textarea class="form-control" id="content" name="content" cols="100" rows="2" placeholder="댓글입력창"></textarea>										
				</div>					
				
				<div class="col-sm-3">
					<input name="regdate" class="form-control" value="<fmt:formatDate value="${now}" type="both"/>" readonly="readonly">
				</div>		
				
				<div class="col-sm-2">					
					<input name="num2" type="hidden" class="form-control" value="<%=notice.getNum() %>">
				</div>		
				
				<div class="col-sm-2">					
					<input name="nowpage" type="hidden" class="form-control" value="<%=nowpage %>">
				</div>					
				
			</div>			
							
			<div class="form-group row">
				<div class="col-sm-offset-1 col-sm-10">
					<input type="button" class="btn btn-primary" value="댓글등록" onclick="checkForm()">					
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>