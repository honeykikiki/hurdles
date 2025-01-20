<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<c:set var="nav" value="restaurant" scope="request"/>
<c:set var="titleName" value="${restaurantName} -  메뉴 상세보기" scope="request"/>

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
		 	<div class="bg-white rounded p-3 m-2">
				<div class="mt-3">
					<div class="form-group mb-3 row">
						<label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">메뉴 이름</label>
							<div class="col-sm-3 col-form-label">
							<div class="contents">${item.menuName}</div>
							</div>
					</div>

						<div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">메뉴 설명</label>
		          <div class="col-sm-3 col-form-label">
								<div class="contents">${item.menuDes == null || item.menuDes == '' ? '설명이 없습니다' : item.menuDes}</div>

		          </div>
		        </div>

		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">메뉴 가격</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents"><fmt:formatNumber value="${item.menuPrice}" pattern="#,###"/>원</div>
		          </div>
		        </div>

		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">메뉴 생성일</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${item.createDate}</div>
		          </div>
		        </div>

						<c:if test="${not empty item.fileSaveName}">
								<div class="row mb-3">
									<img class="col-3 rounded img-thumbnail mb-2" src="/upload/menu/${item.fileSaveName}" onerror="this.src='${pageContext.request.contextPath  }/assets/img/image-error.png'"/>
								</div>
						</c:if>
				</div>
				<div class="form-actions">
					<a href="menuList.do?restaurantNo=${item.restaurantNo}&restaurantName=${restaurantName}" class="btn btn-outline-dark">목록</a>
					<a href="menuUpdate.do?menuNo=${item.menuNo}&restaurantName=${restaurantName}" class="btn btn-outline-primary">수정</a>
					<button class="btn btn-outline-danger" data-toggle="modal" data-target="#menuDeleteModal">삭제</button>
				</div>
		</div>

	<!-- 메뉴 삭제 모달 -->
  <div class="modal fade" id="menuDeleteModal" tabindex="-1" role="dialog" aria-labelledby="menuDeleteModal" aria-hidden="true">
      <div class="modal-dialog" role="document">
					<form action="menuDelete.do" method="post">
						<div class="modal-content">
								<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">삭제</h5>
								</div>
								<div class="modal-body">
									<input type="hidden" name="restaurantName" value="${restaurantName}">
									<input type="hidden" name="restaurantNo" value="${item.restaurantNo}">
									<input type="hidden" name="menuNo" value="${item.menuNo}">
									삭제 하시겠습니까?
								</div>
								<div class="modal-footer">
										<button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
										<button type="submit" class="btn btn-primary">삭제</button>
								</div>
						</div>
					</form>
      </div>
  </div>

  <!-- Footer -->
	<jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
  <!-- End of Footer -->
	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>


</html>