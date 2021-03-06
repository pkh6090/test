<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>
	$(function(){
		$("#shippingDate").datepicker({ //datepicker : 날짜를 집음,# : 아이디로 선언해야 함 
			changeMonth:true,
			changeYear:true,
			dateFormat:"yy-mm-dd",
			prevText:"이전 달",
			nextText:"다음 달",
			monthNames:['1월','2월','3월','4월',
						'5월','6월','7월','8월',
						'9월','10월','11월','12월'
				       ],
			monthNamesShort:['1월','2월','3월','4월',
							'5월','6월','7월','8월',
							'9월','10월','11월','12월'
					       ],
			dayNames:['일','월','화','수','목','금','토'],
			dayNamesShort:['일','월','화','수','목','금','토'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			showMonthAfterYear:true,
			yearSuffix:'년'
		});
	});
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addressName2").value = extraAddr;
                
                } else {
                    document.getElementById("addressName2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCode').value = data.zonecode; // zipCode : jsp를 만들 때 우
                document.getElementById("addressName").value = addr; // addressName
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("zipCode").focus();
            }
        }).open();
    }
</script>
<meta charset="UTF-8">


<script>
function CheckAddShipping(){	
	
	var name = document.getElementById("name");		
	var shippingDate = document.getElementById("shippingDate");
	var country = document.getElementById("country");	
	
	if(shippingDate == "" || shippingDate.value.length == 0 ){
		alert("[배송날짜]\n배송날짜를 입력하세요.");
		shippingDate.select();
		shippingDate.focus();
		return false;
	}		
		
	document.newShipping.submit();
}

</script>

<script>
	document.getElementById("regdate").value = 123;	
	
</script>

<title>배송 정보</title>
</head>
<body>
	<%		
		String sessionId = (String)session.getAttribute("sessionId");
	%>
	<!-- db 접속 설정 -->	
	<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"	url="jdbc:mysql://localhost:3306/loldb"
			user="root"	password="1234"	/>	
	
	<sql:query 	dataSource="${dataSource}"	var="resultSet">
		select * from member where id = ?	<sql:param value="<%=sessionId%>"/>
	</sql:query>

	<jsp:useBean id="now" class="java.util.Date"/>
	<jsp:include page ="menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">배송 정보</h1>			
		</div>			
	</div>
	
	<c:forEach var="row" items="${resultSet.rows}">
	
	<div class="container">
		<form name="newShipping" action="./processShippingInfo.jsp" class="form-horizontal" method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" />
			
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input id="name" name="name" type="text" value="<c:out value='${row.name}'/>" class="form-control"/>
				</div>			
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">구매일</label>
				<div class="col-sm-3">
					<input id="shippingDate2" name="shippingDate2" readonly="readonly" type="text" value="<fmt:formatDate value="${now}" type="both"/>" class="form-control"/>
				</div>			
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
					<input id="shippingDate" name="shippingDate" type="text" class="form-control"/>(yyyy/mm/dd)
				</div>			
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">국가명</label>
				<div class="col-sm-3">
					<input id="country" name="country" type="text" value="대한민국" class="form-control"/>
				</div>			
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input id="zipCode" name="zipCode" type="text" readonly="readonly" value="<c:out value='${row.postcd}'/>" class="form-control"/>
					<input type="button" value="우편번호찾기"  onclick="Postcode()"/>
				</div>			
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input id="addressName" name="addressName" type="text" value="<c:out value='${row.address}'/>" class="form-control"/>
				</div>			
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세주소</label>
				<div class="col-sm-5">
					<input id="addressName2" name="addressName2" type="text" value="<c:out value='${row.address2}'/>" class="form-control"/>
				</div>			
			</div>
		
			<div class="form-group row">				
				<div class="col-sm-offset-2 col-sm-10 ">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-secondary" role="button">
					이전
					</a>
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddShipping()"/>
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>	
					
				</div>			
			</div>
		</form>
	</div>	
	</c:forEach>
</body>
</html>