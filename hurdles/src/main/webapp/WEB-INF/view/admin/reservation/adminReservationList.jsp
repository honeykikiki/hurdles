<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nav" value="adminReservationList" scope="request"/>
<c:set var="titleName" value="예약내역조회" scope="request"/>
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
			        <th>식당이름</th>
			        <th>예약일</th>
			        <th>방문일</th>  
			        <th>방문시간</th>
			        <th>예약인원</th>   
			        <th>회원이름</th> 
			        <th>취소</th>
			        
			      </tr>
			    </thead>
			    <tbody>
			      <c:forEach var="item" items="${list}">
						<tr>
			        <td>${item.restaurantName}</td>
			        <td>${fn:substring(item.createDate,0,10)}</td>
			        <td>${fn:substring(item.reserveDate,0,10)}</td>
			        <td>${item.reserveTime}</td>
			        <td>${item.guests}</td>
					<td>${item.memberName}</td>
			        <td>${item.delYn}</td>
			      </tr>
			      </c:forEach> 
			    </tbody>
			  </table>

			</div>
     </div>

     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>


</html>