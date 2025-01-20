<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="adminMemberCouponList" scope="request"/>
<c:set var="titleName" value="쿠폰 상세조회" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>관리자 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/admin/layout/prestyle.jsp" />
</head>
<script>
function handleOnChange(e) {
  // 선택된 데이터 가져오기
  const value = e.value;
  
  console.log(value)
  
 
}
</script>


<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">
		 <div class="bg-white rounded p-3 m-2">
		 	<div class="container mt-3">  
		 	<h2>쿠폰 내역 조회</h2>
		 	<input type="hidden" name="memberNo" value="${memberNo}">  
		 		 <table class="table">
		 		   <thead>
		 		   	<tr>
		 		  	 <th>쿠폰이름</th>
		 		  	 <th>발급일</th>
		 		  	 <th>사용일</th>
		 		  	 <th>결제번호</th>
		 		  	 <th>금액</th> 
		 		    </tr>
		 		    </thead>
		 		   <tbody>
		 		   	 <c:forEach var="list" items="${list}">
		 		     <tr>
		 		       <td>${list.couponName}</td>
		 		       <td>${fn:substring(list.createDate,0 ,10)}</td>
		 		       <td>${fn:substring(list.useDate,0,10)}</td>
		 		       <td>${list.payNo}</td>
		 		       <td><fmt:formatNumber value="${list.couponPrice}" pattern="#,###"/> </td>
		 		     </tr>
		 		   	 </c:forEach>
		 		   </tbody> 
			 </table>	
		 <a class="btn btn-outline-dark" href="/hurdles/admin/adminMemberDetail.do?memberNo=${memberNo}">이전</a>
		 </div> 
     	</div>
     </div>
			 
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>


</html>