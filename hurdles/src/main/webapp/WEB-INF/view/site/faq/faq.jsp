<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="faq" scope="request"/>
<c:set var="titleName" value="메인" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>FAQ</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
	<style type="text/css">
/* 	.title{ */
/* 	color: black; */
/* 	font-family: Ge */
/* 	} */

	</style>
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid" >
  			 <div class="accordion mx-4" id="accordionExample">
  	 
				  <c:forEach var="item"  varStatus="statusResult" items="${faqList }">
				  	<div class="accordion-item">
					    <h2 class="accordion-header">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${statusResult.index }" aria-expanded="false" aria-controls="collapseThree">
					      Q. <span class="title"> ${item.boardTitle }</span>
					      </button>
					    </h2>
					    <div id="collapse${statusResult.index }" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					       A. <span class="title"> ${item.boardContent }</span>
					      </div>
					    </div>
					  </div>
				  </c:forEach>
				  <br>  
				</div>
     	</div>
	</main>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>