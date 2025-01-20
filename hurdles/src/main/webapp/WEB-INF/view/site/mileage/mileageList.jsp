<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="마일리지 내역" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>데모 (타이틀 변경 해주세요!!)</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid">
		 	<div class="table-responsive">
           	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               	<thead>
                   	<tr>
                     	  	<th>이름</th>
                    	   	<th>사용여부</th>
                   	    	<th>적립금</th>
                       		<th>적립일</th>
<!--                        		<th>누적금 </th> -->
                	   </tr>
               	</thead>
               	<tbody>
               			
						<c:forEach var="item" varStatus="statusResult" items="${mileageList}">				
							<tr>
<%-- 								<td>${paging.getTotalRecordCount()-((paging['pageNo']-1) * paging['recordCountPerPage'] + statusResult.index)}</td> --%>
								<td>${item.memberName}</td>
									<c:if test="${item.mileageUsed eq 0 }">
									<td>사용됨</td>
									</c:if>
									<c:if test="${item.mileageUsed eq 1 }">
									<td>적립됨</td>
									</c:if>
								<td>${item.usedMileage }</td>
								<td>${item.createDate }</td>
<%-- 								<td>${item.usedMileage}</td> --%>
							
							
							</tr>
						</c:forEach>
            	   </tbody>
           	</table>
            <c:if test="${mileageList.size() == 0}" >
                <div class="alert alert-secondary text-center">
                    <strong>마일리지 정보가 없습니다.</strong>
                </div>
            </c:if>

						<div class="card-footer text-center"><a class="btn btn-light" href="${pageContext.request.contextPath}/site/myPage.do">마이페이지</a></div>
     	 	 </div>
     	</div>
	</main>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>