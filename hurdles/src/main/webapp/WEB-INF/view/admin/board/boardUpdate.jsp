<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="boardUpdate"/>
<c:set var="titleName" value="게시판 수정" scope="request"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>관리자 - 게시물 업데이트</title>
	<jsp:include page="/WEB-INF/view/admin/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
	     <div class="container-fluid">
	 	 	<div class="bg-white rounded p-3 m-2">
				<form action="boardUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" class="form-control" name="boardNo" value="${board.boardNo }">
				
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">제목</label>
				    <input type="text" class="form-control" name="title" value="${board.title }">
				  </div>
				  
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">내용</label>
				    <input type="text" class="form-control" name="content" value="${board.content }">
				  </div>
				  				  
				  <!-- 여러개 파일 -->
	  				<c:if test="${not empty fileList}">
					    <div class="row">
					    	<c:forEach var="file" items="${fileList}">
					        	<img class="col-3 rounded img-thumbnail mb-2" src="/upload/board/${file.fileSaveName}" onerror="this.src='/assets/img/image-error.png'"/>
					    	</c:forEach>
					    </div>
					</c:if>
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