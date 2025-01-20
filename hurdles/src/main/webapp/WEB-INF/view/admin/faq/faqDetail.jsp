<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="faqDetail" scope="request"/>
<c:set var="titleName" value="FAQ 상세보기" scope="request"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>관리자 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/admin/layout/prestyle.jsp" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">질문 내용</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${board.boardTitle }</div>
		          </div>
		        </div>

		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">답변 내용</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${board.boardContent }</div>
		          </div>
		        </div>

		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">생성일</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${board.createDate }</div>
		          </div>
		        </div>

		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">최종 수정일</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${board.updateDate }</div>
		          </div>
		        </div>

		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">작성자 이름</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${board.memberName }</div>
		          </div>
		        </div>

		        <div class="form-group mb-3 row">
		          <label class="col-sm-3 col-md-2 col-lg-2 col-xl-1 col-form-label" for="fullName">삭제 여부</label>
		          <div class="col-sm-3 col-form-label">
		            <div class="contents">${board.delyn }</div>
		          </div>
		        </div>
			</div>

	
    	
 	 <div class="form-actions">
				<a href="faqList.do" class="btn btn-outline-dark">목록</a>
				<a href="faqUpdate.do?boardNo=${board.boardNo }" class="btn btn-outline-primary">수정</a>
				<button class="btn btn-outline-danger" data-toggle="modal" data-target="#logoutModal">삭제</button>
			</div>
	    </div>
     </div>

       
       
    
     <!-- /.container-fluid -->
		<!-- delete Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
					<form action="<%=request.getContextPath() %>/admin/faqDelete.do" method="post" id="delForm">
						<div class="modal-content">
								<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">삭제</h5>
								</div>
								<div class="modal-body">삭제 하시겠습니까?</div>
								<div class="modal-footer">
									<input type="hidden" name="boardNo" value="${board.boardNo}">
										<button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
										<button type="submit" class="btn btn-primary" id="delBtn">삭제</button>
								</div>
						</div>
					</form>
      </div>
  </div>
     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>
<script type="text/javascript">
$(function(){
	let delBtn = $("#delBtn");
});
</script>

</html>