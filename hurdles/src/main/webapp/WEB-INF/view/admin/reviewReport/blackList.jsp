<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="blackList" scope="request"/>
<c:set var="titleName" value="블랙리스트 목록" scope="request"/>
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
    	
       <div class="table-responsive">
           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               <thead>
                   <tr>
                       <th>아이디</th>
                       <th>이름</th>
                       <th>주소</th>                       
                       <th>전화번호</th>                       
                       <th>email</th>
                       <th>가입일자</th>
                       <th>신고횟수</th>
                   </tr>
               </thead>
               <tbody>
					<c:forEach var="item" varStatus="statusResult" items="${blackList}">
						<tr>
	<%--					<td>${paging.getTotalRecordCount()-((paging['pageNo']-1) * paging['recordCountPerPage'] + statusResult.index)}</td> --%>
							<td>${item.memberId }</td>
							<td>${item.memberName }</td>
							<td>${item.memberAdd1 }</td>
							<td>${item.memberTel }</td>
							<td>${item.memberEmail }</td>
							<td>${item.createDate}</td>
							<td>${item.benCnt}</td>
<%-- 							<td> <a href="reviewReportDetail.do?reviewReportNo=${item.reviewReportNo }" class="btn btn-outline-primary">상세보기</a> </td> --%>
							
							
						</tr>
					</c:forEach>
               </tbody>
           </table>
       </div>
       
       <page-navi 
   		url="blackListList.do?${pagingOption}"
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