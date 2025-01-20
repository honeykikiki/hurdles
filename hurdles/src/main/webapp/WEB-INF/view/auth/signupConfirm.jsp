<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="login" scope="request"/>
<c:set var="titleName" value="회원가입 완료" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>${titleName }</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/site/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
		<main class="main">
		    <div class="container-fluid">
						<div class="container d-flex flex-column align-items-center justify-content-center min-vh-100">
							<div class="card text-center shadow-lg p-3">
									<div class="card-body">
											<h1 class="display-4 text-success">${memberName}님 회원가입 완료!</h1>
											<p class="lead mt-3">회원가입이 성공적으로 완료되었습니다.</p>
											<p>환영합니다! 로그인하여 서비스를 이용하세요.</p>
											<a href="${pageContext.request.contextPath}/auth/login.do" class="btn btn-success mt-4">로그인 페이지로 이동</a>
									</div>
							</div>
					</div>
    		</div>
		</main>

     <!-- /.container-fluid -->


     <!-- Footer -->
	 <%-- <jsp:include page="/WEB-INF/view/site/layout/footer.jsp" /> --%>
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>


</html>