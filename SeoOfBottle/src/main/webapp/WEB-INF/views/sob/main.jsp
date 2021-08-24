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
	<a href="/sob/register">등록창</a>

	<table border="1">
		<thead>
			<tr>
				<th>유리병 아이디</th>
				<th>카테고리</th>
				<th>내용</th>
				<th>자랑여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="test">

				<tr>
					<td>${test.groupId }</td>
					<td>${test.category }</td>
					<td><a href="get?groupId=${test.groupId }">${test.contents }</a></td>
					<td>${test.boast }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

<br>

</body>
</html>