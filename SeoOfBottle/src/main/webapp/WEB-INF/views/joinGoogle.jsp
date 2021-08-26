<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>Join</title>
</head>
<body>
<form name="signUpForm" action="signUpInput" method="post">
	ID: <input type="text" name="email" value="${email }" readonly><br>
	<input type="hidden" name="pw" value="0">
	<input type="hidden" name="googleid" value=${googleid }>
	Nick Name: <input type="text" name="nick" id="nick" value=${nick } onKeyUp="nickValCheck()"><br>
	<p id="formCheckNotice"></p><br>
	<input type="button" onclick="formSubmit()" value="회원 가입"> <button type="button" id="back" onclick='signOut();'>돌아가기</button>
</form>

<script>

	if('${dupleCheck}' == "unuseable"){
		setTimeout(() => check(), 500);
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
		document.getElementById("back").click();
	}
}

function formSubmit(){
	var nick = document.signUpForm.nick;
	if(!nick.value){
		document.getElementById("formCheckNotice").textContent = "별명을 입력해주세요.";
		nick.focus();
	}else{
		document.signUpForm.submit();
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

</script>

</body>
</html>