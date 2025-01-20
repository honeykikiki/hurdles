<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="boardListInfinite" scope="request"/>
<c:set var="titleName" value="게시판 목록 무한" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption"  value="${paginationInfo.getSearchVo() }"/> 

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
     	<form class="d-flex flex-wrap align-items-center form-search mb-4" action="boardListInfinity.do" method="get">
    		<input type="text" class="form-control w-25 mr-2 mb-2" name="title" id="title" placeholder="제목을 입력하세요." value="${pagingOption['title']}" />
    		<input type="text" class="form-control w-25 mr-2 mb-2" name="memName" id="memName" placeholder="작성자 이름을 입력하세요." value="${pagingOption['memName']}" />
    		<button type="submit" class="btn btn-outline-primary submit mb-2">검색</button>
    	</form>
    	
       	<p class="mb-1">
	    	총 <strong class="h5 number">${paging.getTotalRecordCount()}</strong>개	
	    </p>
    
	  	 <infinite-scroll 
		    url="boardListJson.do"
		    total="${paging.getTotalRecordCount()}"
		    last-page="${paging.getLastPageNo()}"
		    data-search="${pagingOption}">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			  <thead>
			    <tr>
			      <th>순번</th>
			      <th>제목</th>
			      <th>내용</th>
			      <th>작성자</th>
			      <th>생성일</th>
			      <th></th>
			    </tr>
			  </thead>
			  <tbody>
	
			    <template>
			      <tr>
			        <td>{{index}}</td>
			        <td>{{title}}</td>
			        <td>{{content}}</td>
			        <td>{{memName}}</td>
			        <td>{{regDate}}</td>
			        <td>
			          <a href="boardDetail.do?boardNo={{boardNo}}" class="btn btn-outline-primary">상세보기</a>
			        </td>
			      </tr>
			    </template>
				    
				 
	 			</tbody>
	    	</table>
		  </infinite-scroll>
     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>


</html>