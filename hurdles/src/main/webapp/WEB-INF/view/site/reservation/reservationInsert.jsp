<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="nav" value="main" scope="request"/>
<c:set var="titleName" value="식당예약하기" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>
<c:set var="now" value="<%=new java.util.Date()%>" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">	
	
	<title>예약페이지</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />	

</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />
	
  	<main class="main">
  	     <div class="container-fluid">
		    <!-- 예약 폼 -->
		    <div class="container mt-5">
		        <h2 class="text-center">식당 예약하기</h2>
		        <form action="/hurdles/site/reservationInsert.do" method="post">
		        	<input type="hidden" name="memberNo" value="${member.memberNo }">
		        	<input type="hidden" name="reserveProductNo" value="${reserveProductNo}">
		            <div class="mb-3">
		                <label for="name" class="form-label">이름</label>
		                <input type="text" class="form-control" id="name" name="name" value="${member.memberName }" placeholder="이름을 입력하세요" required>
		            </div>
		
		            <div class="mb-3">
		                <label for="phone" class="form-label">전화번호</label>
		                <input type="tel" class="form-control" id="phoneNumber" name="phone" value="${member.memberTel }" placeholder="전화번호를 입력하세요" required>
		            </div>
		
		            <div class="mb-3">
		                <label for="date" class="form-label">방문 예약일</label>
		                <input type="date" min="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />" class="form-control" id="date" name="date" required>
		            </div>
		
		            <div class="mb-3">
		            
		                <label for="time" class="form-label">방문 예약 시간</label><br>
		                	<!-- <div class="btn-group" role="group" aria-label="방문 예약 시간"> -->
						  		<input type="radio" class="btn-check" name="group" id="time10" autocomplete="off" onclick="setTime('10:00')" required>
						        <label class="btn btn-outline-danger mx-2" for="time10">10:00</label>
						
						        <input type="radio" class="btn-check" name="group" id="time11" autocomplete="off" onclick="setTime('11:00')">
						        <label class="btn btn-outline-danger mx-2" for="time11">11:00</label>
						
						        <input type="radio" class="btn-check" name="group" id="time12" autocomplete="off" onclick="setTime('12:00')">
						        <label class="btn btn-outline-danger mx-2" for="time12">12:00</label>
						
						        <input type="radio" class="btn-check" name="group" id="time13" autocomplete="off" onclick="setTime('13:00')">
						        <label class="btn btn-outline-danger mx-2" for="time13">13:00</label>
						
						        <input type="radio" class="btn-check" name="group" id="time14" autocomplete="off" onclick="setTime('14:00')">
						        <label class="btn btn-outline-danger mx-2" for="time14">14:00</label>
						
						        <input type="radio" class="btn-check" name="group" id="time15" autocomplete="off" onclick="setTime('15:00')">
						        <label class="btn btn-outline-danger mx-2" for="time15">15:00</label>
						 
						        <input type="radio" class="btn-check" name="group" id="time16" autocomplete="off" onclick="setTime('16:00')">
						        <label class="btn btn-outline-danger mx-2" for="time16">16:00</label>
						
						        <input type="radio" class="btn-check" name="group" id="time17" autocomplete="off" onclick="setTime('17:00')">
						        <label class="btn btn-outline-danger mx-2" for="time17">17:00</label>
						
						        <input type="radio" class="btn-check" name="group" id="time18" autocomplete="off" onclick="setTime('18:00')">
						        <label class="btn btn-outline-danger mx-2" for="time18">18:00</label>
						
						        <input type="radio" class="btn-check" name="group" id="time19" autocomplete="off" onclick="setTime('19:00')">
						        <label class="btn btn-outline-danger mx-2" for="time19">19:00</label>
						
						        <input type="radio" class="btn-check" name="group" id="time20" autocomplete="off" onclick="setTime('20:00')">
						        <label class="btn btn-outline-danger mx-2" for="time20">20:00</label>
						    <!-- </div> -->
						<input type="hidden" class="form-control" id="time" name="time" required>
		              
		            </div>
		
		            <div class="mb-3">
		                <label for="guests" class="form-label">인원 수</label>
		                <input type="number" min="1" class="form-control" id="guests" name="guests" placeholder="인원 수를 입력하세요" required>
		            </div>
		
		            <button type="submit" class="btn-getstarted w-100 mb-3">예약하기</button>
		        </form>
		     </div>   
     	</div>
	</main>
<script>
  function setTime(time) {
    document.getElementById('time').value = time;
  }

</script>


	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>