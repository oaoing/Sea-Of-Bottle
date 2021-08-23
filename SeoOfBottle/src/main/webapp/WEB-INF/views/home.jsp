<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name ="google-signin-client_id" content="854655733822-odgivq9t2i7nj64vo28sot38ugttg42c.apps.googleusercontent.com">
<script>

function sendPost(userId){
	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', '/list');
	document.charset = "utf-8";
	
	var hiddenField = document.createElement('input');
	hiddenField.setAttribute('type', 'hidden');
	hiddenField.setAttribute('name', 'userId');
	hiddenField.setAttribute('value', userId);
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
		  
		  sendPost(profile.getId());
		}
	}


</script>
</head>
<body>
<div class="g-signin2" data-onsuccess="onSignIn"></div>

</body>
</html>