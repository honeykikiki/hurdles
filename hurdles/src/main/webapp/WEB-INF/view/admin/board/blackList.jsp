<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--꼭 넣어주는거 -->
<c:set var="nav" value="blackList" scope="request"/>
<c:set var="titleName" value="블랙리스트 목록" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/> 

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
     	<form class="d-flex flex-wrap align-items-center form-search mb-4" action="boardList.do" method="get">
    		<input type="text" class="form-control w-25 mr-2 mb-2" name="title" id="title" placeholder="제목을 입력하세요." value="${pagingOption['title']}" />
    		<input type="text" class="form-control w-25 mr-2 mb-2" name="memName" id="memName" placeholder="작성자 이름을 입력하세요." value="${pagingOption['memName']}" />
    		<button type="submit" class="btn btn-outline-primary submit mb-2">검색</button>
    	</form>
    	
		<p class="mb-1">
	    	총 <strong class="h5 number">${paging.getTotalRecordCount()}</strong>개	
	    </p>
    	
       <div class="table-responsive">
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
					<c:forEach var="board" varStatus="statusResult" items="${boardList}">
						<tr>
							<td>${paging.getTotalRecordCount()-((paging['pageNo']-1) * paging['recordCountPerPage'] + statusResult.index)}</td>
							<td>${board.title }</td>
							<td>${board.content }</td>
							<td>${board.memName }</td>
							<td>${board.regDate }</td>
							<td>
								<a href="boardDetail.do?boardNo=${board.boardNo }" class="btn btn-outline-primary">상세보기</a>
							</td>
						</tr>
					</c:forEach>
               </tbody>
           </table>
       </div>
       
       <page-navi 
   		url="boardList.do?${pagingOption}"
   		current="${paging.getPageNo()}" 
   		total="${paging.getTotalPageCount()}"/>
     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>


</html>