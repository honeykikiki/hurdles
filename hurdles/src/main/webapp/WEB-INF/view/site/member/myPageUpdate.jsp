<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="마이페이지 수정" scope="request"/>
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
				<div class="card w-50 mx-auto">
					<div class="card-body">
						<form action="myPageUpdate.do" class="needs-validation"  method="post" enctype="multipart/form-data" novalidate>
							<input type="hidden" name="memberNo" value="${member.memberNo }" />
							<c:if test="${not empty fileList}">
								<file-upload name="filename" label="프로필 이미지" file-root="member" uploaded-file="${fileList}" max-files="1" contextPath="${pageContext.request.contextPath  }"></file-upload>
							</c:if>
		
							<!-- 여러개 파일 -->
							<c:if test="${empty fileList}">
								<file-upload name="filename" label="프로필 이미지" max-files="1" contextPath="${pageContext.request.contextPath  }"></file-upload>
							</c:if>
	
							<div class="mb-4">
								<label for="memberName" class="form-label">사용자 이름</label>
								<input id="memberName" name="memberName" type="text" class="form-control" required="required" value="${member.memberName }">
									<div class="invalid-feedback">사용자 이름을 입력해주세요</div>
							</div>
							
							<div class="mb-4">
								<label for="memberEmail" class="form-label">이메일</label>
								<input name="memberEmail" type="email" class="form-control" required="required" value="${member.memberEmail }">
								<div class="invalid-feedback">이메일 입력해주세요</div>
							</div>
	
							<div class="mb-4">
								<label for="memberTel" class="form-label">전화번호</label>
								<input id="phoneNumber" name="memberTel" type="tel" class="form-control" required="required" value="${member.memberTel }">
								<div class="invalid-feedback">전화번호를 입력해주세요</div>
							</div>

							<div class="mb-4">
								<label for="memberBir" class="form-label">생일</label>
								<input id="phoneNumber" name="memberBir" type="date" class="form-control" required="required" value="${fn:substring(member.memberBir, 0, 10)}">
								<div class="invalid-feedback">생일을 선택해주세요</div>
							</div>
							
							<div class="mb-4">
								<label for="memberAdd1" class="form-label mb-3">주소찾기</label>
								<input type="text" name="memberAdd1" class="form-control address-select" id="memberAdd1" placeholder="주소를 입력하세요." required="required" value="${member.memberAdd1 }" />
								<div class="invalid-feedback memberAdd1">식당 주소 찾기를 진행해주세요</div>
								<input type="text" name="memberAdd2" class="form-control mt-3" id="addressDetail" maxlength="30" placeholder="상세주소를 입력하세요." required="required" value="${member.memberAdd2 }" />
								<div class="invalid-feedback">상세주소를 입력해주세요</div>
							</div>
	
							<button class="btn btn-primary" type="submit">프로필 수정</button>
						</form>
					</div>
				</div>
     	</div>
	</main>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>