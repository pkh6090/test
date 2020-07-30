<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*,java.util.*,java.sql.*"%>      
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "../resources/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<%
		String realFolder = "E:\\JSPStudy2\\LolMarket\\WebContent\\resources\\images"; //서버에 올릴 예정이므로 변경해야 함
		int maxSize = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
		String id = multi.getParameter("id");
		String pw = multi.getParameter("passwd");
	%>
	<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/loldb"
	 driver="com.mysql.jdbc.Driver" user="root" password="1234" />	 
	<sql:update dataSource="${dataSource}" var="resultSet">	
		
		delete from member where id = ? and passwd = ?			
		<sql:param value="<%=id %>"/>
		<sql:param value="<%=pw %>"/>	
		
	</sql:update> 		
		
	<c:if test="${resultSet == 1}">	
	<%
		session.invalidate();	
	%>		
	<c:redirect url="resultMember.jsp?gubun=delete"></c:redirect>	
	</c:if>
	
	<c:if test="${resultSet == 0}">
		<c:redirect url="resultMember.jsp?gubun=deleteError"></c:redirect>	
	</c:if>	
</body>
</html>