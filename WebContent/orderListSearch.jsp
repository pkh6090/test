<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.util.*" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 목록</title>
<style>

	th, tr,td{		
		text-align: center;
	}	
	th{
		border: 1px solid black;
	}

</style>

</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">구매 목록</h1>
		</div>	
	</div>	
	<%
		String items = request.getParameter("items");
		String text = request.getParameter("text");
	%>
	<div class="container">
		<div class="row" align="center" style="width:100%; ">
			<%@ include file="dbconn.jsp"%>
			<div align="left">
				&nbsp;
				<form action="orderListSearch.jsp" method="post">
					<select name="items">
						<option value="m_name">구매인</option>
						<option value="p_name">아이템명</option>
					 	<option value="p_date">도착일자</option>
					</select>
					<input type="text" name="text"/>
					<input type="submit" id="btnAdd" class="btn btn-primary" value="검색"/>	
				</form>							
			</div>	
			<br>
			<table style="width:100%; border: 1px solid black;">
			<tbody>
				<tr style="border: 1px solid black;">			
					<th style="text-align: center;">구매인</th>
					<th style="text-align: center;">아이템명</th>
					<th style="text-align: center;">주문번호</th>					
					<th style="text-align: center;">갯수</th>
					<th style="text-align: center;">총액</th>	
					<th style="text-align: center;">도착일자</th>	
					<th style="text-align: center;">주문취소</th>							
				</tr>
				<%
					ResultSet rs = null;
					Statement stmt = null;
				
					try{
						String sql = "SELECT * FROM orderlist where " + items + " like '%" + text + "%'";
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
						
						while(rs.next()){
							String mname = rs.getString("m_name");
							String pname = rs.getString("p_name");
							String pcartid = rs.getString("p_cartid");	
							String pcount = rs.getString("p_count");
							String ptotal = rs.getString("p_total");
							String pdate = rs.getString("p_date");	
							String o_number = rs.getString("o_number");
				%>
				<tr>					
					<td style="border: 1px solid black;"><%=mname %></td>
					<td style="border: 1px solid black;"><%=pname %></td>
					<td style="border: 1px solid black;"><%=pcartid %></td>
					<td style="border: 1px solid black;"><%=pcount %></td>
					<td style="border: 1px solid black;"><%=ptotal %></td>
					<td style="border: 1px solid black;"><%=pdate %></td>
					<td><a href = "./orderlistdelete.jsp?o_number=<%=rs.getString("o_number")%>" class="btn btn-danger" >주문 취소 &raquo;></a></td>
				</tr>
				<%
						}
					}catch(SQLException ex){
						out.println("테이블 호출 실패"); 										
						out.println("SQLException : " + ex.getMessage());
					}finally{
						if(rs != null)rs.close();
						if(stmt != null)stmt.close();
						if(conn != null)conn.close();
					}
				
				%>
			</tbody>
			</table>			
			</div>			
		<hr>
	</div>	
	<jsp:include page="footer.jsp"/>
</body>
</html>