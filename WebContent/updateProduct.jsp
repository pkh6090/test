<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ include file="dbconn.jsp"%>      
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>아이템 수정</title>
</head>
<body>
	<jsp:include page ="menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">상품 수정</h1>			
		</div>			
	</div>	
	
	<%
		String productId = request.getParameter("id"); //매게변수로 보낸 값
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		
		rs = pstmt.executeQuery();
		if(rs.next())
		{
	%>
	<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<div class="row">
				<div class="col-md-5">
					<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("p_fileName")%>" alt="image" style="width: 50%">
				</div>		
				
				<div class="col-md-7">
					<form name="newProduct" action="./processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">아이템 코드</label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId" class="form-control" value='<%=rs.getString("p_id") %>'>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">아이템 이름</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("p_name") %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getInt("p_unitPrice") %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">아이템능력</label>
						<div class="col-sm-3">
							<input type="text" id="ability" name="ability" class="form-control"  value="<%=rs.getString("p_ability") %>">			
						</div>				
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">상세 설명</label>
						<div class="col-sm-7">
							<textarea name="description" cols="50" rows="2" class="form-control" wrap="hard"><%=rs.getString("p_description") %></textarea>
						</div>
					</div>			
										
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="productImage" class="form-control" >
						</div>
					</div>
					
					<div class="form-group row">						
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>			
					
					</form>				
				</div>			
					
			</div>		
		</div>	
	
	<%
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();	
	%>
	
</body>
</html>