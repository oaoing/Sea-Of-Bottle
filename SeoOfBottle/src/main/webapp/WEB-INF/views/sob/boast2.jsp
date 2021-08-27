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
	<a href="/sob/myboast">마이페이지</a>
	
	<form action="/sob/boast2" id= "boa">
		category<select form="boa" name="categoryid">
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
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boastList}" var="test">

				<tr>
					<td>${test.labelid }</td>
					<td>${test.category }</td>
					<td><a href="boastdetail?labelid=${test.labelid }">${test.contents }</a></td>
					

				</tr>
			</c:forEach>
		</tbody>
	</table>

<br>


</body>
</html>