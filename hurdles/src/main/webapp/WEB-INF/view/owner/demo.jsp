<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="main" scope="request"/>
<c:set var="titleName" value="메인" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>사장님 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/owner/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/owner/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">
		 여기에 정보를넣어주세용~~
     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>


</html>