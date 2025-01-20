<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<c:set var="nav" value="ownQuestionDetail" scope="request"/>
<c:set var="titleName" value="문의 상세보기" scope="request"/>

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
				<div class="mt-3">
					<div class="form-group mb-3 row">
						<label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">식당이름</label>
							<div class="col-sm-3 col-form-label">
		            <div class="contents">${question.restaurantName}</div>
		          </div>
					</div>

		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">문의 제목</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${question.questionTitle}</div>
		          </div>
		        </div>

		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">문의 내용</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${question.questionContent} </div>
		          </div>
		        </div>


		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">생성일</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${question.createDate}</div>
		          </div>
		        </div>

		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">답변</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${question.questionAnswer == null || question.questionAnswer == ''  ? '아직 답변이 없습니다' : question.questionAnswer}</div>
		          </div>
		        </div>
		   		
		   		<div class="form-actions">
				<form action="ownQuestionUpdate.do" method="post" enctype="multipart/form-data">
			
				<input type="hidden" class="form-control" name="questionNo" value="${question.questionNo }">
				
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">답변내용</label>
				    <input type="text" class="form-control" name="questionAnswer" placeholder="답변을 달아주세요." value="${question.questionAnswer }">
				  </div>
					
					<div class="form-actions">
					<a href="ownQuestionList.do" class="btn btn-outline-dark">목록</a>
					 <button class="btn btn-primary" type="submit">전송</button>
					</div>
          
				 
				</form>
			</div>
		   	     
		        
		        

<!-- 		게시글 아래 버튼 목록  -->
<!-- 				<div class="form-actions"> -->
<!-- 					<a href="ownQuestionList.do" class="btn btn-outline-dark">목록</a> -->
<!-- 				</div> -->
				
				
		</div>
	<!-- /.container-fluid -->







  <!-- Footer -->
	<jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
  <!-- End of Footer -->
	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>


</html>