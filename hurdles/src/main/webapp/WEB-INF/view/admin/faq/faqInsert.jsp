<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="faqInsert" scope="request"/>
<c:set var="titleName" value="FAQ 추가" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>관리자 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/admin/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">
		 <div class="bg-white rounded p-3 m-2">
		<div class="card shadow-sm rounded p-4 m-3">
		
			<form action="faqInsert.do" method="post">
				<div class="mb-3">
   					 <label for="name" class="form-label">질문</label>
  						<input type="text" class="form-control" id="title" name="title" placeholder="질문을 입력하세요" required>
				</div>
				<div class="mb-3">
   					 <label for="name" class="form-label">답변</label>
  						<input type="text" class="form-control" id="content" name="content" placeholder="답변을 입력하세요" required>
				</div>
			
				<button type="submit" class="btn btn-primary w-100">제출하기</button>
		
			</form>
		
     	</div>
     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>


</html>