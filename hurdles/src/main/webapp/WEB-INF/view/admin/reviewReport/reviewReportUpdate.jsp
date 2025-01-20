<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="blackReviewUpdate" scope="request"/>
<c:set var="titleName" value="신고 조치 사유 작성" scope="request"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>관리자 - ${titleName}</title>
	<jsp:include page="/WEB-INF/view/admin/layout/prestyle.jsp" />
</head>

<body>
		<jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />

		<div class="container-fluid">
			<div class="bg-white rounded p-3 m-2">
				<form action="reviewReportUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" class="form-control" name="reviewReportNo" value="${ReviewReport.reviewReportNo }">
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">조치여부</label>
				    <input type="text" class="form-control" name="reviewReportAction"  value="${ReviewReport.reviewReportAction }">
				  </div>

          <button type="button" class="btn btn-outline-dark" onclick="javasript:history.back();"> 뒤로가기</button>
				  <button class="btn btn-primary" type="submit">전송</button>
				</form>
			</div>
    </div>

		<jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
		<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>
</html>