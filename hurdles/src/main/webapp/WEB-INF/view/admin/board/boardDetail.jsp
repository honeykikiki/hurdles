<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nav" value="boardDetail"/>
<c:set var="titleName" value="게시판 상세" scope="request"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>관리자 게시물 상세보기</title>
	<jsp:include page="/WEB-INF/view/admin/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">
		 <div class="bg-white rounded p-3 m-2">
			<div class="mt-3">
		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">제목</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${board.title}</div>
		          </div>
		        </div>
		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">내용</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${board.content}</div>
		          </div>
		        </div>
		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">생성일</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${board.regDate}</div>
		          </div>
		        </div>
		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">작성자</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${board.memName}</div>
		          </div>
		        </div>
			</div>
			
			<c:if test="${not empty fileList}">
			    <div class="row">
			    	<c:forEach var="file" items="${fileList}">
			        	<img class="col-3 rounded img-thumbnail mb-2" src="/upload/board/${file.fileSaveName}" onerror="this.src='${pageContext.request.contextPath  }/assets/img/image-error.png'"/>
			    	</c:forEach>
			    </div>
			</c:if>
			

			<div class="form-actions">
				<a href="boardList.do" class="btn btn-outline-dark" >목록</a>
				<a href="boardUpdate.do?boardNo=${board.boardNo }" class="btn btn-outline-primary" >수정</a>
				<a href="boardDelete.do?boardNo=${board.boardNo }" class="btn btn-outline-danger" >삭제</a>
			</div>
	    </div>
     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>


</html>