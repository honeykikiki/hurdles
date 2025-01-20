<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="memberList" scope="request"/>
<c:set var="titleName" value="회원정보전체조회" scope="request"/>
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
			        <th>회원번호</th>
			        <th>ID</th>
			        <th>이름</th>  
			        <th>등급</th>
			        <th>가입일</th>
			        <th>탈퇴일</th>
			        <th></th>
			        
			      </tr>
			    </thead>
			    <tbody>
			      <c:forEach var="list" items="${list}">
			         <tr>
			        <td>${list.memberNo}</td>
			        <td>${list.memberId}</td>
			        <td>${list.memberName}</td>
			        <td>
			       	 <c:choose>
					  	<c:when test="${list.gradeNo == 1}"> 
					  		새싹
					  	</c:when>
					  	<c:when test="${list.gradeNo == 2}"> 
					  		나무
					  	</c:when>
					  	<c:when test="${list.gradeNo == 3}"> 
					  		꽃
					  	</c:when>
					  	<c:when test="${list.gradeNo == 4}"> 
					  		열매
					  	</c:when>
					  	<c:when test="${list.gradeNo == 5}"> 
					  		숲
					  	</c:when>
					  	
					  </c:choose>  
			        </td>
			        <td>${list.createDate}</td>
			        <td>${list.removeDate}</td>
			        <td><button type ="button"class="btn btn-outline-primary mb-4"
			             onclick="location.href='/hurdles/admin/adminMemberDetail.do?memberNo=${list.memberNo}'">상세보기</button></td>
			      </tr>
			      </c:forEach> 
			    </tbody>
			  </table>
			</div>
			
     </div>
     <page-navi
       url="memberList.do?${pagingOption}"
	   current="${paging.getPageNo()}"
	   total=  "${paging.getTotalPageCount()}"  />
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
</body>


</html>