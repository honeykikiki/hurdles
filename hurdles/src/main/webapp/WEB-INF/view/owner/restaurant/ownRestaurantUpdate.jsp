<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="restaurantUpdate" scope="request"/>
<c:set var="titleName" value="식당 수정" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>관리자 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/owner/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/owner/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">
			<div class="bg-white rounded p-3 m-2">
				<form action="ownRestaurantUpdate.do" class="needs-validation"  method="post" enctype="multipart/form-data" novalidate>
					<input type="hidden" name="restaurantNo" value="${restaurant.restaurantNo }" />
					<div class="mb-4">
						<label for="restaurantName" class="form-label">식당 이름</label>
						<input id="restaurantName" name="restaurantName" type="text" class="form-control" required="required" value="${restaurant.restaurantName }">
							<div class="invalid-feedback">식당 이름을 입력해주세요</div>
					</div>
					
					<div class="mb-4">
						<label for="restaurantDes" class="form-label">식당 설명</label>
						<input id="restaurantDes" name="restaurantDes" type="text" class="form-control" required="required" value="${restaurant.restaurantDes }">
									<div class="invalid-feedback">식당 설명을 입력해주세요</div>
					</div>
					
					<div class="mb-4">
						<label for="restaurantTel" class="form-label">식당 전화번호</label>
						<input id="phoneNumber" name="restaurantTel" type="tel" class="form-control" required="required" value="${restaurant.restaurantTel }">
									<div class="invalid-feedback">전화번호를 입력해주세요</div>
					</div>
					
					<div class="mb-4">
						<label for="restaurantTel" class="form-label">음식 카테고리</label>
						<br/>
						<select class="custom-select w-50" name="restaurantCodeNo" aria-label="Large select example" required="required" value="${restaurant.restaurantCodeNo }">
							<option value="" selected>음식 카테고리를 선택해주세요</option>
						<c:forEach var="item" items="${resCodeList }">
								<option value="${item.restaurantCodeNo }" ${item.restaurantCodeNo == restaurant.restaurantCodeNo ? "selected" : ""}>${item.resturantCodeName }</option>
						</c:forEach>
						</select>
						<div class="invalid-feedback">음식 카테고리를 선택해주세요</div>
					</div>
					
					<div class="mb-4">
						<label for="restaurantTel" class="form-label">지역</label>
						<br/>
						<select class="custom-select w-50" name="localNo" aria-label="Large select example" required="required" value="${restaurant.localNo }">
							<option value="" selected>지역을 선택해주세요</option>
						<c:forEach var="item" items="${localList }">
								<option value="${item.localNo }" ${item.localNo == restaurant.localNo ? "selected" : ""}>${item.localName }</option>
						</c:forEach>
						</select>
						<div class="invalid-feedback">지역을 선택해주세요</div>
					</div>
							
					<div class="mb-4">
						<label for="restaurantAdd1" class="form-label mb-3">주소찾기</label>
						<input type="text" name="restaurantAdd1" class="form-control address-select" id="restaurantAdd1" placeholder="주소를 입력하세요." required="required" value="${restaurant.restaurantAdd1 }" />
						<div class="invalid-feedback restaurantAdd1">식당 주소 찾기를 진행해주세요</div>
						<input type="text" name="restaurantAdd2" class="form-control mt-3" id="addressDetail" maxlength="30" placeholder="상세주소를 입력하세요." required="required" value="${restaurant.restaurantAdd2 }" />
						<div class="invalid-feedback">상세주소를 입력해주세요</div>
					</div>

					<c:if test="${not empty fileList}">
						<file-upload name="filename" label="추가된 식당 이미지" file-root="restaurant" uploaded-file="${fileList}" max-files="${5 - fileList.size()}" contextPath="${pageContext.request.contextPath  }"></file-upload>
					</c:if>

					<!-- 여러개 파일 -->
					<c:if test="${empty fileList}">
						<file-upload name="filename" label="추가할 식당 이미지" max-files="${5 - fileList.size()}" contextPath="${pageContext.request.contextPath  }"></file-upload>
					</c:if>
					

					<button class="btn btn-primary" type="submit">저장</button>
				</form>
			</div>
     </div>
		 
     <!-- /.container-fluid -->
	 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
     <!-- End of Footer -->
	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
	
</body>


</html>