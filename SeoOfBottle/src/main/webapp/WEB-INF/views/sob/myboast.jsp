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

<!--================Blog Area =================-->
<section class="blog_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog_left_sidebar">
					<div class="billing_details">
					<br>
					<h3>My Boast</h3></div>
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
														href="/sob/myboast?categoryid=${temp.categoryid }">${temp.category },</a>
												</c:if>
												<c:if test="${i.last}">
													<a class="active"
														href="/sob/myboast?categoryid=${temp.categoryid }">${temp.category }</a>
												</c:if>
											</c:if>
											<c:if test="${testcategory ne tempcategory}">
												<c:if test="${!i.last}">
													<a href="/sob/myboast?categoryid=${temp.categoryid }">${temp.category },</a>
												</c:if>
												<c:if test="${i.last}">
													<a href="/sob/myboast?categoryid=${temp.categoryid }">${temp.category }</a>
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
									href="myboast?pageNum=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}&replyPage=${replyPage}"
									class="page-link" aria-label="Previous"> <span
										aria-hidden="true"> <span class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<c:if test="${pageMaker.cri.pageNum == num }">
									<li class="page-item active"><a
										href="myboast?pageNum=${num}&amount=${pageMaker.cri.amount}&replyPage=${replyPage}"
										class="page-link">${num}</a></li>
								</c:if>
								<c:if test="${pageMaker.cri.pageNum != num }">
									<li class="page-item"><a
										href="myboast?pageNum=${num}&amount=${pageMaker.cri.amount}&replyPage=${replyPage}"
										class="page-link">${num}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="page-item"><a
									href="myboast?pageNum=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}&replyPage=${replyPage}"
									class="page-link" aria-label="Next"> <span
										aria-hidden="true"> <span class="lnr lnr-chevron-right"></span>
									</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
					<br>
					<div class="billing_details">
					<h3>My Reply</h3></div>
					<div class="comments-area"></div>
					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination" id="replyPage">

							
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<button class="button button-login w-100" style="background:#c5322d; border:0;" onclick='guestCheck();'>?????? ??????</button>
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget post_category_widget">
						<h4 class="widget_title">Catgories</h4>
						<ul class="list cat-list">
							<c:forEach items="${categoryList}" var="temp">
								<li><a href="myboast?categoryid=${temp.categoryid }"
									class="d-flex justify-content-between">
										<p>${temp.category }</p>
								</a></li>
							</c:forEach>
						</ul>
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget search_widget">
						<button class="button button-login w-100" style="background:black; border:0;" onclick='location.href="https://github.com/oaoing/Sea-Of-Bottle"'>GitHub about SOB</button>
						<div class="br"></div>
					</aside>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================Blog Area =================-->


<%@ include file="../include/footer.jsp"%>
<!-- ????????? ???????????? ????????? -->

<script>
	$(document).ready(function() {
						removeReply = function(replyno) {
							console.log("reply ??????");
							replyService.remove(replyno, function(result) {
								alert(result);
								var pageNum = (!'${num}')?1:'${num}';
								location.replace('/sob/myboast?pageNum=' + pageNum + '&amount=${pageMaker.cri.amount}');
							});
						}
						
						makeReplyPage = function(totalCount){
							var endPage = Math.ceil(${replyPage}/10)*10;
							var startPage = endPage - 9;
							var realEnd = Math.ceil(totalCount/10);
							if (realEnd < endPage){
								endPage = realEnd;
							}
							var prev = startPage > 1;
							var next = endPage < realEnd;
							
							var str = '';
							var pageNum = (!'${num}')?1:'${num}';
							(startPage == 1)?str+='':str+='<li class="page-item"><a href="myboast?pageNum=' + pageNum + '&amount=${pageMaker.cri.amount}&replyPage='
									+ ${replyPage} - 1 + '" class="page-link" aria-label="Previous">'
                            							+ '<span aria-hidden="true"><span class="lnr lnr-chevron-left"></span></span></a></li>'; 
                            for(var i=0 ; i < 10; i++){
                            	var p = startPage + i;
                            	if (p > endPage) 
                            		break;
                            	if (p == ${replyPage}){
                            		str += '<li class="page-item active"><a href="myboast?pageNum=' + pageNum + '&amount=${pageMaker.cri.amount}&replyPage='
                            			+ p + '" class="page-link">' + p + '</a></li>';
                            	}else{
                            		str += '<li class="page-item"><a href="myboast?pageNum=' + pageNum + '&amount=${pageMaker.cri.amount}&replyPage='
                            			+ p + '" class="page-link">' + p + '</a></li>';
                            	}
                            	
                            }
                            
                            (endPage < realEnd)?str+='<li class="page-item"><a href="myboast?pageNum=' + pageNum + '&amount=${pageMaker.cri.amount}&replyPage='
									+ ${replyPage} + 1 + '" class="page-link" aria-label="Next">'
    								+ '<span aria-hidden="true"><span class="lnr lnr-chevron-left"></span></span></a></li>':str+='';
                            $("#replyPage").html(str);
						}

						function showMyList() {
							replyService.getMyList({customerno : '${uvo.customerno}', page : '${replyPage}'},function(data) {
												var str = '';
												var replyList = data.rvo;
												for (var i = 0, len = replyList.length || 0; i < len; i++) {
													var head = "<div class='comment-list'><div class='single-comment justify-content-between d-flex'>"
															+ "<div class='user justify-content-between d-flex'><div class='desc'>";
													var body = "<h5><a href='boastdetail?labelid="
															+ replyList[i].labelid
															+ "'>"
															+ replyList[i].reply
															+ "</a></h5>"
															+ "<p class='date'>"
															+ replyService
																	.displayTime(replyList[i].indate)
															+ "</p>";
													var foot = "</div></div><div class='reply-btn'>"
															+ "<a href='javascript:removeReply("
															+ replyList[i].replyno
															+ ");' class='btn-reply text-uppercase'>delete</a></div></div></div>";
													str += head + body + foot;
												}
												$(".comments-area").html(str);
												makeReplyPage(data.totalCount);
											})
						}
						showMyList();
					
						guestCheck = function(){
							if(${uvo.customerno} == 16){
								alert("????????? ???????????? ??????????????? ????????? ?????????.");
							}else{
								signOut("/delete");
							}
						}
					});
</script>
</body>
</html>