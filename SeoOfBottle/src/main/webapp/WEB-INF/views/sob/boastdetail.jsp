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
<!-- 삭제  -->	
<form action="/sob/remove" method="post">
<input type="text" name="from" value="${latter[0].from}" hidden>
<input type="hidden" name="labelid" value="${latter[0].labelid}">

<input type="submit" value="삭제">
</form>


<%-- 댓글 시작 --%>
<h3>댓글창</h3>
<input type="text" id="reply" placeholder="댓글을 입력하세요"> 
<button type="button" id="replyRegisterBtn">댓글등록</button>
<br> <br>
<div>
<table border=1>
	<tr>
		<th width=200>번호</th>
		<th width=120>내용</th>
		<th width=100>작성일</th>
	</tr>

<tbody class="replyList">

</tbody>

</table>
</div>
<%-- 댓글 끝--%>
	

<script src="/resources/js/reply.js"></script>
<!-- jQuery -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>

<script>
	var thislabelid = '${latter[0].labelid}';
	$(document).ready(function() {
		function showList() {
			replyService.getList({labelid : thislabelid},function(data) {
				var str = '';
				for (var i = 0, len = data.length || 0; i < len; i++) {
				console.log(data[i]);
				str += '<tr><td>'+ data[i].replyno+ '</td><td>'+ data[i].reply
						+ '</td><td>'+ replyService.displayTime(data[i].indate)
						+ '</td>';
				}
				
				$(".replyList").html(str);
			})
		}
		showList();
		$("#replyRegisterBtn").on("click", function() {
			//버튼 클릭 되었을때 실행할 내용.
			var reply = {labelid : thislabelid,reply : $("#reply").val()};
			replyService.add(reply);
			console.log("리플등록");
			alert("댓글이 등록되었습니다");
			showList();
			$("#reply").val("");
		})
	})
</script>







</body>
</html>