<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="notification" scope="request"/>
<c:set var="titleName" value="공지사항" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>공지사항</title>
<style>
#title{
	color: black;
	text-decoration: none;
}

</style>	

	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
	
<style>
        /* 테이블의 NO 열의 공간을 줄이는 CSS */
.table th, .table td {
padding: 8px; /* 테이블 셀의 여백을 줄여서 공간을 더 아껴줌 */
    }
        
 .table th:first-child, .table td:first-child {
  width: 50px; /* NO 열의 너비를 고정하여 공간을 줄임 */
     }
    </style>
	
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid">
  	     <h1>공지사항</h1>
			<div>	
  	     	<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">NO</th> 
			      <th scope="col">제목</th>

			    </tr>
			  </thead>
			  <tbody>
<!-- 			  컨트롤러에서 넣어준이름 -->
			  	<c:forEach var="list" items="${list}">
			    <tr>
<%-- 				  <input type="hidden" name="boardNo" value="${list.boardNo}" /> --%>
			      <th scope="row">${list.rm}</th>
			      <td><a id = title href ="/hurdles/site/notificationDetail.do?boardNo=${list.boardNo}">${list.boardTitle}</a></td>

			    </tr>
			    	</c:forEach>
			
			  </tbody>
			</table>
		
     	
<!-- 		<a href="notificationInsert.do" class="btn-getstarted w-100">글쓰기</a> -->
<!-- 		<a href="notificationUpdate.do" class="btn-getstarted w-100">글수정</a> -->
			</div> <br><br><br><br><br><br><br><br>
		</div>
	</main>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>