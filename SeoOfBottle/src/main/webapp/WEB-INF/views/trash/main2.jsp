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
	<a href="/sob/register">등록창</a><br>
	<a href="/sob/boast">자랑게시판</a><br>
	
	<form action="/sob/main2" id= "cate">
		category<select form="cate" name="categoryid">
			<c:forEach items="${categoryList}" var="temp">
				<option value="${temp.categoryid }">${temp.category }</option>
			</c:forEach>
		</select>
		<input type="submit" value="카테고리 검색">
	</form>
	

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
					<td>${test.labelid }</td>
					<td>${test.category }</td>
					<td><a href="get?labelid=${test.labelid }">${test.contents }</a></td>
					<td>${test.boast }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

<br>

</body>
</html>