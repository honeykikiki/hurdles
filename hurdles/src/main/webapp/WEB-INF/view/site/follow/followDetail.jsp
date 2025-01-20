<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="titleName" value="팔로우 상세보기" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>팔로우 상세조회</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

<main class="main py-5">
    <div class="container">
        <!-- Debugging: Print followDetail (optional for development) -->
        <!-- <c:out value="${followDetail}" escapeXml="false" /> -->

        <!-- Title -->
        <div class="text-center mb-4">
            <h2 class="fw-bold">${getMemberName }님의 팔로우 목록</h2>
        </div>

        <!-- Check if followDetail is not empty -->
        <c:if test="${not empty followDetail}">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <c:forEach var="follow"  varStatus="statusResult" items="${followDetail}">
                
                    <div class="col">
                        <div class="card shadow-sm h-100">
                            <div class="card-body text-center">
                                <!-- Member Name -->
                                <h5 class="card-title">
                                    <a href="memberDetail.do?memberNo=${follow.memberNo}" class="text-decoration-none text-dark">
                                        ${follow.memberName}
                                    </a>
                                </h5>
                                <!-- File Path or Placeholder -->
                                <p>
                                    <a href="memberDetail.do?memberNo=${follow.memberNo}">
                                        <img 
                                            src="${follow.filePath}" 
                                            alt="${follow.memberName}" 
                                            class="img-thumbnail rounded-circle" 
                                            style="width: 100px; height: 100px;" 
                                            onerror="this.src='${pageContext.request.contextPath}/assets/img/undraw_profile.svg';"
                                        >
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <!-- Display message when followDetail is empty -->
        <c:if test="${empty followDetail}">
            <div class="alert alert-info text-center">
                <strong>팔로우 정보가 없습니다.</strong>
            </div>
        </c:if>
    </div>
        <page-navi 
   		url="followList.do?${pagingOption}"
   		current="${paging.getPageNo()}" 
   		total="${paging.getTotalPageCount()}"/>
             <div class="text-center">
                <strong> <button class="btn btn-light" onclick="history.back()">뒤로가기</button></strong>
            </div>
            
  
</main>
	<script type="text/javascript">

	</script>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>