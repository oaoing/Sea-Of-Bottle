<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>유리병 아이디</th>
				<th>내용</th>
				<th>카테고리</th>
				<th>이동횟수</th>


			</tr>
		</thead>
		<tbody>
			<c:forEach items="${latter}" var="test1">

				<tr>
					<td>${test1.groupId }</td>
					<td>${test1.contents }</td>
					<td>${test1.categoryId }</td>
					<td>${test1.cnt }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
<form action="/sob/remove" method="post">
<input type="hidden" name="groupId" value="${latter[0].groupId}">
<input type="hidden" name="nick" value="tls">
<input type="hidden" name="userId" value="1">
<input type="hidden" name="google" value="true">

<input type="submit" value="삭제">

</form>
</body>
</html>