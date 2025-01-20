<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="마이페이지" scope="request"/>
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
            <div class="container mt-5">
                <!-- 마이페이지 Header -->
                <div class="profile-header text-center text-md-start d-flex flex-column flex-md-row align-items-center mb-4">
                    <img src="/upload/member/${member.filePath}" 
                        onerror="this.src='${pageContext.request.contextPath}/assets/img/undraw_profile.svg'" 
                        class="img-thumbnail rounded-circle mb-3 mb-md-0 profile" 
                        alt="Profile Image"
                        width="120"
                        height="120"
                    >
                    <div class="ms-md-4">
                        <div class="d-flex">
                            <h3 class="me-3">안녕하세요, <span id="nickname">${member.memberName}</span>님!</h3>
                            <c:if test="${member.memberRole == 1}">
                                <a href="${pageContext.request.contextPath}/owner/main.do" class="btn btn-warning">식당 관리하기</a>
                            </c:if>
                        </div>
                        <p class="mb-0">이름: <span id="name">${member.memberName}</span></p>
                        <p>생년월일: <span id="dob">${fn:substring(member.memberBir, 0, 10)}</span></p>
                        <div class="profile-stats d-flex gap-3 justify-content-center justify-content-md-start">
                            <a href="followDetail.do?memberNo=${member.memberNo}" id="followCount" class="text-dark" ><span><i class="bi bi-person-heart"></i> 팔로우: ${member.followCnt}</span></a>
                            <a href="followerDetail.do?memberNo=${member.memberNo}" id="followerCount" class="text-dark" ><span><i class="bi bi-people-fill"></i> 팔로워: ${member.followingCnt}</span></a>
                        </div>
                    </div>
                    
                </div>

                <hr>

                <!-- 마일리지, 등급, 리뷰 수 -->
                <div class="row mt-4 mb-4">
                    <div class="col-md-4 text-center">
                        <div class="card card-hover shadow-sm">
                            <div class="card-body">
                                <h6>마일리지</h6>
                                <p>
                                    <strong><fmt:formatNumber value="${member.memberMileage}" pattern="#,###"/></strong> 점
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="card card-hover shadow-sm">
                            <div class="card-body">
                                <h6>등급</h6>
                                <p><strong>${member.gradeName}</strong></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="card card-hover shadow-sm">
                            <div class="card-body">
                                <h6>장바구니</h6>
                                <p>
                                    <strong><fmt:formatNumber value="${member.cartCnt}" pattern="#,###"/></strong> 개
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <hr>

                <!-- 주요 기능 -->
                <div class="row mt-4 g-3">
                    <!-- 회원 정보 -->
                    <div class="col-md-4">
                        <div class="card card-hover shadow-sm border-0 text-center">
                            <div class="card-body">
                                <h5 class="card-title">회원 정보</h5>
                                <p class="card-text text-muted">회원 정보를 수정 할 수 있습니다.</p>
                                <a href="myPageUpdate.do" class="btn btn-outline-primary w-100">
                                    회원정보수정
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- 장바구니 내역 -->
                    <div class="col-md-4">
                        <div class="card card-hover shadow-sm border-0 text-center">
                            <div class="card-body">
                                <h5 class="card-title">장바구니 내역</h5>
                                <p class="card-text text-muted">장바구니 내역을 확인하세요.</p>
                                <a href="cartList.do" class="btn btn-outline-primary w-100">
                                    장바구니 
                                    <span class="badge text-bg-secondary"><fmt:formatNumber value="${member.cartCnt}" pattern="#,###"/></span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- 활동 내역 -->
                    <div class="col-md-4">
                        <div class="card card-hover shadow-sm border-0 text-center">
                            <div class="card-body">
                                <h5 class="card-title">찜한 식당 내역</h5>
                                <p class="card-text text-muted">찜한 식당 내역을 확인하세요.</p>
                                <a href="pickRestaurantList.do?memberNo=${member.memberNo}" class="btn btn-outline-primary w-100">
                                    찜한식당 <span class="badge text-bg-secondary">${member.pickCnt}</span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- 추가 정보 -->
                    <div class="col-md-4">
                        <div class="card card-hover shadow-sm border-0 text-center">
                            <div class="card-body">
                                <h5 class="card-title">예약 내역</h5>
                                <p class="card-text text-muted">예약 내역을 확인하세요.</p>
                                <a href="reservationList.do" class="btn btn-outline-primary w-100">
                                    예약내역 <span class="badge text-bg-secondary">${member.reservationCnt}</span>
                                </a> 
                            </div>
                        </div>
                    </div>

                    <!-- 추가 정보 -->
                    <div class="col-md-4">
                        <div class="card card-hover shadow-sm border-0 text-center">
                            <div class="card-body">
                                <h5 class="card-title">결제 내역</h5>
                                <p class="card-text text-muted">결제 내역을 확인하세요.</p>
                                <a href="payList.do" class="btn btn-outline-primary w-100">
                                    결제내역
                                    <%-- <span class="badge text-bg-secondary">${member.reservationCnt}</span> --%>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- 추가 정보 -->
                    <div class="col-md-4">
                        <div class="card card-hover shadow-sm border-0 text-center">
                            <div class="card-body">
                                <h5 class="card-title">마일리지 내역</h5>
                                <p class="card-text text-muted">마일리지 내역을 확인하세요.</p>
                                <a href="mileageList.do?memberNo=${member.memberNo}" class="btn btn-outline-primary w-100">
                                    마일리지내역
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 추가 정보 -->
                    <div class="col-md-4">
                        <div class="card card-hover shadow-sm border-0 text-center">
                            <div class="card-body">
                                <h5 class="card-title">리뷰 내역</h5>
                                <p class="card-text text-muted">리뷰 내역을 확인하세요.</p>
                                <a href="reviewList.do?memberNo=${member.memberNo}" class="btn btn-outline-primary w-100">
                                    리뷰조회 <span class="badge text-bg-secondary">${member.reviewCnt}</span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- 추가 정보 -->
                    <div class="col-md-4">
                        <div class="card card-hover shadow-sm border-0 text-center">
                            <div class="card-body">
                                <h5 class="card-title">쿠폰 내역</h5>
                                <p class="card-text text-muted">쿠폰 내역을 확인하세요.</p>
                                <a href="couponIssuedList.do?memberNo=${member.memberNo}" class="btn btn-outline-primary w-100">
                                    쿠폰조회 <span class="badge text-bg-secondary">${member.couponCnt}</span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- 추가 정보 -->
                    <div class="col-md-4">
                        <div class="card card-hover shadow-sm border-0 text-center">
                            <div class="card-body">
                                <h5 class="card-title">문의 내역</h5>
                                <p class="card-text text-muted">문의 내역을 확인하세요.</p>
                                <a href="questionList.do" class="btn btn-outline-primary w-100">
                                    문의내역 <span class="badge text-bg-secondary">${member.questionCnt}</span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- 추가 정보 -->
                    <div class="col-md-4">
                        <div class="card card-hover shadow-sm border-0 text-center">
                            <div class="card-body">
                                <h5 class="card-title">회원탈퇴</h5>
                                <p class="card-text text-muted">회원 탈퇴를 진행할 수 있습니다.</p>
                                <a href="${pageContext.request.contextPath}/auth/cancelMember.do" class="btn btn-outline-danger w-100">
                                    회원탈퇴
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     	</div>
	</main>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>