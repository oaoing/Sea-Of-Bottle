<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
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
</head>
<body>
<form action="login" method="post" id="loginForm">
	ID: <input type="text" name="email" id="email"><br>
	PW: <input type="password" name="pw" id="pw"><br>
	<input type='submit' name="loginBtn" value="로그인">
</form>
<br>
<div class="g-signin2" data-onsuccess="onSignIn"></div>
<a href='join'>회원 가입</a>
<script type="text/javascript">

	if ('${error}'){
		var form = document.getElementById("loginForm");
		var newNode = document.createElement("p");
		newNode.appendChild(document.createTextNode( "${error}" ));
		form.insertBefore(newNode, form.loginBtn);
	}

</script>
</body>
</html>