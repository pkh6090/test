<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>         
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="../resources/js/validation.js"></script>

<script>
	$(function(){
		$("#birth").datepicker({ //datepicker : 날짜를 집음,# : 아이디로 선언해야 함 
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

<script>

function CheckAddMember(){
	
	var form = document.newMember;	
	var id = form.id.value;
	var passwd = form.passwd.value;
	var name = form.name.value;
	var email = form.email.value;
	var birth = form.birth.value;
	var zipCode = form.zipCode.value;
	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;	
			
	var regExp =/^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			
	if(id.length < 4 || id.length > 12){
		alert("[아이디]\n최소 4자에서 최대 12자까지 입력하세요.1313");
		form.id.select();
		form.id.focus();
		return false;	
	}
	
	if(passwd == ""){
		alert("[비밀번호]\n비밀번호를 입력하세요.");
		form.passwd.select();
		form.passwd.focus();
		return false;
	}			
			
	if(passwd.search(id) > -1){
		alert("[비밀번호]\n비밀번호에 아이디값을 포함할 수 없습니다!");
		form.passwd.select();
		form.passwd.focus();
		return false;
	}
	
	if(!reg.test(passwd)){
		alert("[비밀번호]\n비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.");
		form.passwd.select();
		form.passwd.focus();
		return false;		
	}	
	
	if(!regExp.test(name)){
		alert("[이름]\n비어있거나 숫자로 시작할 수 없습니다.");
		form.name.select();
		form.name.focus();
		return false;		
	}	
	
	if(birth.length == 0 ){
		alert("[생년월일]\n생일을 입력하세요.");
		form.birth.select();
		form.birth.focus();
		return false;
	}
	
	if(email.length == 0 ){
		alert("[이메일]\n이메일을 입력하세요.");
		form.email.select();
		form.email.focus();
		return false;
	}
	
	if(zipCode == ""){
		alert("[우편번호]\n우편번호를 입력하세요.");
		form.zipCode.select();
		form.zipCode.focus();
		return false;
	}	
			
	document.newMember.submit();
}

</script>


<script>
	$(document).ready(function () {
	   $(function () {
	            $('.phone').keydown(function (event) {
	             var key = event.charCode || event.keyCode || 0;
	             $text = $(this); 
	             if (key !== 8 && key !== 9) {
	                 if ($text.val().length === 3) {
	                     $text.val($text.val() + '-');
	                 }
	                 if ($text.val().length === 8) {
	                     $text.val($text.val() + '-');
	                 }
	             }
	
	             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
				 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
				 // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
	         })
	   });
	});
</script>

<script>
	document.getElementById("regdate").value = 123;	
	
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

<script>

function idCheck(){ //id 중복체크 	
	window.open("idCheckForm.jsp", "idwin", "width=400, height=350"); //새창 만들기 
	}

</script>

<title>회원 가입</title>
</head>
<body>	
	<jsp:useBean id="now" class="java.util.Date"/>
	<jsp:include page ="/menu.jsp"/>
	<div class = "jumbotron"> <!-- jumbotron 상품목록이라는 타이틀을 찍을 때 씀  -->
		<div class = "container"> <!-- 콘테이너는 반응형 웹 제작에 사용 -->
			<h1 class = "display-3">회원가입</h1>			
		</div>	
	</div>
	
	<div class="container">	
		
		<form name="newMember" action="processAddMember.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			
			<div class="form-group row">			
				<label class="col-sm-2">아이디</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-3">
					<input type="text" name="id" id="id" class="form-control">
				</div>	
				<input type="button" value="ID중복확인" onclick="idCheck()">
			</div>		
			
			<div class="form-group row">			
				<label class="col-sm-2">비밀번호</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-3">
					<input type="text" name="passwd" class="form-control">
				</div>				
			</div>
			
			<div class="form-group row">			
				<label class="col-sm-2">이름</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>				
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남" /> 남 
					<input name="gender" type="radio" value="여" /> 여
				</div>
			</div>
			
			<div class="form-group row">			
				<label class="col-sm-2">생년월일</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-3">
					<input type="text" id="birth" name="birth" class="form-control">
				</div>				
			</div>		
			
			<div class="form-group row">			
				<label class="col-sm-2">이메일</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-3">
					<input type="text" name="email" class="form-control">
				</div>				
			</div>
			
			<div class="form-group row">			
				<label class="col-sm-2">전화번호</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-3">
					<input class="phone" type="text" name="phone" maxlength="13" size="13" placeholder="000-0000-0000" class="form-control">
				</div>				
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input id="zipCode" name="zipCode" type="text" readonly="readonly" class="form-control"/>
					<input type="button" value="우편번호찾기"  onclick="Postcode()"/>
				</div>			
			</div>
			
			<div class="form-group row">			
				<label class="col-sm-2">주소</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-5">
					<input type="text" id="addressName" name="address" class="form-control">
				</div>				
			</div>		
			
			<div class="form-group row">			
				<label class="col-sm-2">상세주소</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-5">
					<input type="text" id="addressName2" name="address2" class="form-control">
				</div>				
			</div>
			
			<div class="form-group row">			
				<label class="col-sm-2">가입일자</label> <!-- col-sm-2 : sm=small,lg=large -->
				<div class="col-sm-3">					
					<input type="text" name="regdate" readonly="readonly" value="<fmt:formatDate value="${now}" type="both"/>" class="form-control">
				</div>				
			</div>			
							
			<div class="form-group row">				
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="회원가입" onclick="CheckAddMember()">
				</div>				
			</div>
		</form>
		
	</div>	

</body>
</html>