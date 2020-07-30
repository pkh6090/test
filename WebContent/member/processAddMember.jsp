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
		String name = multi.getParameter("name");
		String gender = multi.getParameter("gender");		
		String birth = multi.getParameter("birth");
		String email = multi.getParameter("email");
		String phone = multi.getParameter("phone");
		String address = multi.getParameter("address");		
		String address2 = multi.getParameter("address2");		
		String regdate = multi.getParameter("regdate");	
		String zipCode = multi.getParameter("zipCode");			
			
	%>
	<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/loldb"
	 driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	 
	<sql:update dataSource="${dataSource}" var="resultSet">
		insert into member(id, passwd, name, gender, birth, mail, phone, address, address2, regdate, regdate2, postcd) values (?,?,?,?,?,?,?,?,?,?,?,?)
		<sql:param value="<%=id %>"/>
		<sql:param value="<%=pw %>"/>
		<sql:param value="<%=name %>"/>
		<sql:param value="<%=gender %>"/>
		<sql:param value="<%=birth %>"/>
		<sql:param value="<%=email %>"/>
		<sql:param value="<%=phone %>"/>
		<sql:param value="<%=address %>"/>
		<sql:param value="<%=address2 %>"/>
		<sql:param value="<%=regdate %>"/>	
		<sql:param value="<%=regdate %>"/>
		<sql:param value="<%=zipCode %>"/>	
	
	</sql:update> 
	
	<c:redirect url="resultMember.jsp?gubun=insert"></c:redirect>
		
</body>
</html>