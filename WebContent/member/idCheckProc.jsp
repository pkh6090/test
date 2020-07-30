<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,mvc.model.MemberDAO" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3> 아이디 중복 확인 결과 </h3>
		<%
			MemberDAO dao = MemberDAO.getInstance();
			String id = request.getParameter("id");
			int cnt = dao.duplecateID(id);
			out.println("입력 ID : <strong>" + id + "</strong>");
			if(cnt==0){
				out.println("<p>사용 가능한 아이디입니다.</p>");	
		%>
			<script>
				function apply(id){
					opener.document.newMember.id.value=id;
					window.close();
				}
			</script>
		<%
			}else{
				out.println("해당 아이디는 사용할 수 없습니다.");
			}
		%>
	<hr>
	<a href="javascript:history.back()">[다시시도]</a>
	<a href="javascript:window.close()">[창닫기]</a>

</body>
</html>