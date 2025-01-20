<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>에러 페이지</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>

    <main class="main text-center mx-5 my-5">
        <div class="container-fluid">
            <h1>필수 파라미터 누락</h1>
            <p>${errorMessage}</p>
            <button type="button" class="btn btn-outline-dark" onclick="javasript:history.back();"> 뒤로가기</button>
        </div>
	</main>
	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>