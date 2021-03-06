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
<title>SOB</title>
<%@ include file="../include/header.jsp"%>
<!-- 헤더를 가져오는 지시어 -->

<!-- ================ Blog section start ================= -->
<section class="blog">
	<div class="container">

		<div class="row">
			
			<c:forEach items="${latter}" var="test1">
				<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
					<div class="card card-blog">

						<div class="card-body">
							<div class="confirmation-card puff-in-top-${test1.cnt}">
								<h4 class="card-blog__title">${test1.cnt }</h4>
								<p>${test1.contents }</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<c:if test="${mvo.cnt<3 && mvo.to==uvo.getCustomerno()}">
				<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
					<div class="card card-blog">
						<div class="card-body">
							<form class="row tracking_form" action="/sob/register" id="re"
								method="post" novalidate="novalidate">
								<div class="col-md-12 form-group">
									<textarea rows="6" class="form-control" placeholder="Contents"
										name="contents"></textarea>
								</div>
								<input type="hidden" name="cnt" value="${mvo.cnt+1}"> <input
									type="hidden" name="categoryid"
									value="${latter[0].categoryid }"> <input type="text"
									name="from" value="${uvo.customerno}" hidden> <input
									type="text" name="labelid" value="${latter[0].labelid}" hidden>
								<div class="col-md-12 form-group text-right">
									<button type="submit" value="submit"
										class="button button-tracking" >등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<div class="row">
			
			<div class="form-group col-md-8">
			<p style="color:#c5322d;">*편지 작성 후, 수정이 불가하고 삭제 시 내 목록에서만 삭제되어 다른 편지 참가자들은 열람이 가능합니다.</p></div>
			<div class="form-group text-center col-md-1">
				<c:if test="${mvo.cnt==3 && mvo.to==uvo.getCustomerno()}">
					<form action="/sob/register" id="re" method="post">
						<input type="text" name="from" value="${latter[0].from}" hidden>
						<input type="text" name="labelid" value="${latter[0].labelid}"
							hidden> <input type="number" name="cnt"
							value="${mvo.cnt+1}" placeholder="${mvo.cnt+1}" hidden>
						<!-- 여기 수정후 아래로 -->
						<input type="button" class="button button-login" onclick="boastSubmit()" value="자랑" >
					</form>
				</c:if>
			</div>
			
			<div class="form-group text-center col-md-1"></div>
			<div class="form-group text-center col-md-1">
				<form action="/sob/remove" method="post">
					<input type="text" name="from" value="${latter[0].from}" hidden>
					<input type="hidden" name="labelid" value="${latter[0].labelid}">
					
					<input type="submit" value="삭제" class="button button-login" style="background:#c5322d; border:0;">
				</form>
			</div>
			
		</div>
		<br>

	</div>
</section>
<!-- ================ Blog section end ================= -->



<%@ include file="../include/footer.jsp"%>
<!-- 풋터를 가져오는 지시어 -->

<script>
function boastSubmit(){
	if(confirm("자랑 후에는 자랑 게시판에서 삭제가 불가능합니다.\n자랑하시겠습니까?")==true){
		document.getElementById("re").submit();
	}else{
		
	}
}
</script>
</body>
</html>