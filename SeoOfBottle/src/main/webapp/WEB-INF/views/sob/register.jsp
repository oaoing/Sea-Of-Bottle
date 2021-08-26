<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
등록창 테스트
<form action="/sob/register" id = "re" method="post">
to<input type="text" name="to">
contents<input type="text" name="contents">
from<input type="text" name="from">
cnt<input type="number" name="cnt" value="1" placeholder="1" readonly>
category<select form="re" name="categoryid">
<c:forEach items="${categoryList}" var="temp">
<option value="${temp.categoryid }" >${temp.category }</option>
</c:forEach>
</select>
boast<input type="number" name="boast">
<input type="submit" value="등록">

</form>




</body>
</html>