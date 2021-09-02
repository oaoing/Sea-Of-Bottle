<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <script type="text/javascript">
	window.history.forward();
	</script>
  <title>SOB</title>
	<link rel="icon" href="/resources/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="/resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="/resources/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
  <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="/resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="/resources/vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	
 
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>Already have an account?</h4>
							<a class="button button-account" href="/">Login Now</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>Create an account</h3>
						<form class="row login_form" id="register_form" name="signUpForm" action="signUpInput" method="post">
							<input type="hidden" name="googleid" id="googleid" value="">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'">
								<button class="button button-register w-100" onclick="emailAuthentication()" id="emailAuthBtn" type="button">Address AuthCode Send</button>
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="inputAuthCode" name="authCode" onKeyUP="authCodeCheck()" placeholder="AuthCode" onfocus="this.placeholder = ''" onblur="this.placeholder = 'AuthCode'" disabled="disabled">
				            </div>
				            <div class="col-md-12 form-group text-left">
								<input type="password" class="form-control" id="pw" name="pw" placeholder="Password" onKeyUp="pwValCheck()" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
								<span id="pwCheckMessage">* 영어, 숫자를 포함한 8~16자를 입력해주세요.</span>
			                </div>
			                <div class="col-md-12 form-group text-left">
								<input type="text" class="form-control" id="nick" name="nick" placeholder="Nick Name (2 ~ 10자 이내)" onKeyUp="nickValCheck()" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nick Name (2 ~ 10자 이내)'">
								<span style="color:orange;">* 닉네임은 이후 변경이 불가합니다.</span>
							</div>	
							<div class="col-md-12 form-group text-left">
								<span id="formCheckNotice" style="color:#c5322d;"> </span>
								<button type="button" onclick="formSubmit()" value="submit" class="button button-login w-100">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->



  <script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="/resources/vendors/skrollr.min.js"></script>
  <script src="/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="/resources/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="/resources/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="/resources/vendors/mail-script.js"></script>
  <script src="/resources/js/main.js"></script>
  
  <script type="text/javascript">
    
var timer;
var auth = false;
var pwCheck = false;
var nickCheck =false;

function emailAuthentication(){
	if (!emailValCheck()){
    	return false;
    }
	$.get("/confirmEmail?email=" + document.getElementById("email").value,
			function(data){
			if (data == "useable"){
				sessionStorage.clear();
				document.getElementById("inputAuthCode").placeholder = "전송중";
				requestAuthEamil();
			}else if(data == "unuseable/"){
				//중복 이메일 확인
				//사용불가 메세지 띄우기
				alert("이미 사용중인 이메일입니다.");
				location.replace("/");
			}else{
					if(confirm("구글 계정으로 생성된 이메일 입니다.\n연동하시겠습니까?")==true){
						document.getElementById("email").readOnly = true;
						document.getElementById("nick").readOnly = true;
						var info = data.split("/");
						document.getElementById("nick").value = info[0];
						document.getElementById("googleid").value = info[1];
						sessionStorage.clear();
						document.getElementById("inputAuthCode").placeholder = "전송중";
						requestAuthEamil();
						document.getElementById("register_form").action = "modifyUser";
					}else{
						location.replace('/');
					}
				}
	});
}

function emailValCheck(){
	var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = document.getElementById("email");
	if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
		return false;
	}
    return true;
}

function check(pattern, target, message) {
	if(pattern.test(target.value)) {
    	return true;
    }
    alert(message);
    target.focus();
    return false;
}

function requestAuthEamil(){
	$.get("/requestAuthEmail?email=" + document.getElementById("email").value,
			function(data){
			if (data != "failed"){
				console.log("인증코드 발송 성공");
				sessionStorage.setItem("authCode", data);
				// 시간초 지나는 거 확인
				document.getElementById("inputAuthCode").disabled = false;
				countDownTimer("inputAuthCode");
			}else{
				console.log("error 발생");
			}
	});
	
}

function authCodeCheck(){
	
	var inputedCode = document.getElementById("inputAuthCode").value;
	
	if(sessionStorage.getItem("authCode") == inputedCode){
		document.getElementById("email").readOnly = true; 
		document.getElementById("inputAuthCode").disabled = true;
		sessionStorage.clear();
		clearInterval(timer);
		auth = true;
		alert("인증이 완료됐습니다.");
	} else {
		auth = false;
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
			document.getElementById(id).placeholder = '인증 번호가 만료됐습니다.';	// 인증번호 만료 알림
			sessionStorage.clear();	// session 삭제
			console.log(sessionStorage.length);	// 삭제 확인
			document.getElementById("inputAuthCode").disabled = true;
			return; 
		} 
		var minutes = 1 - Math.floor((distDt % (_minute*60)) / _minute); 
		var seconds = 60 - Math.floor((distDt % _minute) / _second); 
		if (minutes == 0 && seconds == 60){
			minutes = 1;
			seconds = 0;
		}
		document.getElementById(id).placeholder = '0' + minutes + ':'; 
		document.getElementById(id).placeholder += ((seconds<10)?'0':'') +  seconds; 
	} 
	timer = setInterval(showRemaining, 1000); 
}

function pwValCheck(){
	// 비밀번호가 8~16자, 영어 숫자 포함
	var pwPattern= /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
	var pw = document.getElementById("pw").value;
	if( !pwPattern.test(pw)) {
		document.getElementById("pwCheckMessage").textContent = "* 영어, 숫자를 포함한 8~16자를 입력해주세요.";
		pwCheck = false;
	}else{
		pwCheck = true;
		document.getElementById("pwCheckMessage").textContent = "* 사용 가능한 비밀번호 입니다.";
	}
}

function nickValCheck(){
	// 2~10자 이내
	var nickPattern= /^.{2,10}/;
	var nick = document.getElementById("nick").value;
	if(!nickPattern.test(nick)) {
		nickCheck = false;
	}
	else{
		nickCheck = true;
	}
}

function formSubmit(){
	var email = document.getElementById("email");
	var form = document.getElementById("register_form");
	if(!email.value){
		document.getElementById("formCheckNotice").textContent = "* 아이디를 입력해주세요";
		email.focus();
	}else if(!auth){
		document.getElementById("formCheckNotice").textContent = "* 이메일 인증을 진행해주세요.";
	}else if(!pwCheck){
		document.getElementById("formCheckNotice").textContent = "* 비밀번호를 입력해주세요.";
		pw.focus();
	}else if(!nickCheck){
		document.getElementById("formCheckNotice").textContent = "* 별명을 입력해주세요.";
		nick.focus();
	}else{
		alert("회원가입이 완료됐습니다.");
		form.submit();
	}
}


</script>
</body>
</html>