<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="adminMemberMileage" scope="request"/>
<c:set var="titleName" value="마일리지 상세보기" scope="request"/>
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
		 	<div>
		 		<h2>마일리지 내역 조회</h2>
			 		 <table class="table">
			 		   <thead>
			 		   	<tr>
			 		  	 <th>사용일/적립일</th>
			 		  	 <th>사용/적립</th>
			 		  	 <th>금액</th>
			 		    </tr>
			 		    </thead>
			 		   <tbody>
			 		   	 <c:forEach var="list" items="${list}">
			 		     <tr>
			 		       <td>${list.createDate}</td>
			 		       <td>
			 		         <c:choose>
			 		           <c:when test="${list.mileageUsed == 0}">
			 		             사용
			 		           </c:when>
			 		            <c:when test="${list.mileageUsed == 1}">
			 		             적립
			 		            </c:when>
			 		           
			 		         </c:choose>
			 		       </td>
			 		       
			 		       <td><fmt:formatNumber value="${list.mileagePoint}" pattern="#,###"/> </td>
			 		     </tr>
			 		   	 </c:forEach>
			 		   </tbody> 
					 </table>	 
					 <br><br><br><br>
					    <h3>마일리지 수정</h3>
					       
							   <form action="/hurdles/admin/adminMemberMileageInsert.do" method="post" class="mb-4">
							   <input type ="hidden" name ="memberNo" value="${memberNo}">
					 		         <select name="uesEarn" onchange="handleOnChange(this)">
					 		    	  <option value="0">사용</option>	
					 		    	  <option value="1">적립</option>	
					 		    	</select>
					 		     <input type="text" name="point">
										<button type ="submit" class="btn btn-outline-primary">수정</button>	 	
							   </form>
	     	</div>
				<a class="btn btn-outline-dark" href="/hurdles/admin/adminMemberDetail.do?memberNo=${memberNo}">뒤로가기</a>
		 	</div>
     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>


</html>