<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="restaurant" scope="request"/>
<c:set var="titleName" value="예약정보확인" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>예약정보확인</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
	
<style>
body {
	background-color: #f9f9f9; /* Light background color */
	font-family: 'Arial', sans-serif;
	color: #333;
}
.card {
	border-radius: 20px; /* Rounded corners */
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Soft shadow */
	background-color: #ffffff;
    border: none;
    
}
.card-body {
	padding: 2rem; /* Extra padding */
}
.card-title {
	font-size: 1.6rem;
	font-weight: 600;
	color: #007bff;
	text-align: center;
	margin-bottom: 1.5rem;
}
.card-text {
	font-size: 1.2rem;
	color: #555;
	line-height: 1.8;
}
#button{
	font-size: 1.1rem;
	padding: 12px 30px;
	text-decoration: none;
	display: block;
	width: 220px;
	text-align: center;
	margin: 20px auto;
}

h2 {
	font-size: 2rem;
	font-weight: 700;
	color: #333;
	margin-bottom: 30px;
}
.main {
	padding-top: 60px;
	padding-bottom: 60px;
}
.container {
	max-width: 900px;
}

</style>	
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid">
		 
		    <div class="row justify-content-center">
                <div class="col-lg-6 col-md-10 col-12">
                    <h2 class="text-center">예약 정보 확인</h2>
                    <div class="card mt-4">
                        <div class="card-body">
                            <h5 class="card-title ">예약이 완료되었습니다</h5>
                            <p class="card-text">
                            이름 : <strong>${reservation.memberName}</strong><br>
		                    전화번호 : <strong>${reservation.memberTel }</strong><br>
		                    예약 날짜 : <strong>${reservation.reserveDate }</strong><br>
		                    예약 시간 : <strong>${reservation.reserveTime }</strong><br>
		                    인원 수 : <strong>${reservation.guests } 명</strong><br>
                            </p>
                            <a href="/hurdles/site/myPage.do" id="button" class="btn-getstarted">마이페이지</a>
                        </div>
                    </div>
                </div>
            </div>
		
     	</div>
	</main>

			<!-- Bootstrap JS -->
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>