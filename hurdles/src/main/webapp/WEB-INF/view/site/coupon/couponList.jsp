<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="쿠폰" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>${titleName}</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid">

		 <%-- <p class="mt-4">
            총 <strong class="h5 number">${paging.getTotalRecordCount()}</strong>개
        </p> --%>

        <div id="coupon-list" class="mb-4 row">
            <h2>사용 가능한 쿠폰</h2>
            <c:forEach items="${couponList}" var="coupon">
                <div class="col-3 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5>${coupon.restaurantName} - ${coupon.couponName}</h5>
                            <p>${coupon.couponDes}</p>
                            <p class="mb-0">
                                <strong>쿠폰 기간</strong> 
                                ${fn:substring(coupon.startDate, 0, 10)} ~ ${fn:substring(coupon.endDate, 0, 10)}
                            </p>
                            <p class="pb-0 mb-0">금액 : <fmt:formatNumber value="${coupon.couponPrice}" pattern="#,###"/>원</p>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${couponList.size() == 0}" >
                <div class="alert alert-secondary text-center">
                    <strong>사용 가능한 쿠폰 정보가 없습니다.</strong>
                </div>
            </c:if>
        </div>

        <div id="coupon-list" class="mb-4 row">
            <h2>사용한 쿠폰</h2>
            <c:forEach items="${usedList}" var="usedcoupon">
                <div class="col-3 mb-4">
                    <div class="card bg-body-tertiary">
                        <div class="card-body">
                            <h5>${usedcoupon.restaurantName} - ${usedcoupon.couponName}</h5>
                            <p>${usedcoupon.couponDes}</p>
                            <p class="mb-0">
                                <strong>쿠폰 기간</strong> 
                                ${fn:substring(usedcoupon.startDate, 0, 10)} ~ ${fn:substring(usedcoupon.endDate, 0, 10)}
                            </p>
                            <p class="pb-0 mb-0">금액 : <fmt:formatNumber value="${usedcoupon.couponPrice}" pattern="#,###"/>원</p>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${usedList.size() == 0}" >
                <div class="alert alert-secondary text-center">
                    <strong>사용한 쿠폰 정보가 없습니다.</strong>
                </div>
            </c:if>
        </div>

        <button type="button" class="btn btn-outline-dark" onclick="javasript:history.back();"> 뒤로가기</button>

<%-- 
        <page-navi 
            url="couponIssuedList.do?${pagingOption}"
            current="${paging.getPageNo()}" 
            total="${paging.getTotalPageCount()}"/> --%>
     	</div>
	</main>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>