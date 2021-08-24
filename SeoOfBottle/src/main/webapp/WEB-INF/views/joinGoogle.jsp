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
<form id="signUpForm" action="signUpInput" method="post">
	ID: <input type="text" name="email" value="${email }" readonly><br>
	<input type="hidden" name="pw" value="0">
	<input type="hidden" name="googleId" value=${googleId }>
	Nick Name: <input type="text" name="nick"><br>
	<input type="submit" value="회원 가입"> <button type="button" onclick='location.replace("/")'>돌아가기</button>
</form>

<script>
if ('${dupleCheck}' == "useable"){
	// 닉네임 입력받는 화면 구성
}else{
	// 이미 생성된 이메일이라고 안내하고 연동 여부 확인 구성
}


</script>

</body>
</html>