<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name ="google-signin-client_id" content="854655733822-odgivq9t2i7nj64vo28sot38ugttg42c.apps.googleusercontent.com">
     <script>
    function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function () {
        console.log('User signed out.');
      });
      location.replace("/");
    }

    function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
  </script>
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<title>Join</title>
</head>
<body>
<form id="signUpForm" action="signUpInput" method="post">
	ID: <input type="text" name="email" value='${email }' readonly><br>
	<input type="hidden" name="pw" value="0">
	<input type="hidden" name="googleId" value='${user.googleid }'>
	<input type="hidden" name="customerno" value='${user.customerno}' >
	Nick Name: <input type="text" name="nick" id="nick"><br>
	<input type="submit" value="회원 가입"> <button type="button" onclick='signOut();'>돌아가기</button>
</form>

<script>
if ('${dupleCheck}' == "useable"){
	// 닉네임 입력받기
}else{
	if(confirm("회원 가입된 이메일 입니다.\n연동하시겠습니까?")==true){
		document.getElementById("nick").value = "${user.nick}";
		document.getElementById("nick").disabled = true;
		document.getElementById("signUpForm").action = "modifyUser";
	}else{
		signOut();
	}
}


</script>

</body>
</html>