<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="noticeList" scope="request"/>
<c:set var="titleName" value="공지사항 목록" scope="request"/>
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
		<p class="mb-1">
	    	총 <strong class="h5 number">${paging.getTotalRecordCount()}</strong>개	
	    </p>
    	
       <div class="table-responsive">
           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               <thead>
                   <tr>
                       <th>순번</th>
                       <th>제목</th>                       
                       <th>생성일</th>
                       <th>최종 수정일</th>
                       <th>작성자 코드</th>
                       <th></th>
                   </tr>
               </thead>
               <tbody>
					<c:forEach var="item" varStatus="statusResult" items="${noticeList}">
						<tr>
							<td>${paging.getTotalRecordCount()-((paging['pageNo']-1) * paging['recordCountPerPage'] + statusResult.index)}</td>
							<td>${item.boardTitle }</td>
							<td>${item.createDate }</td>
							<td>${item.updateDate }</td>
							<td>${item.memberName }</td>
							<td> <a href="noticeDetail.do?boardNo=${item.boardNo }" class="btn btn-outline-primary">상세보기</a> </td>
							
							
						</tr>
					</c:forEach>
               </tbody>
           </table>
       </div>
       
       <page-navi 
   		url="noticeList.do?${pagingOption}"
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