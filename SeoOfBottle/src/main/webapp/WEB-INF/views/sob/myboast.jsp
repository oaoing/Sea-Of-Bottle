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

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="blog">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>My Page</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">My
							Page</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->

<!--================Blog Area =================-->
<section class="blog_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog_left_sidebar">

					<c:forEach items="${myList}" var="test">
						<article class="row blog_item">
							<div class="col-md-3">
								<div class="blog_info text-right">

									<div class="post_tag">
										<c:forEach items="${categoryList}" var="temp" varStatus="i">
											<c:set var="testcategory" value="${test.categoryid}" />
											<c:set var="tempcategory" value="${temp.categoryid}" />
											<c:if test="${testcategory eq tempcategory}">
												<c:if test="${!i.last}">
													<a class="active"
														href="/sob/myboast2?categoryid=${temp.categoryid }">${temp.category },</a>
												</c:if>
												<c:if test="${i.last}">
													<a class="active"
														href="/sob/myboast2?categoryid=${temp.categoryid }">${temp.category }</a>
												</c:if>
											</c:if>
											<c:if test="${testcategory ne tempcategory}">
												<c:if test="${!i.last}">
													<a href="/sob/myboast2?categoryid=${temp.categoryid }">${temp.category },</a>
												</c:if>
												<c:if test="${i.last}">
													<a href="/sob/myboast2?categoryid=${temp.categoryid }">${temp.category }</a>
												</c:if>
											</c:if>
										</c:forEach>
									</div>
									<ul class="blog_meta list">
										<li>병 번호 : ${test.labelid }<i class="lnr lnr-user"></i>
										</li>
									</ul>

								</div>
							</div>
							<div class="col-md-9">
								<div class="blog_post">
									<div class="blog_details">
										<p>${test.contents}</p>
										<a class="button button-blog"
											href="boastdetail?labelid=${test.labelid }">View More</a>
									</div>
								</div>
							</div>
						</article>
					</c:forEach>

					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="page-item"><a
									href="myboast?pageNum=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}"
									class="page-link" aria-label="Previous"> <span
										aria-hidden="true"> <span class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<c:if test="${pageMaker.cri.pageNum == num }">
									<li class="page-item active"><a
										href="myboast?pageNum=${num}&amount=${pageMaker.cri.amount}"
										class="page-link">${num}</a></li>
								</c:if>
								<c:if test="${pageMaker.cri.pageNum != num }">
									<li class="page-item"><a
										href="myboast?pageNum=${num}&amount=${pageMaker.cri.amount}"
										class="page-link">${num}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="page-item"><a
									href="myboast?pageNum=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}"
									class="page-link" aria-label="Next"> <span
										aria-hidden="true"> <span class="lnr lnr-chevron-right"></span>
									</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
					<div class="comments-area"></div>
					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">

							<li class="page-item"><a href="#" class="page-link"
								aria-label="Previous"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-left"></span>
								</span>
							</a></li>

							<li class="page-item"><a href="#" class="page-link">01</a></li>
							<li class="page-item active"><a href="#" class="page-link">02</a>
							</li>
							<li class="page-item"><a href="#" class="page-link">03</a></li>
							<li class="page-item"><a href="#" class="page-link">04</a></li>
							<li class="page-item"><a href="#" class="page-link">09</a></li>

							<li class="page-item"><a href="#" class="page-link"
								aria-label="Next"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-right"></span>
								</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget post_category_widget">
						<h4 class="widget_title">Catgories</h4>
						<ul class="list cat-list">
							<c:forEach items="${categoryList}" var="temp">
								<li><a href="myboast2?categoryid=${temp.categoryid }"
									class="d-flex justify-content-between">
										<p>${temp.category }</p>
								</a></li>
							</c:forEach>
						</ul>
						<div class="br"></div>
					</aside>

				</div>
			</div>
		</div>
	</div>
</section>
<!--================Blog Area =================-->


<%@ include file="../include/footer.jsp"%>
<!-- 풋터를 가져오는 지시어 -->

<script>
	$(document)
			.ready(
					function() {

						removeReply = function(replyno) {
							console.log("reply 삭제");
							replyService.remove(replyno, function(result) {
								alert(result);
								showMyList();
							});
						}

						function showMyList() {
							replyService
									.getMyList(
											{
												customerno : '${uvo.customerno}'
											},
											function(data) {
												var str = '';
												for (var i = 0, len = data.length || 0; i < len; i++) {
													var head = "<div class='comment-list'><div class='single-comment justify-content-between d-flex'>"
															+ "<div class='user justify-content-between d-flex'><div class='desc'>";
													var body = "<h5><a href='boastdetail?labelid="
															+ data[i].labelid
															+ "'>"
															+ data[i].reply
															+ "</a></h5>"
															+ "<p class='date'>"
															+ replyService
																	.displayTime(data[i].indate)
															+ "</p>";
													var foot = "</div></div><div class='reply-btn'>"
															+ "<a href='javascript:removeReply("
															+ data[i].replyno
															+ ");' class='btn-reply text-uppercase'>delete</a></div></div></div>";
													str += head + body + foot;
												}
												$(".comments-area").html(str);
											})
						}
						showMyList();

					});
</script>
</body>
</html>