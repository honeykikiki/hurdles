<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="찜한 식당 목록" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>내가 찜한 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <style>
        .form-search input {
            border-radius: 50px;
        }
        .form-search .btn {
            border-radius: 50px;
        }
        .card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }
        .card-img-top {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            object-fit: cover;
            height: 200px;
        }
        .card-footer {
            background-color: #f8f9fa;
            border-top: 1px solid #e9ecef;
        }
        .card-footer .btn {
            border-radius: 50px;
        }
        .number {
            font-size: 1.2rem;
            color: #007bff;
        }
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/view/site/layout/header.jsp" />
	<main class="main">
	<c:if test="${not empty restaurantList}">
    <!-- Begin Page Content -->
    <div class="container-fluid py-4">
        <h2 class="mb-4 text-center text-primary">${titleName}</h2>

        <form class="d-flex flex-wrap align-items-center form-search mb-4" action="restaurantList.do" method="get">
            <input type="text" class="form-control w-25 mr-2 mb-2" name="restaurantName" id="restaurantName" placeholder="식당 이름을 입력하세요." value="${pagingOption['restaurantName']}" />
            <input type="text" class="form-control w-25 mr-2 mb-2" name="restaurantAdd1" id="restaurantAdd1" placeholder="주소를 입력하세요." value="${pagingOption['restaurantAdd1']}" />
            <button type="submit" class="btn btn-primary submit mb-2"><i class="bi bi-search"></i> 검색</button>
        </form>

        <p class="mt-4">
            총 <strong class="h5 number">${paging.getTotalRecordCount()}</strong>개
        </p>

        <div class="row">
            <c:forEach var="restaurant" varStatus="statusResult" items="${restaurantList}">
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src="/upload/restaurant/${restaurant.fileSaveName}" class="card-img-top" alt="식당 이미지" onerror="this.src='${pageContext.request.contextPath}/assets/img/image-error.png'">
                        <div class="card-body">
                            <h5 class="card-title text-primary">${restaurant.restaurantName}</h5>
                            <p class="card-text"><i class="bi bi-geo-alt"></i> 주소: ${restaurant.restaurantAdd1}</p>
                            <p class="card-text"><i class="bi bi-telephone"></i> 전화번호: ${restaurant.restaurantTel}</p>
                            <p class="card-text"><i class="bi bi-star-fill text-warning"></i> 평점: <fmt:formatNumber value="${restaurant.score}" pattern="#.##"/></p>
                        </div>
                        <div class="card-footer text-center">
                            <a href="restaurantDetail.do?restaurantNo=${restaurant.restaurantNo}" class="btn btn-primary w-100"><i class="bi bi-info-circle"></i> 상세보기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        </div>
	</c:if>
	
	    <c:if test="${empty restaurantList}">
            <div class="alert alert-info text-center">
                <strong>찜한 식당이 없습니다.</strong>
            </div>
        </c:if>
        <div>
		  <page-navi 
            url="pickRestaurantList.do?${pagingOption}${pageMap.memberNo}"
            current="${paging.getPageNo()}" 
            total="${paging.getTotalPageCount()}"/>
    	</div>
    	</main>

    <jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
    <jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>
