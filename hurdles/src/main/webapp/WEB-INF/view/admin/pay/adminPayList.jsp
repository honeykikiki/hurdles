<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="adminpPayList" scope="request"/>
<c:set var="titleName" value="결제내역조회" scope="request"/>
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


<style>
#title{
	color: gray; 
	text-decoration: none; 
}

</style>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">
		 <div class="bg-white rounded p-3 m-2">

			  <table class="table">
			    <thead>
			      <tr>
			        <th>회원이름</th>
			        <th>결제번호</th>
			        <th>주문번호</th>
			        <th>결제일</th>  
			        <th>결제취소일</th>
			        <th>결제금액</th>
			        <th>최종결제금액</th>     
			        
			      </tr>
			    </thead>
			    <tbody>
			      <c:forEach var="list" items="${list}">
			         <tr>
			        <td>${list.memberName}</td>
			        <td>${list.payNo}</td>
			        <td>${list.ordersNo}</td>
			        <td>${fn:substring(list.createDate,0,10)}</td>
			        <td>${fn:substring(list.removeDate,0,10)}</td>
			        <td><fmt:formatNumber value="${list.payPrice}" pattern="#,###"/> </td>
			        <td><fmt:formatNumber value="${list.payTotalPrice}" pattern="#,###"/> </td>
			      </tr>
			      </c:forEach>  
			    </tbody>
			  </table>
				<page-navi
					url="memberList.do?${pagingOption}"
				current="${paging.getPageNo()}"
				total="${paging.getTotalPageCount()}"  />
			</div>
			
     </div>

     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>


</html>