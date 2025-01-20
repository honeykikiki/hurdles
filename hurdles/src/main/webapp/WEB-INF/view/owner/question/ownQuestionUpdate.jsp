<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="main" scope="request"/>
<c:set var="titleName" value="메인" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>사장님 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/owner/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/owner/layout/header.jsp" />
     <!-- End of Sidebar -->
		

     <!-- Begin Page Content -->
     <div class="container-fluid">
     	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               <thead>
                   <tr>
                       <th>문의 질문</th>
                       <th>문의 내용</th>                       
                       <th>생성일</th>                       
                   </tr>
               </thead>
               <tbody>
					<c:forEach var="item" varStatus="statusResult" items="${ownQuestionList}">
						<tr>
							<td>${item.questionTitle }</td>
							<td>${item.questionContent }</td>
							<td>${item.createDate }</td>
						</tr>
					</c:forEach>
               </tbody>
           </table>
     
		<div class="bg-white rounded p-3 m-2">
				<form action="ownQuestionUpdate.do" method="post" enctype="multipart/form-data">
			
				<input type="hidden" class="form-control" name="questionNo" value="${question.questionNo }">
				
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">답변내용/label>
				    <input type="text" class="form-control" name="questionAnswer"  value="${question.questionAnswer }">
				  </div>

          <button type="button" class="btn btn-outline-dark" onclick="javasript:history.back();"> 뒤로가기</button>
				  <button class="btn btn-primary" type="submit">전송</button>
				</form>
			</div>
     </div>
     <!-- /.container-fluid -->
     
     
     

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>


</html>