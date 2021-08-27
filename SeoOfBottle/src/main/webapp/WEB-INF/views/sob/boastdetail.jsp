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
					<td>${test1.labelid }</td>
					<td>${test1.contents }</td>
					<td>${test1.category }</td>
					<td>${test1.cnt }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
<br>
<!-- 삭제 수정 예정 -->	
<form action="/sob/remove" method="post">
<input type="text" name="from" value="${latter[0].from}" hidden>
<input type="hidden" name="labelid" value="${latter[0].labelid}">

<input type="submit" value="삭제">
</form>


</body>
</html>