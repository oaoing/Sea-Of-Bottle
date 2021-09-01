<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl날짜 -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SOB</title>
<%@ include file="../include/header.jsp"%>
<!-- 헤더를 가져오는 지시어 -->


<!-- ================ start banner area ================= -->
<section class="blog-banner-area layer-set" id="blog" style="background-image:url('/resources/img/banner-bg.png'); background-size:auto 100%;">
	<div class="blog-banner">
		<div class="text-center h-100 layer-set layer1"><img src="/resources/img/bottle.png" style="height:103px; width:90px; margin-top:30px;"></img></div>
	</div>
	<div class="slide layer-set layer2"><ul>
	<li><img src="/resources/img/banner-wave.png"></li>
	<li><img src="/resources/img/banner-wave.png"></li>
	</ul></div>
	<!-- <section class="blog-banner-area" id="blog" style="background-image:url('/resources/img/banner-wave.png'); background-size:auto 100%;"></div> -->
	
</section>
<!-- ================ end banner area ================= -->

<!--================Blog Area =================-->
<section class="blog_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog_left_sidebar">
					<div class="billing_details">
					<br>
					<h3>Receive List</h3></div>
					<c:forEach items="${list}" var="test">
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
															href="/sob/main?categoryid=${temp.categoryid }">${temp.category },</a>
													</c:if>
													<c:if test="${i.last}">
														<a class="active"
															href="/sob/main?categoryid=${temp.categoryid }">${temp.category }</a>
													</c:if>
												</c:if>
												<c:if test="${testcategory ne tempcategory}">
													<c:if test="${!i.last}">
														<a href="/sob/main?categoryid=${temp.categoryid }">${temp.category },</a>
													</c:if>
													<c:if test="${i.last}">
														<a href="/sob/main?categoryid=${temp.categoryid }">${temp.category }</a>
													</c:if>
												</c:if>
										
										</c:forEach>
									</div>
									<ul class="blog_meta list">
										<li><i class="fas fa-wine-bottle"></i>  ${test.labelid }
										</li>
									</ul>


								</div>
							</div>
							<div class="col-md-9">
								<div class="blog_post">
									<div class="blog_details">
										<p>${test.contents}</p>
										<c:if test="${test.cnt == 3}">
										<a class="button button-blog"
											href="get?labelid=${test.labelid }" style="background:#E1FBD7; border:0;">View More</a>
										</c:if>
										
										<c:if test="${test.cnt != 3}">
										<a class="button button-blog"
											href="get?labelid=${test.labelid }" style="background:#FFF7CC; border:0;">View More</a>
										</c:if>
										
									</div>
								</div>
							</div>
						</article>
					</c:forEach>

					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li class="page-item"><a
									href="main?pageNum=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}"
									class="page-link" aria-label="Previous"> <span
										aria-hidden="true"> <span class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<c:if test="${pageMaker.cri.pageNum == num }">
									<li class="page-item active"><a
										href="main?pageNum=${num}&amount=${pageMaker.cri.amount}"
										class="page-link">${num}</a></li>
								</c:if>
								<c:if test="${pageMaker.cri.pageNum != num }">
									<li class="page-item"><a
										href="main?pageNum=${num}&amount=${pageMaker.cri.amount}"
										class="page-link">${num}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="page-item"><a
									href="main?pageNum=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}"
									class="page-link" aria-label="Next"> <span
										aria-hidden="true"> <span class="lnr lnr-chevron-right"></span>
									</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
							<button class="button button-login w-100" onclick='location.replace("/sob/register");'>New Letter</button>
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget post_category_widget">
						<h4 class="widget_title">Catgories</h4>
						<ul class="list cat-list">
							<c:forEach items="${categoryList}" var="temp">
								<li><a href="main?categoryid=${temp.categoryid }"
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
</body>
</html>