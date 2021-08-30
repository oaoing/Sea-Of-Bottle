<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>SOB</title>
  
  <script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<meta name ="google-signin-client_id" content="854655733822-odgivq9t2i7nj64vo28sot38ugttg42c.apps.googleusercontent.com">
   <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
     <script>
    function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function () {
        console.log('User signed out.');
      });
      location.replace("/")
    }

    function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
  </script>
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
							<h4>Welcome new Google User!</h4>
							<p>If you want to back, the</p>
							<a class="button button-account" href="javascript:signOut();" id="back">back</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>Create an account</h3>
						<form class="row login_form" id="register_form" name="signUpForm" action="signUpInput" method="post">
							<input type="hidden" name="pw" value="0">
							<input type="hidden" name="googleid" value='${googleid }'>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" value="${email }" readonly>
							</div>
			                <div class="col-md-12 form-group">
								<input type="text" class="form-control" value="${nick }" id="nick" name="nick" placeholder="Nick Name (2 ~ 10자 이내)" onKeyUp="nickValCheck()" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nick Name (2 ~ 10자 이내)'">
								<span id="nickCheckMessage"></span>
							</div>	
							<div class="col-md-12 form-group">
								<span id="formCheckNotice"> </span>
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
  
  <script>

	if('${dupleCheck}' == "unuseable"){
		setTimeout(() => check(), 1000);
	}

	

function check(){
	if(confirm("회원 가입된 이메일 입니다. \n연동하시겠습니까?")==true){
		let f = document.createElement('form');
		
		let obj;
		
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'email');
	    obj.setAttribute('value', '${email }');
	    f.appendChild(obj);
		 
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'pw');
	    obj.setAttribute('value', '0');
	    f.appendChild(obj);
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'googleid');
	    obj.setAttribute('value', '${googleid }');
	    f.appendChild(obj);
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'nick');
	    obj.setAttribute('value', '${nick }');
	    f.appendChild(obj);
	    
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', 'modifyUser');
	    document.body.appendChild(f);
	    f.submit();
	
	}else{
		signOut();
	}
}

function formSubmit(){
	if(!nickCheck){
		document.getElementById("formCheckNotice").textContent = "별명을 입력해주세요.";
		nick.focus();
	}else{
		document.getElementById("register_form").submit();
	}
}

function nickValCheck(){
	// 2~10자 이내
	var pwPattern= /^.{2,10}/;
	var pw = document.getElementById("nick").value;
	if(!pwPattern.test(pw)) {
		nickCheck=false;
	}else{
		nickCheck=true;
	}
}

</script>
</body>
</html>