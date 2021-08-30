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
					<td>${test1.labelid }</td>
					<td>${test1.contents }</td>
					<td>${test1.category }</td>
					<td>${test1.cnt }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
<br>
<!-- 추가 글 작성 -->	
추가등록 테스트
<c:if test="${mvo.cnt<3 && mvo.to==uvo.getCustomerno()}">
<form action="/sob/register" id = "re" method="post">

contents<input type="text" name="contents">
cnt<input type="number" name="cnt" value="${mvo.cnt+1}" placeholder="${mvo.cnt+1}" readonly><!-- 여기 수정후 아래로 -->
category<select form="re" name="categoryid">
<option value="${latter[0].categoryid }" >${latter[0].category }</option>
</select>

<input type="text" name="from" value="${uvo.customerno}" hidden>
<input type="text" name="labelid" value="${latter[0].labelid}" hidden>
<input type="submit" value="등록">
</form>	
</c:if>

<c:if test="${mvo.cnt==3 && mvo.to==uvo.getCustomerno()}">
<form action="/sob/register" id = "re" method="post">
<input type="text" name="from" value="${latter[0].from}" hidden>
<input type="text" name="labelid" value="${latter[0].labelid}" hidden>
<input type="number" name="cnt" value="${mvo.cnt+1}" placeholder="${mvo.cnt+1}" hidden><!-- 여기 수정후 아래로 -->
<input type="submit" value="자랑하기">
</form>
</c:if>
	
	
	
<!-- 삭제  -->	
<form action="/sob/remove" method="post">
<input type="text" name="from" value="${latter[0].from}" hidden>
<input type="hidden" name="labelid" value="${latter[0].labelid}">

<input type="submit" value="삭제">

</form>
</body>
</html>