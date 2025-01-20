<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="결제상세내역" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>결제상세페이지</title>
	<!-- Include Bootstrap CSS -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />

	<!-- Font Awesome CDN -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<style>
.card {
    border: none;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
}
.card-header {
    border-top-left-radius: 12px;
    border-top-right-radius: 12px;
    background-color: #c62828;
    color: white;
    padding: 15px 20px;
    font-size: 1.2rem;
}
.card-body {
    padding: 20px;
}
.list-group-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    background-color: #f8f9fa;
}
.list-group-item:nth-child(odd) {
    background-color: #e9ecef;
}
.total-price {
    font-weight: bold;
    font-size: 1.4rem;
    color: #28a745;
    padding-top: 10px;
    padding-bottom: 10px;
}

.text-right {
    margin-top: 20px;
}
.icon {
    margin-right: 10px;
}
</style>
</head>

<body>
    <jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

    <main class="main py-4">
        <div class="container">
            <!-- Shipping Information -->
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-shipping-fast icon"></i> 배송정보
                </div>
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            수령인 : <strong>${member.memberName}</strong>
                        </div>
                        <div class="col-md-6">
                            연락처 : <strong>${member.memberTel}</strong>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-12">
                            주소 : <strong>${pay.ordersAdd1 } ${pay.ordersAdd2 }</strong>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Payment Information -->
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-receipt icon"></i> 결제내역
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            상품금액 : <strong><fmt:formatNumber value="${pay.payTotalPrice}" pattern="#,###"/> 원</strong>
                        </li>
                        <li class="list-group-item">
                            쿠폰할인 : <strong><fmt:formatNumber value="${pay.payCoupon }" pattern="#,###"/> 원</strong>
                        </li>
                        <li class="list-group-item">
                            마일리지 사용 : <strong><fmt:formatNumber value="${pay.payMinus}" pattern="#,###"/> 원</strong>
                        </li>
                        <li class="list-group-item total-price">
                            총 결제 금액 : <strong><fmt:formatNumber value="${pay.payPrice }" pattern="#,###"/> 원</strong>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="text-right d-flex justify-content-end">
                <a href="/hurdles/site/payList.do" class="btn-getstarted me-3">목록으로 돌아가기</a>    
                <a href="/hurdles/site/myPage.do" class="btn-getstarted">마이페이지</a>
            </div>
        </div>
    </main>

    <jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
    <jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>