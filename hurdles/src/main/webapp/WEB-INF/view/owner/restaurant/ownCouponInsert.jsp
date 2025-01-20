<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="main" scope="request"/>
<c:set var="titleName" value="메인" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>사장님 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/owner/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/owner/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">
		<form action="ownCouponInsert.do" method="post">
				
  				<input type="hidden" name="restaurantNo" value="${restaurantNo }">
				
				<div class="mb-3">
   					 <label for="name" class="form-label">쿠폰이름</label>
  						<input type="text" class="form-control" id="couponName" name="couponName" placeholder="쿠폰 이름을 입력하세요" required>
				</div>
				
				<div class="mb-3">
   					 <label for="name" class="form-label">쿠폰 설명</label>
  						<input type="text" class="form-control" id="couponDes" name="couponDes" placeholder="쿠폰 설명을 입력하세요" required>
				</div>
			
				<div class="mb-3">
   					 <label for="name" class="form-label">할인 가격</label>
  						<input type="text" class="form-control" id="couponPrice" name="couponPrice" placeholder="할인 가격을 입력하세요" required>
				</div>
			
				<div class="mb-3">
					    <label for="startDate" class="form-label">쿠폰 시작일</label>
    					<input type="date" class="form-control" id="startDate" name="startDate" 
           				placeholder="쿠폰 사용 시작일을 입력하세요 (YYYY-MM-DD)" 
           				pattern="\d{4}-\d{2}-\d{2}" 
           			title="날짜 형식은 YYYY-MM-DD여야 합니다." required>
				</div>
			
				<div class="mb-3">
    				<label for="endDate" class="form-label">쿠폰 만료일</label>
    				<input type="date" class="form-control" id="endDate" name="endDate" 
           					placeholder="쿠폰 사용 만료일을 입력하세요 (YYYY-MM-DD)" 
           					pattern="\d{4}-\d{2}-\d{2}" 
           					title="날짜 형식은 YYYY-MM-DD여야 합니다." required>
				</div>
			
				<button type="submit" class="btn btn-primary w-100">제출하기</button>
		
			</form>
     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>


</html>