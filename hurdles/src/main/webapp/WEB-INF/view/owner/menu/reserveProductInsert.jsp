<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<c:set var="nav" value="restaurant" scope="request"/>
<c:set var="titleName" value="${restaurantName} -  예약메뉴 추가" scope="request"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>사장님 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/owner/layout/prestyle.jsp" />
</head>

<body>
    <jsp:include page="/WEB-INF/view/owner/layout/header.jsp" />
    
    <div class="container-fluid">
      <div class="bg-white rounded p-3 m-2">
				<form action="reserveProductInsert.do" class="needs-validation"  method="post" enctype="multipart/form-data" novalidate>
				  <div class="mt-3">
              <input type="hidden" name="restaurantName" value="${restaurantName}">
              <input type="hidden" name="restaurantNo" value="${restaurantNo}"
							>
  						<div class="mb-4">
  							<label for="reserveProductName" class="form-label">예약메뉴 이름</label>
  							<input id="reserveProductName" name="reserveProductName" type="text" class="form-control" required="required" value="">
  							<div class="invalid-feedback">예약메뉴 이름을 입력해주세요</div>
  						</div>
  
  						<div class="mb-4">
  							<label for="reserveProductDes" class="form-label">예약메뉴 설명</label>
  							<textarea id="reserveProductDes" name="reserveProductDes" class="form-control" required="required"></textarea>
  							<div class="invalid-feedback">예약메뉴 설명을 입력해주세요</div>
  						</div>
  
  						<div class="mb-4">
  							<label for="reserveProductCount" class="form-label">예약 인원수</label>
  							<input id="reserveProductCount" name="reserveProductCount" type="number" class="form-control" required="required" value="">
  							<div class="invalid-feedback">예약인원수를 입력해주세요</div>
  						</div>
  									
  						<!-- 단일 파일 -->
              <file-upload name="filename" label="예약메뉴 이미지" max-files="1" contextPath="${pageContext.request.contextPath  }"></file-upload>

              <button type="button" class="btn btn-outline-dark" onclick="javasript:history.back();"> 뒤로가기</button>
              <button class="btn btn-primary" type="submit">저장</button>
  				</div>
				</form>
		</div>

	<jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>


</html>