<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nav" value="ownerReservationList" scope="request"/>
<c:set var="titleName" value="예약내역조회" scope="request"/>
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


<style>
#title{
	color: gray; 
	text-decoration: none;
}

</style>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/owner/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">
		 <div class="bg-white rounded p-3 m-2">
			  <table class="table">
			    <thead>
			      <tr>
			        <th>회원 이름</th>
			        <th>예약일</th>
			        <th>방문일</th>  
			        <th>방문시간</th>
			        <th>예약인원</th>   
			        <th>취소</th>
			        
			      </tr>
			    </thead>
			    <tbody>
			      <c:forEach var="item" items="${reservationList}">
						<tr>
			        <td>${item.memberName}</td>
			        <td>${item.createDate}</td>
			        <td>${item.reserveDate}</td>
			        <td>${item.reserveTime}</td>
			        <td>${item.guests}</td>
					
			        <td><a href="ownDelete.do?reservationNo=${item.reservationNo }" >취소하기</a></td>
			      </tr>
			      </c:forEach> 
			    </tbody>
			  </table>

			</div>
     </div>

     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>


</html>