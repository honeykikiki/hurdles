<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="ReviewReportList" scope="request"/>
<c:set var="titleName" value="신고 내역" scope="request"/>
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

     	<form class="d-flex flex-wrap align-items-center form-search mb-4" action="reviewReportList.do" method="get">
     		
     		<input type="checkbox" name="reviewReportAction" id="restaurantName3" value="2"    />조치완료
     		<input type="checkbox" name="reviewReportAction" id="restaurantName2"  value="1" />조치대기중

     		<input type="text" class="form-control w-25 me-2 mb-2" name="restaurantName" id="restaurantName1" placeholder="식당 이름을 입력하세요." value="${pagingOption['restaurantName']}" />
    		<button type="submit" class="btn btn-outline-primary submit mb-2">검색</button>
    	</form>


    	
       <div class="table-responsive">
           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               <thead>
                   <tr>
                       <th>신고번호</th>
                       <th>조치여부</th>
                       <th>식당이름</th>                       
                       <th>신고사유</th>                       
                       <th>신고인 </th>
                       <th>신고일자</th>
                       <th>피 신고인</th>
                       <th>상세보기</th>
                   </tr>
               </thead>
               <tbody>
					<c:forEach var="item" varStatus="statusResult" items="${reviewReportList}">
						<tr>
	<%--					<td>${paging.getTotalRecordCount()-((paging['pageNo']-1) * paging['recordCountPerPage'] + statusResult.index)}</td> --%>
							<td>${item.reviewReportNo }</td>
							<td>${item.reviewReportAction }</td>
							<td>${item.restaurantName }</td>
							<td>${item.reviewReportDes }</td>
							<td>${item.memberName }</td>
							<td>${item.createDate}</td>
							<td>${item.targetMemberName}</td>
							<td> <a href="reviewReportDetail.do?reviewReportNo=${item.reviewReportNo }" class="btn btn-outline-primary">상세보기</a> </td>
							
							
						</tr>
					</c:forEach>
               </tbody>
           </table>
       </div>
       
       <page-navi 
   		url="reviewReportList.do?${pagingOption}"
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