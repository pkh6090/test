<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ page errorPage="exceptionNoProductId.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>챔피언 상세 정보</title>

<style>	

	#b{
		background: black;		
		color: white;
	}	
	
	#c{
		margin: 20px 0px;
		padding: 5px 0px;
	}
	
	th, tr, td{		
		text-align: center;
	}	
	th, tr, td{
		border: 1px solid white;
	}
		
</style>

</head>
<body>
	<jsp:include page ="menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">챔피언 목록</h1>			
		</div>	
	</div>
		<%@ include file="dbconn.jsp"%>	
		<%
			String name = request.getParameter("name");
		
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from champ where c_name = ?";
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, name);			
			
			rs = pstmt.executeQuery();
			if(rs.next()) //if문 while문 무관하게 사용가능
			{
		%>
	<div class="container" id="b" align="center" style="width:100%;">
		<div class="row" >
			<div class="col-md-12">			
				<img src="${pageContext.request.contextPath}/champs/<%=rs.getString("c_image") %>" style="width:55%">
			</div>	
				
			<div id="c">	
			<table style="width:90%; height:140px">
			<tbody>
				<tr>	
					<th style="text-align: left;" colspan="5"><h3> ● <%=rs.getString("p_skil") %></h3></th>	
				</tr>				
				<tr>					
					<td style="width:20%;">
					<img src="${pageContext.request.contextPath}/champs/<%=rs.getString("p_skilIm") %>" style="width:55%">
					</td>					
					<td colspan="4"><%=rs.getString("p_skild") %></td>									
				</tr>						
			</tbody>
			</table>			
			</div>
			
			<div id="c">	
			<table style="width:90%; height:140px">
			<tbody>
				<tr>	
					<th style="text-align: left;" colspan="5"><h3> ● <%=rs.getString("a_skil1") %></h3></th>	
				</tr>				
				<tr>					
					<td style="width:20%;">
					<img src="${pageContext.request.contextPath}/champs/<%=rs.getString("a_skilIm1") %>" style="width:55%">
					</td>					
					<td colspan="4"><%=rs.getString("a_skild1") %></td>									
				</tr>						
			</tbody>
			</table>			
			</div>
			
			<div id="c">	
			<table style="width:90%; height:140px">
			<tbody>
				<tr>	
					<th style="text-align: left;" colspan="5"><h3> ● <%=rs.getString("a_skil2") %></h3></th>	
				</tr>				
				<tr>					
					<td style="width:20%;">
					<img src="${pageContext.request.contextPath}/champs/<%=rs.getString("a_skilIm2") %>" style="width:55%">
					</td>					
					<td colspan="4"><%=rs.getString("a_skild2") %></td>									
				</tr>						
			</tbody>
			</table>			
			</div>
			
			<div id="c">	
			<table style="width:90%; height:140px">
			<tbody>
				<tr>	
					<th style="text-align: left;" colspan="5"><h3> ● <%=rs.getString("a_skil3") %></h3></th>	
				</tr>				
				<tr>					
					<td style="width:20%;">
					<img src="${pageContext.request.contextPath}/champs/<%=rs.getString("a_skilIm3") %>" style="width:55%">
					</td>					
					<td colspan="4"><%=rs.getString("a_skild3") %></td>									
				</tr>						
			</tbody>
			</table>			
			</div>
			
			<div id="c">	
			<table style="width:90%; height:140px">
			<tbody>
				<tr>	
					<th style="text-align: left;" colspan="5"><h3> ● <%=rs.getString("a_skil4") %></h3></th>	
				</tr>				
				<tr>					
					<td style="width:20%;">
					<img src="${pageContext.request.contextPath}/champs/<%=rs.getString("a_skilIm4") %>" style="width:55%">
					</td>					
					<td colspan="4"><%=rs.getString("a_skild4") %></td>									
				</tr>						
			</tbody>
			</table>			
			</div>
			
			<div align="right" style="padding:10px 0px;">
				<a href="./champs.jsp" class="btn btn-primary"> 챔피언 목록 &laquo;</a>
			</div>
			<%
			}
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			%>	
		</div>		
	</div>
	<hr>
	<jsp:include page="footer.jsp"/>
</body>
</html>