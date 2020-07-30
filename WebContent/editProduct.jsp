<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 편집</title>
<script type="text/javascript">
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제합니다!!") == true) location.href = "./deleteProduct.jsp?id=" + id;
		else return;	
		
	}
</script>


</head>
<%
	String edit = request.getParameter("edit"); //현재 모드가 상품수정 이면  상품수정을 수행하고 삭제모드이면 삭제처리
%>

<body>
	<jsp:include page ="menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">상품 편집</h1>			
		</div>			
	</div>	
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product order by p_unitPrice asc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
			
			%>
			<div class="col-md-2">
				<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("p_fileName")%>" style="width: 50%">
				<h4><%=rs.getString("p_name")%></h4>				
				<p><fmt:formatNumber value='<%=rs.getString("p_unitPrice")%>' pattern="#,###"/>원
				<p><%
					if(edit.equals("update")){
				%>
				<a href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-success" role="button">수정 &raquo;</a>
				<%
					}else if(edit.equals("delete"))	{	
				%>
				<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
				
			<%
				}
			%>			
			</div>
			<%
				}
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			%>
			
		</div>
		<hr>	
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>