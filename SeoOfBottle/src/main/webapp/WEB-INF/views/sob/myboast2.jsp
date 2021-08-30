<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>SOB</title>
 <%@include file="../include/header.jsp" %>
<!-- ================ start banner area ================= -->	
  <section class="blog-banner-area" id="blog">
    <div class="container h-100">
      <div class="blog-banner">
        <div class="text-center">
          <h1>My Page</h1>
          <nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="main">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">My Page</li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ end banner area ================= -->
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
                                      ${test.labelid }
                                  </div>
                                  <ul class="blog_meta list">
                                      <li>
                                         ${test.category }
                                      </li>         
                                  </ul>
                              </div>
                          </div>
                          <div class="col-md-9">
                              <div class="blog_post">
                                  <div class="blog_details">
                                      <a href="boastdetail?labelid=${test.labelid }">
                                          <h2>${test.contents }</h2>
                                      </a>
                                      <div class="br"></div>
                                      <a class="button button-blog" href="boastdetail?labelid=${test.labelid }">View More</a>
                                  </div>
                              </div>
                          </div>
                      </article>
					</c:forEach>
                      <nav class="blog-pagination justify-content-center d-flex">
                          <ul class="pagination">
                              <li class="page-item">
                                  <a href="#" class="page-link" aria-label="Previous">
                                      <span aria-hidden="true">
                                          <span class="lnr lnr-chevron-left"></span>
                                      </span>
                                  </a>
                              </li>
                              <li class="page-item">
                                  <a href="#" class="page-link">01</a>
                              </li>
                              <li class="page-item active">
                                  <a href="#" class="page-link">02</a>
                              </li>
                              <li class="page-item">
                                  <a href="#" class="page-link">03</a>
                              </li>
                              <li class="page-item">
                                  <a href="#" class="page-link">04</a>
                              </li>
                              <li class="page-item">
                                  <a href="#" class="page-link">09</a>
                              </li>
                              <li class="page-item">
                                  <a href="#" class="page-link" aria-label="Next">
                                      <span aria-hidden="true">
                                          <span class="lnr lnr-chevron-right"></span>
                                      </span>
                                  </a>
                              </li>
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
                          		<li>
								<a href="/sob/myboast2?categoryid=${temp.categoryid }" class="d-flex justify-content-between">
                                      <p>${temp.category }</p>
                                  </a>
                                  </li>
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

<%@include file="../include/footer.jsp" %>
</body>
</html>