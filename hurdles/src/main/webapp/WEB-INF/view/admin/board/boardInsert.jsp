<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="boardInsert" scope="request"/>
<c:set var="titleName" value="게시판 추가" scope="request"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>관리자 - ${titleName }</title>
	<jsp:include page="/WEB-INF/view/admin/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
     <!-- End of Sidebar -->
	
     <!-- Begin Page Content -->
     <div class="container-fluid">
 	 	<div class="bg-white rounded p-3 m-2">
			<form action="boardInsert.do" method="post" enctype="multipart/form-data">
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">제목</label>
			    <input type="text" class="form-control" name="title">
			  </div>
			  
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label">내용</label>
			    <input type="text" class="form-control" name="content">
			  </div>
			  
			  <!--  <!-- 단일 파일 -->
			  <!-- <file-upload name="filename" label="프로필 업로드" max-files="1"></file-upload> -->
			  
			  <!-- 여러개 파일 -->
			  <file-upload name="filename" label="파일 업로드" max-files="5"></file-upload>
			  
			  <button class="btn btn-primary" type="submit">저장</button>
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