<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="nav" value="restaurant" scope="request"/>
<c:set var="titleName" value="예약내역상세" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>예약내역상세조회</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
	
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid">
		 	<div class="card mb-4">
  	     		<div class="card-body">
	  	     		<div class="mb-3 border-bottom">
	  	     			<h4 class="mb-3">예약내역 상세</h4>
	  	     		</div>
  	     			<div class="row mb-3">
  	     				<div class="col-md-4 font-weight-bold">식당 이름 :</div>
  	     				<div class="col-md-8">${reservation.restaurantName}</div>
  	     			</div>
  	     			<div class="row mb-3">
  	     				<div class="col-md-4 font-weight-bold">식당 주소 :</div>
  	     				<div class="col-md-8">${reservation.addr}</div>
  	     			</div>
  	     			<div class="row mb-3">
  	     				<div class="col-md-4 font-weight-bold">식당 전화번호 :</div>
  	     				<div class="col-md-8">${reservation.restaurantTel}</div>
  	     			</div>
  	     			<div class="row mb-3">
  	     				<div class="col-md-4 font-weight-bold">예약 메뉴 :</div>
  	     				<div class="col-md-8">${reservation.reserveProductName}</div>
  	     			</div>
  	     			<div class="row mb-3">
  	     				<div class="col-md-4 font-weight-bold">방문 예약일 :</div>
  	     				<div class="col-md-8">
  	     					<fmt:parseDate value="${reservation.reserveDate}" pattern="yyyy-MM-dd" var="parseDateTime" type="both" />
                            <strong><fmt:formatDate value="${parseDateTime}" pattern="yyyy-MM-dd" /></strong>
  	     				</div>
  	     			</div>
  	     			<div class="row mb-3">
  	     				<div class="col-md-4 font-weight-bold">방문 예약시간 :</div>
  	     				<div class="col-md-8">${reservation.reserveTime}</div>
  	     			</div>
  	     			<div class="row mb-3">
  	     				<div class="col-md-4 font-weight-bold">인원 수 :</div>
  	     				<div class="col-md-8">${reservation.guests}명</div>
  	     			</div>
  	     			
	  	     		<div class="text-right d-flex text-end justify-content-end">
	  	     			<a href="/hurdles/site/reservationList.do" class="btn-getstarted me-3">목록으로 돌아가기</a>
	  	     			<form action="/hurdles/site/reservationDelete.do" method="post" onsubmit="return confirmCancle()">
	  	     				<input type="hidden" name="reservationNo" value="${reservation.reservationNo}">	
	  	     				<input type="submit" value="예약취소" class="btn-getstarted">
	  	     			</form>
	  	     		</div>
  	     		</div>
  	     	</div>
     	</div>
	</main>

<script>
function confirmCancle(){
	return confirm("정말로 예약을 취소하시겠습니까?");
}
</script>


	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
	
	 <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
