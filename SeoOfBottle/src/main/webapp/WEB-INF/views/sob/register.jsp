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

<!--================Checkout Area =================-->
  <section class="checkout_area section-margin--small">
    <div class="container">
        <div class="billing_details">
            <div class="row">
                <div class="col-lg-8">
                    <h3>New Letter</h3>
                    <form class="row contact_form" action="/sob/register" id="re" method="post" novalidate="novalidate">
                    	<input type="text" name="from" value="${uvo.customerno}" hidden>
                    	<input type="number" name="cnt" value="1" placeholder="1" hidden>
                        <div class="col-md-12 form-group p_star">
                            <select class="country_select" form="re" name="categoryid">
                            <c:forEach items="${categoryList}" var="temp">
								<option value="${temp.categoryid }" >${temp.category }</option>
							</c:forEach>
                            </select>
                        </div>
                        <div class="col-md-12 form-group mb-10">
                            <textarea class="form-control" name="contents" rows="1" placeholder="Content"></textarea>
                        </div>
                        <div class="col-md-12 form-group mb-0">
                        <p style="color:#c5322d;">*편지 작성 후, 수정이 불가하고 내 목록에서 삭제되어 다른 편지 참가자들은 열람이 가능합니다.</p>
                        </div>
                        <div class="col-md-12 form-group mb-0">
                        	<button class="button button-coupon" type="submit" value="등록">등록</button>
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->


<%@ include file="../include/footer.jsp"%>
<!-- 풋터를 가져오는 지시어 -->
</body>
</html>