<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="nav" value="restaurant" scope="request"/>
<c:set var="titleName" value="주문성공" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>결제완료</title>
	<!-- Bootstrap CSS -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main py-5">
  	    <div class="container">
			<div class="text-center">
				<div class="card shadow-sm">
					<div class="card-body">
						<h1 class="h3 mb-3 font-weight-bold text-success">결제완료</h1>
						<p class="lead">
							결제가 정상적으로 처리되었습니다.
						</p>
						
						<table class="table table-bordered mt-4">
							<thead class="thead-light">
								<tr>
									<th>항목</th>
									<th>정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>상품명</td>
									<td>${result.itemName}</td>
								</tr>
								<tr>
									<td>결제금액</td>
									<td>${result.total} 원</td>
								</tr>
								<tr>
									<td>결제수단</td>
									<td>카카오페이</td>
								</tr>
								<tr>
									<td>결제일시</td>
									<fmt:parseDate value="${result.approvedAt}" pattern="yyyy-MM-dd" var="parseDateTime" type="both" />
									<td><fmt:formatDate value="${parseDateTime}" pattern="yyyy-MM-dd" /></td>
									<%-- <td>${result.approvedAt}</td> --%>
								</tr>
							</tbody>
						</table>
						
						<div class="alert alert-success mt-4" role="alert">
						사장님이 주문을 접수한 후에는 주문 취소가 불가능합니다.
						</div>

						<a href="/hurdles/site/payList.do" class="btn btn-outline-danger" >결제내역 확인</a>
						<a href="/hurdles/site/myPage.do" class="btn btn-danger">마이페이지</a>
					</div>
				</div>
			</div>
     	</div>
	</main>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>