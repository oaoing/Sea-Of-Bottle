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
								<span id="pwCheckMessage">* ??????, ????????? ????????? 8~16?????? ??????????????????.</span>
			                </div>
			                <div class="col-md-12 form-group text-left">
								<input type="text" class="form-control" id="nick" name="nick" placeholder="Nick Name (2 ~ 10??? ??????)" onKeyUp="nickValCheck()" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nick Name (2 ~ 10??? ??????)'">
								<span style="color:orange;">* ???????????? ?????? ????????? ???????????????.</span>
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
				document.getElementById("inputAuthCode").placeholder = "?????????";
				requestAuthEamil();
			}else if(data == "unuseable/"){
				//?????? ????????? ??????
				//???????????? ????????? ?????????
				alert("?????? ???????????? ??????????????????.");
				location.replace("/");
			}else{
					if(confirm("?????? ???????????? ????????? ????????? ?????????.\n?????????????????????????")==true){
						document.getElementById("email").readOnly = true;
						document.getElementById("nick").readOnly = true;
						var info = data.split("/");
						document.getElementById("nick").value = info[0];
						document.getElementById("googleid").value = info[1];
						sessionStorage.clear();
						document.getElementById("inputAuthCode").placeholder = "?????????";
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
	if(!check(emailPattern, email, "???????????? ?????? ????????? ???????????????.")) {
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
				console.log("???????????? ?????? ??????");
				sessionStorage.setItem("authCode", data);
				// ????????? ????????? ??? ??????
				document.getElementById("inputAuthCode").disabled = false;
				countDownTimer("inputAuthCode");
			}else{
				console.log("error ??????");
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
		alert("????????? ??????????????????.");
	} else {
		auth = false;
	}

}
function countDownTimer(id) {
	var _vDate = new Date();	// ????????? ????????????
	var _second = 1000; 	// ms ??????
	var _minute = _second * 60; 
	function showRemaining() {
		var now = new Date();	// 1????????? ????????? ??????
		var distDt = now - _vDate;
		if (distDt > 2 * _minute) {	// 2?????? ????????? 
			clearInterval(timer); 	// interval ??????
			document.getElementById(id).placeholder = '?????? ????????? ??????????????????.';	// ???????????? ?????? ??????
			sessionStorage.clear();	// session ??????
			console.log(sessionStorage.length);	// ?????? ??????
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
	// ??????????????? 8~16???, ?????? ?????? ??????
	var pwPattern= /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
	var pw = document.getElementById("pw").value;
	if( !pwPattern.test(pw)) {
		document.getElementById("pwCheckMessage").textContent = "* ??????, ????????? ????????? 8~16?????? ??????????????????.";
		pwCheck = false;
	}else{
		pwCheck = true;
		document.getElementById("pwCheckMessage").textContent = "* ?????? ????????? ???????????? ?????????.";
	}
}

function nickValCheck(){
	// 2~10??? ??????
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
		document.getElementById("formCheckNotice").textContent = "* ???????????? ??????????????????";
		email.focus();
	}else if(!auth){
		document.getElementById("formCheckNotice").textContent = "* ????????? ????????? ??????????????????.";
	}else if(!pwCheck){
		document.getElementById("formCheckNotice").textContent = "* ??????????????? ??????????????????.";
		pw.focus();
	}else if(!nickCheck){
		document.getElementById("formCheckNotice").textContent = "* ????????? ??????????????????.";
		nick.focus();
	}else{
		alert("??????????????? ??????????????????.");
		form.submit();
	}
}


</script>
</body>
</html>