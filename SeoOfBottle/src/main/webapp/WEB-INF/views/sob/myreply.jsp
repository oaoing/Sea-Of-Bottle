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
					<h1>My Boast</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">My Page</a></li>
              <li class="breadcrumb-item active" aria-current="page">My Reply</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->

<section class="blog_area single-post-area py-80px section-margin--small">
			<div class="container">
					<div class="row">
							<div class="col-lg-8 posts-list">
								<div class="comments-area">
								</div>
								<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">

								<li class="page-item"><a href="#" class="page-link"
									aria-label="Previous"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>

								<li class="page-item"><a href="#" class="page-link">01</a>
								</li>
								<li class="page-item active"><a href="#" class="page-link">02</a>
								</li>
								<li class="page-item"><a href="#" class="page-link">03</a>
								</li>
								<li class="page-item"><a href="#" class="page-link">04</a>
								</li>
								<li class="page-item"><a href="#" class="page-link">09</a>
								</li>

								<li class="page-item"><a href="#" class="page-link"
									aria-label="Next"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-right"></span>
									</span>
								</a></li>
							</ul>
						</nav>
							</div>	
						</div>
					</div>
			</section>

<%@ include file="../include/footer.jsp"%>
	<!-- 풋터를 가져오는 지시어 -->
<script>
	$(document).ready(function() {
		
		removeReply = function(replyno){
			console.log("reply 삭제");
			replyService.remove(replyno, function(result){
				alert(result);
				showMyList();
			});
		}
		
		function showMyList() {
			replyService.getMyList({customerno : '${uvo.customerno}'},function(data) {
				var str = '';
				for (var i = 0, len = data.length || 0; i < len; i++) {
				var head = "<div class='comment-list'><div class='single-comment justify-content-between d-flex'>"
					+ "<div class='user justify-content-between d-flex'><div class='desc'>";
				var body = "<h5><a href='boastdetail?labelid=" + data[i].labelid + "'>" + data[i].reply + "</a></h5>"
						+ "<p class='date'>" + replyService.displayTime(data[i].indate) + "</p>";
				var foot = "</div></div><div class='reply-btn'>"
					+ "<a href='javascript:removeReply(" + data[i].replyno + ");' class='btn-reply text-uppercase'>delete</a></div></div></div>";
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