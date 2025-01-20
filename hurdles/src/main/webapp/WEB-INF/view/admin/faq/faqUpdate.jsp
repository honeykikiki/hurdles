<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="faqUpdate" scope="request"/>
<c:set var="titleName" value="FAQ 수정" scope="request"/>
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
			<form action="faqUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" class="form-control" name="boardNo" value="${board.boardNo }">
				
				<div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">제목</label>
				    <input type="text" class="form-control" name="boardTitle" value="${board.boardTitle }">
				  </div>
				  
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">내용</label>
				    <input type="text" class="form-control" name="boardContent" value="${board.boardContent }">
				  </div>
					
			<button type="button" class="btn btn-outline-dark" onclick="javasript:history.back();"> 뒤로가기</button>
			<button class="btn btn-primary" type="submit">수정</button>
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