<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="메인" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>문의하기</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
		<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

		<main style="max-width: 1280px; margin: 0 auto;">
			<div class="container-fluid mb-4">
					<h1>1:1 문의하기</h1>
					<form action="question.do"  class="user needs-validation" novalidate method="post" enctype="multipart/form-data">
						<!-- memberNo -->
						<input type="hidden" name="memberNo" value="${memberNo}">
						<!-- restaurantNo -->
						<input type="hidden" name="restaurantNo" value="${restaurantNo}">
						<!--  제목 -->
						<div class="mb-4">
							<label for="questionTitle" class="form-label">문의 제목</label>
							<input id="questionTitle" type="text" class="form-control" name="questionTitle" value="${questionTitle}" placeholder="제목을 입력해 주세요" required >
							<div class="invalid-feedback">문의 제목을 입력해주세요</div>
						</div>
						
							<!-- 내용 -->
						<div class="mb-4">
							<label for="questionContent" class="form-label">문의 내용</label>
							<textarea class="form-control"  rows="10" id="questionContent" name="questionContent" placeholder="내용을 입력해 주세요" required>${questionContent}</textarea>
							<div class="invalid-feedback">문의 내용을 입력해주세요</div>
						</div>	
							<!-- 단일 파일 -->
							<file-upload name="filename" label="첨부파일" contextPath="${pageContext.request.contextPath}" max-files="1"></file-upload>
							<button class="btn-getstarted" type="submit">저장</button>
					</form>
			</div>
	</main>
	     <script >
			if ("${member.memberNo}" == 0) {
				bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
				return;
			}
	</script>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>