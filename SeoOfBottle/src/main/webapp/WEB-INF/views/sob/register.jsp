<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl날짜 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Blog</title>
<%@ include file="../include/header.jsp"%>
<!-- 헤더를 가져오는 지시어 -->


<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="blog">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Home</h1>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->
등록창 테스트
<form action="/sob/register" id = "re" method="post">
contents<input type="text" name="contents">
<input type="text" name="from" value="${uvo.customerno}" hidden>
cnt<input type="number" name="cnt" value="1" placeholder="1" readonly>
category<select form="re" name="categoryid">
<c:forEach items="${categoryList}" var="temp">
<option value="${temp.categoryid }" >${temp.category }</option>
</c:forEach>
</select>
<input type="submit" value="등록">

</form>




<%@ include file="../include/footer.jsp"%>
<!-- 풋터를 가져오는 지시어 -->
</body>
</html>