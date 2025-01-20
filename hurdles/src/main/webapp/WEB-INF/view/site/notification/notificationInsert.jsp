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
	
	<title>글쓰기</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid">
  	     <form action="/site/notificationInsert.do" method="post">
  	     <input type="hidden" name ="memberNo" value="${memberNo}">
		 <input type ="text" name="boardTitle" >
		 <input type ="text" name="boardContent" >
  	     </form>
     	</div>
	</main>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>