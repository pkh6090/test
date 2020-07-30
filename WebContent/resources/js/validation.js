function CheckAddProduct(){		
	var productId = document.getElementById("productId");	
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var ability = document.getElementById("ability");
	
	if(!check(/^P[0-9]{3}$/, productId,
		"[아이템코드]\nP와 숫자를 조합하여 4자리까지 입력하세요."))
		return false;	
	
	if(name.value.length < 1 || name.value.length > 12){
		alert("[아이템이름]\n최소 1자에서 최대 12자까지 입력하세요.");
		name.select();
		name.focus();
		return false;		
	}		
	
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("[아이템가격]\n숫자만 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}		
	
	if(unitPrice.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;		
	} else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice, "[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;
				
	function check(regExp, e, msg){		
		if(regExp.test(e.value)){
			return true;
		}			
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newProduct.submit();
	
}

function CheckAddMember(){
	
	alert("id를 입력하시오.20200716");
}

function checkid() {
	if(newMember.id.value == "") {
		alert("id를 입력하시오.");
		newMember.id.focus();
	} else {
		url = "check_id.jsp?id=" + newMember.id.value;
		// 두 번째 파라미터는 메소드 전송방식이 아니고 타이틀
		window.open(
				url, 
				"id check", "toolbar=no, width=350, height=150, top=150, left=150");
	}
}


