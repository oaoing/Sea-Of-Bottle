<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SOB</title>
<script src="/resources/js/reply.js"></script>
<%@ include file="../include/header.jsp"%>

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
			
		</div>
	</div>
</section>
<!-- ================ Blog section end ================= -->
<!--================Product Description Area =================-->
<section class="product_description_area">
	<div class="container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
				aria-selected="false">Comments</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">
				<div class="row">
					<div class="col-lg-6">
						<div class="comment_list"></div>
					</div>
					<div class="col-lg-6">
						<div class="review_box">
							<h4>Post a comment</h4>
							<form class="row contact_form" action="contact_process.php"
								method="post" id="contactForm" novalidate="novalidate">
								<div class="col-md-12">
									<div class="form-group">
										<textarea class="form-control" id="reply"
											placeholder="λκΈμ μλ ₯νμΈμ" rows="3"></textarea>
									</div>
								</div>
								<div class="col-md-12 text-right">
									<button type="button" value="submit" class="btn primary-btn"
										id="replyRegisterBtn">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================End Product Description Area =================-->

<%-- λκΈ λ--%>

<%@ include file="../include/footer.jsp"%>

<script>
	var thislabelid = '${latter[0].labelid}';
	$(document).ready(function() {
		function showList() {
			replyService.getList({labelid : thislabelid},function(data) {
				var str = '';
				for (var i = 0, len = data.length || 0; i < len; i++) {
				console.log(data[i]);
				str += "<div class='review_item'><div class='media'><div class='media-body'><h4>"
				+ data[i].reply + "</h4><h5>"
				+ replyService.displayTime(data[i].indate) + "</h5></div></div></div>";
				}
				
				$(".comment_list").html(str);
			})
		}
		showList();
		$("#replyRegisterBtn").on("click", function() {
			//λ²νΌ ν΄λ¦­ λμμλ μ€νν  λ΄μ©.
			var reply = {labelid : thislabelid,reply : $("#reply").val(), customerno: ${uvo.customerno}};
			replyService.add(reply);
			console.log("λ¦¬νλ±λ‘");
			alert("λκΈμ΄ λ±λ‘λμμ΅λλ€");
			showList();
			$("#reply").val("");
		})
	})
</script>
</body>
</html>