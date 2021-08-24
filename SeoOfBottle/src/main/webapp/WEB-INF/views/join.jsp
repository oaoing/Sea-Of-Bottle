<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Join</title>
</head>
<body>
<form name="signUpForm" action="signUpInput" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	ID: <input type="text" name="email" id="inputEmailForm"  maxlength="30"> <button type="button" onclick="emailAuthentication();">중복확인</button><br>
	인증번호: <input type="text" name="authCode" id="inputAuthCode"  maxlength="10" disabled="disabled">
	<button onclick="authCodeCheck()" id="authCodeCheckBtn" type="button" disabled="disabled" class="btnChk">인증</button>
	<button onclick="emailAuthentication()" id="eamilAuthBtn" type="button" class="btnChk">인증 메일 보내기</button><br>
	PW: <input type="password" name="pw"><br>
	Nick Name: <input type="text" name="nick"><br>
	<input type="submit" value="회원 가입"> <button type="button" onclick='location.replace("/")'>돌아가기</button>
</form>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


function emailAuthentication(){
	if (!emailValCheck()){
    	return false;
    }
	$.ajax({
		type: "GET",
		usr: "confirmEmail?email=" + document.signUpForm.email.value,
		data: {},
		dataType: "text",
		success: function(data){
			if (data=="useable"){
				console.log("중복확인 성공 - 중복 아님");
				//requestAuthEamil();
			}else{
				console.log("중복확인 성공 - 중복");
				//중복 이메일 확인
				//사용불가 메세지 띄우기
			}
		},
		error: function(xhr, status, error){
			
		}
	});
}

const form = document.signUpForm;

function emailValCheck(){
	var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = form.email;
	if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
		return false;
	}
    return true;
}

function check(pattern, taget, message) {
	if(pattern.test(taget.value)) {
    	return true;
    }
    alert(message);
    taget.focus();
    return false;
}

function requestAuthEamil(){
	$.ajax({
		type: "GET",
		usr: "requestAuthEmail?email=" + document.signUpForm.email.value,
		data: {},
		dataType: "text",
		success: function(data){
			if (data=="useable"){
				requestAuthEamil();
			}else{
				//중복 이메일 확인
				//사용불가 메세지 띄우기
			}
		},
		error: function(xhr, status, error){
			
		}
	});
}

</script>

</body>
</html>