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
<!-- email select로 제한 걸기 -->
<form name="signUpForm" action="signUpInput" method="post">
	ID: <input type="text" name="email" id="email"  maxlength="30"><button onclick="emailAuthentication()" id="emailAuthBtn" type="button" class="btnChk">인증 메일 보내기</button><br>
	인증번호: <input type="text" name="authCode" id="inputAuthCode"  maxlength="10" disabled="disabled">
	<button onclick="authCodeCheck()" id="authCodeCheckBtn" type="button" disabled="disabled" class="btnChk">인증</button><p id="count"></p>
	<input type="hidden" name="authPass" id="authPass" value="false"><br>
	PW: <input type="password" name="pw" id="pw" onKeyUp="pwValCheck()"><p id="pwCheckNotice">비밀번호는 영어, 숫자를 포함한 8~16자를 입력해주세요.</p><br>
	Nick Name: <input type="text" name="nick" id="nick" onKeyUp="nickValCheck()"><p id="nickCheckNotice">2자~10자 이내</p><br>
	<input type="hidden" name="googleid" id="googleid" value=""><p id="formCheckNotice"></p>
	<input type="button" onclick="formSubmit()" value="회원 가입"> <button type="button" onclick='location.replace("/")'>돌아가기</button>
</form>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

var timer;
var auth = false;
var pwCheck = false;
var nickCheck =false;
const form = document.signUpForm;

function emailAuthentication(){
	if (!emailValCheck()){
    	return false;
    }
	$.get("http://localhost:8080/confirmEmail?email=" + document.getElementById("email").value,
			function(data){
			if (data == "useable"){
				console.log(data);
				sessionStorage.clear();
				document.getElementById("count").textContent = "전송중";
				requestAuthEamil();
			}else if(data == "unuseable/"){
				console.log(data);
				//중복 이메일 확인
				//사용불가 메세지 띄우기
				alert("이미 사용중인 이메일입니다.");
			}else{
				if(confirm("구글 계정으로 생성된 이메일 입니다.\n연동하시겠습니까?")==true){
					document.getElementById("email").readOnly = true;
					document.getElementById("nick").readOnly = true;
					var info = data.split("/");
					document.getElementById("nick").value = info[0];
					document.getElementById("googleid").value = info[1];
					sessionStorage.clear();
					requestAuthEamil();
					form.action = "modifyUser";
				}
			}
	});
}

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
	$.get("http://localhost:8080/requestAuthEmail?email=" + document.getElementById("email").value,
			function(data){
			if (data != "failed"){
				console.log("인증코드 발송 성공");
				sessionStorage.setItem("authCode", data);
				// 시간초 지나는 거 확인
				document.getElementById("inputAuthCode").disabled = false;
				document.getElementById("authCodeCheckBtn").disabled = false;
				countDownTimer("count");
			}else{
				console.log("error 발생");
			}
	});
	
}

function authCodeCheck(){
	
	var inputedCode = document.getElementById("inputAuthCode").value;
	
	if (inputedCode == ""){
		alert("인증번호가 올바르지 않습니다.");
		document.getElementById("authPass").value = "false";
	}
	if(sessionStorage.getItem("authCode") == inputedCode){
		alert("인증이 완료되었습니다.");
		document.getElementById("authPass").value = true;
		console.log("${authCode}");
		document.getElementById("email").readOnly = true; 
		document.getElementById("authCodeCheckBtn").disabled = true;
		document.getElementById("inputAuthCode").disabled = true;
		document.getElementById("count").textContent = ""; 
		sessionStorage.clear();
		clearInterval(timer);
		auth = true;
	} else {
		alert("인증번호가 올바르지 않습니다.");
		document.getElementById("authPass").value = false;
	}

}
function countDownTimer(id) {
	var _vDate = new Date();	// 타이머 시작시간
	var _second = 1000; 	// ms 단위
	var _minute = _second * 60; 
	function showRemaining() {
		var now = new Date();	// 1초마다 갱신한 시간
		var distDt = now - _vDate;
		if (distDt > 2 * _minute) {	// 2분이 지나면 
			clearInterval(timer); 	// interval 종료
			document.getElementById(id).textContent = '인증 번호가 만료됐습니다.';	// 인증번호 만료 알림
			sessionStorage.clear();	// session 삭제
			console.log(sessionStorage.length);	// 삭제 확인
			return; 
		} 
		var minutes = 1 - Math.floor((distDt % (_minute*60)) / _minute); 
		var seconds = 60 - Math.floor((distDt % _minute) / _second); 
		if (minutes == 0 && seconds == 60){
			minutes = 1;
			seconds = 0;
		}
		document.getElementById(id).textContent = '0' + minutes + ':'; 
		document.getElementById(id).textContent += ((seconds<10)?'0':'') +  seconds; 
	} 
	timer = setInterval(showRemaining, 1000); 
}

function pwValCheck(){
	// 비밀번호가 8~16자, 영어 숫자 포함
	var pwPattern= /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
	var pw = document.getElementById("pw").value;
	if( !pwPattern.test(pw)) {
		document.getElementById("pwCheckNotice").textContent = "비밀번호는 영어, 숫자를 포함한 8~16자를 입력해주세요.";
	}else{
		pwCheck = true;
		document.getElementById("pwCheckNotice").textContent = "사용 가능한 비밀번호 입니다.";
	}
}

function nickValCheck(){
	// 2~10자 이내
	var pwPattern= /^.{2,10}/;
	var pw = document.getElementById("nick").value;
	if( pwPattern.test(pw)) {
		nickCheck=true;
	}
}

function formSubmit(){
	var email = form.email;
	var pw = form.pw;
	var nick = form.nick;
	if(!email.value){
		document.getElementById("formCheckNotice").textContent = "아이디를 입력해주세요";
		email.focus();
	}else if(!auth){
		document.getElementById("formCheckNotice").textContent = "이메일 인증을 진행해주세요.";
	}else if(!pwCheck){
		document.getElementById("formCheckNotice").textContent = "비밀번호를 입력해주세요.";
		pw.focus();
	}else if(!nickCheck){
		document.getElementById("formCheckNotice").textContent = "별명을 입력해주세요.";
		nick.focus();
	}else{
		form.submit();
	}
}


</script>

</body>
</html>