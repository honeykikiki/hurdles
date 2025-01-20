<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nav" value="adminMemberList" scope="request"/>
<c:set var="titleName" value="회원정보상세조회" scope="request"/>
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
			  	<table class="table">
				  	  <tr>
					 	 <td>회원사진
					 	 	<img src="/upload/member/${memberDetail.filePath}" 
		                        onerror="this.src='${pageContext.request.contextPath}/assets/img/undraw_profile.svg'" 
		                        class="img-thumbnail rounded-circle mb-3 mb-md-0 profile" 
		                        alt="Profile Image"
		                        width="120"
		                        height="120">
		                         
	                    </td>
					  </tr>
					    
					  <tr>
					 	 <td>회원번호 :${memberDetail.memberNo}</td>
					  </tr>
					  <tr>			  
					  	<td>가입유형 :
					  		<c:choose>
					  		 <c:when test="${memberDetail.memberRole == 0}">
					  		 	관리자
					  		 </c:when> 
					  		 <c:when test="${memberDetail.memberRole == 1}">
					  		 	사장님
					  		 </c:when>
					  		
					  		 <c:when test="${memberDetail.memberRole == 2}">
					  		 	일반회원
					  		 </c:when> 
					  	</c:choose>
					  	</td>
					  </tr>
					  <tr>
					 	 <td>이름   :${memberDetail.memberName}</td>
					  </tr>
					  <tr>
					 	 <td>생년월일 :${fn:substring(memberDetail.memberBir, 0 ,10)}</td>
					  </tr>
					  <tr>
					  	<td>주소  :${memberDetail.memberAdd1}</td>
					  </tr>
					  <tr>
					  	<td>상세주소  :${memberDetail.memberAdd2}</td>
					  </tr>
					  <tr>
					  	<td>전화번호  :${memberDetail.memberTel}</td>
					  </tr>
					  <tr>
					  	<td>이메일  :${memberDetail.memberEmail}</td>
					  </tr>
					  <tr>
					  	<td>
					  		성별  :
					  		 <c:choose>
					  		 <c:when test="${memberDetail.memberGender == 0}">
					  		 	여자
					  		 </c:when>
					  		 <c:when test="${memberDetail.memberGender == 1}">
	                			남자
	            			</c:when>
					  		</c:choose>
					  	</td>
					  		
					  </tr>
					  <tr>
					  	<td>등급  :
					  	  <c:choose>
					  	<c:when test="${memberDetail.gradeNo == 1}"> 
					  		새싹
					  	</c:when>
					  	<c:when test="${memberDetail.gradeNo == 2}"> 
					  		나무
					  	</c:when>
					  	<c:when test="${memberDetail.gradeNo == 3}"> 
					  		꽃
					  	</c:when>
					  	<c:when test="${memberDetail.gradeNo == 4}"> 
					  		열매
					  	</c:when>
					  	<c:when test="${memberDetail.gradeNo == 5}"> 
					  		숲
					  	</c:when>
					  	
					  	  </c:choose>   
					  <div style="display: inline-block; margin-left: 10px;">
					   <form action="/hurdles/admin/adminMemberGradeUpdateController.do" method="post" style="display: inline;">
					  	<input type ="hidden" name ="memberNo" value="${memberDetail.memberNo}">
					  	  <select name ="grade" onchange="handleOnChange(this)">
							   <option ${memberDetail.gradeNo == 1 ? 'selected' : ''} value="1">새싹</option>
							   <option ${memberDetail.gradeNo == 2 ? 'selected' : ''} value="2">나무</option>
							   <option ${memberDetail.gradeNo == 3 ? 'selected' : ''} value="3">꽃</option>
							   <option ${memberDetail.gradeNo == 4 ? 'selected' : ''} value="4">열매</option>
							   <option ${memberDetail.gradeNo == 5 ? 'selected' : ''} value="5">숲</option>
					  	  </select>
					  	<button type="submit" class="btn btn-outline-primary mb-4">저장</button>
					  </form>
					  </div>	  
					  
					  	  
					  	  
					  	  
					  </tr>
					  <tr>
					  	<td>마일리지 :<fmt:formatNumber value="${memberDetail.memberMileage}" pattern="#,###"/> <a href ="/hurdles/admin/adminMemberMileageList.do?memberNo=${memberDetail.memberNo}" class="btn btn-outline-primary">마일리지 관리</a></td>
					  
					  </tr>
	<!-- 				  <tr> -->
	<%-- 				  	<td>가입일  :${memberDetail.createDate}</td> --%>
	<!-- 				  </tr> -->
	<!-- 				  <tr> -->
	<%-- 				  	<td>탈퇴일 :${memberDetail.removeDate}</td> --%>
	<!-- 				  </tr> -->
					  
				  </table>
					  <a href ="/hurdles/admin/AdminMemberCouponList.do?memberNo=${memberDetail.memberNo}" class="btn btn-outline-primary mb-4">쿠폰이력 조회</a>
			  </div>
				
				<a class="btn btn-outline-dark" href="/hurdles/admin/memberList.do?memberNo=${memberDetail.memberNo}">목록</a>
     	</div>
     	
     </div>

     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>


</html>