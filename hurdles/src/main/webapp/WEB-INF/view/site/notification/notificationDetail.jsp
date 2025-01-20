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
	
	<title>공지사항 상세페이지</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid">
  	      <h1>공지사항</h1>           
			  <table class="table table-hover">
			    <thead>
			      <tr>
			        <th colspan="2"><h3>${detail.boardTitle}</h3></th>
			        
			      </tr>
			      <tr>
			      	<td style="width: 100px;">작성일 :</td>
			        <td>${detail.createDate}</td>
			      </tr>
			      <tr>
			      	<td>작성자 : </td>
			      	<td>${detail.memberId}</td>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			      	<td colspaln ="2">
			      	<div style="font-size: 18px; padding: 20px; border-radius: 8px;">
			        <td>${detail.boardContent}</td> 
			      	</div>
			      	</td>
			      </tr>
			      
			    </tbody>
			  </table>
     	</div>
		<a id = title href ="/hurdles/site/notificationList.do"> <button type="button" class ="btn-getstarted">이전</button></a>
	</main>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>