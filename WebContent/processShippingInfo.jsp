<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%		
		//배송등록 화면에서 입력받은 모든 항목에 대해 쿠키생성
		//인코딩 : 문자열을 컴퓨터가 알 수 있도록 여러가지 코드로 바꿈(복호화)
		Cookie cartId = new Cookie("Shipping_cartId",URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
		Cookie name = new Cookie("Shipping_name",URLEncoder.encode(request.getParameter("name"),"utf-8"));
		Cookie shippingDate = new Cookie("Shipping_shippingDate",URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
		Cookie shippingDate2 = new Cookie("Shipping_shippingDate2",URLEncoder.encode(request.getParameter("shippingDate2"),"utf-8"));
		Cookie country = new Cookie("Shipping_country",URLEncoder.encode(request.getParameter("country"),"utf-8"));
		Cookie zipCode = new Cookie("Shipping_zipCode",URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
		Cookie addressName = new Cookie("Shipping_addressName",URLEncoder.encode(request.getParameter("addressName"),"utf-8"));
		Cookie addressName2 = new Cookie("Shipping_addressName2",URLEncoder.encode(request.getParameter("addressName2"),"utf-8"));		
		
		cartId.setMaxAge(24*60*60); //쿠키값의 유효시간 : 1일 지정
		name.setMaxAge(24*60*60);
		zipCode.setMaxAge(24*60*60);
		country.setMaxAge(24*60*60);
		addressName.setMaxAge(24*60*60);
		addressName2.setMaxAge(24*60*60);		
		
		response.addCookie(cartId); //쿠키는 반드시 add를 해주어야 함
		response.addCookie(name);
		response.addCookie(shippingDate);
		response.addCookie(shippingDate2);
		response.addCookie(country);
		response.addCookie(zipCode);
		response.addCookie(addressName);
		response.addCookie(addressName2);		
	
		response.sendRedirect("orderConfirmation.jsp");
	%>
</body>
</html>