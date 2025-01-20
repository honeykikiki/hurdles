<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="예약내역" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>예약리스트조회</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
	<!-- Add Bootstrap CSS if not already included -->
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid">
		    <h2 class="text-center mb-4">예약 내역</h2>
		    <c:if test="${not empty reservationList}">
		 	<div class="row">
                <!-- Loop through each reservation and display it in a Bootstrap card -->
                <c:forEach var="reservation" items="${reservationList}">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">식당이름 : <strong>${reservation.restaurantName}</strong></h5>
                                <p class="card-text">
                                    식당 전화번호 : <strong>${reservation.restaurantTel}</strong> <br>
                                    방문 예약일 :
                                    <fmt:parseDate value="${reservation.reserveDate}" pattern="yyyy-MM-dd" var="parseDateTime" type="both" />
                                    <strong><fmt:formatDate value="${parseDateTime}" pattern="yyyy-MM-dd" /></strong><br>
                                    방문 예약시간 : <strong>${reservation.reserveTime}</strong><br>
                                    인원 수 : <strong>${reservation.guests}</strong>명<br>
                                </p>
                                <a href="/hurdles/site/reservationDetail.do?reservationNo=${reservation.reservationNo}" class="btn-getstarted">자세히 보기</a>
                                <a href="/hurdles/site/question.do?restaurantNo=${reservation.restaurantNo}" class="btn-getstarted">문의하기</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
		 
		 	</c:if>
		 	
		 	<c:if test="${empty reservationList}">
            	<div class="alert alert-info text-center">
                	<strong>예약 내역이 없습니다.</strong>
            	</div>
       	    </c:if>
		 	<div class="card-footer text-center"><a class="btn btn-light" href="${pageContext.request.contextPath}/site/myPage.do">마이페이지</a></div>
     	</div>
	</main>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
	<!-- Add Bootstrap JS if not already included -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>