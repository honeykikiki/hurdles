<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="결제내역" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>결제내역 페이지</title>
    <jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
    
</head>

<body>
    <jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

    <main class="main">
        <div class="container-fluid py-5">
            <h2 class="text-center mb-4">결제 내역</h2>
        	<c:if test="${not empty payList}">

            <div class="row">
                <c:forEach var="pay" items="${payList}">
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">식당 : <strong>${pay.restaurantName}</strong></h5>
                                <p class="card-text">
                                	상품명 : <strong>${pay.productName}</strong><br>
                                    결제일 : <strong>${pay.createDate}</strong> <br>
                                    결제금액 : <strong><fmt:formatNumber value="${pay.payPrice}" pattern="#,###"/>원</strong> <br>
                                    
                                </p>
                                <a href="/hurdles/site/payDetail.do?ordersNo=${pay.ordersNo}" class="btn-getstarted">주문 상세보기</a>
                            	<a href="/hurdles/site/question.do?restaurantNo=${pay.restaurantNo}" class="btn-getstarted">문의하기</a>
                            	<a href="reviewInsert.do?restaurantNo=${pay.restaurantNo}&ordersNo=${pay.ordersNo}" class="btn-getstarted w-100">리뷰쓰기</a>
                            	
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            </c:if>
            
            <c:if test="${empty payList}">
            	<div class="alert alert-info text-center">
                	<strong>결제 내역이 없습니다.</strong>
            	</div>
       	    </c:if>

            <div class="card-footer text-center"><a class="btn btn-light" href="${pageContext.request.contextPath}/site/myPage.do">마이페이지</a></div>
            
        </div>
    </main>

    <jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
    <jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>