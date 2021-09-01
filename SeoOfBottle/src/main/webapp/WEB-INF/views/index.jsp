<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<meta name ="google-signin-client_id" content="854655733822-odgivq9t2i7nj64vo28sot38ugttg42c.apps.googleusercontent.com">
	<script>
		function sendPost(googleid, email){
			var form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', '/login');
			document.charset = "utf-8";
			
			var hiddenField = document.createElement('input');
			hiddenField.setAttribute('type', 'hidden');
			hiddenField.setAttribute('name', 'googleid');
			hiddenField.setAttribute('value', googleid);
			form.append(hiddenField);
			
			var hiddenField = document.createElement('input');
			hiddenField.setAttribute('type', 'hidden');
			hiddenField.setAttribute('name', 'google');
			hiddenField.setAttribute('value', "g");
			form.append(hiddenField);
			
			var hiddenField = document.createElement('input');
			hiddenField.setAttribute('type', 'hidden');
			hiddenField.setAttribute('name', 'email');
			hiddenField.setAttribute('value', email);
			form.append(hiddenField);
			
			document.body.appendChild(form);
			form.submit();
			
		}
		
		function onSignIn(googleUser) {
			var auth2 = gapi.auth2.getAuthInstance();
			
			if(auth2.isSignedIn.get()){
				  var profile = auth2.currentUser.get().getBasicProfile();
				  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
				  console.log('Name: ' + profile.getName());
				  console.log('Image URL: ' + profile.getImageUrl());
				  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
				  
				  sendPost(profile.getId(), profile.getEmail());
				}
			}
		  
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
<body  onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>New to our website?</h4>
							<a class="button button-account" href="join">Create an Account</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in to enter</h3>
						<form class="row login_form" action="login" method="post" id="contactForm" >
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="pw" name="pw" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
							</div>
							<div class="col-md-12 form-group">
								<p id="errorMessage"></p>
								<button type="submit" value="submit" class="button button-login w-100">Log In</button>
								
							</div>
							<div class="col-md-12 form-group">
								<div class="g-signin2" data-longtitle="true" data-onsuccess="onSignIn"></div>
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

	$(document).ready(function(){
		if ('${error}'){
			document.getElementById("errorMessage").textContent = '${error}';
		}
	});
	
	function noBack(){
		window.history.forward();
	}

</script>

</body>
</html>