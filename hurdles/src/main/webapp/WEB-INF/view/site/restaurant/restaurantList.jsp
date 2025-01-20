<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="restaurant" scope="request"/>
<c:set var="titleName" value="식당목록" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingPageMap" property="" value="${paginationInfo.getPageMap()}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>식당목록</title>
    <jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
    <style>
        .card {
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }

        .card:hover {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.6);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .card-footer {
            background-color: #f8f9fa;
        }
        
        
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

    <!-- Begin Page Content -->
    <div class="container-fluid">
        <form class="d-flex flex-wrap align-items-center form-search" action="restaurantList.do" method="get">
        	
            <input type="text" class="form-control w-25 me-2 mb-2" name="restaurantName" id="restaurantName1" placeholder="식당 이름을 입력하세요." value="${pagingOption['restaurantName']}" />
            <input type="text" class="form-control w-25 me-2 mb-2" name="restaurantAdd1" id="restaurantAdd1" placeholder="주소를 입력하세요." value="${pagingOption['restaurantAdd1']}" />

			 <select class="form-control w-25 me-2 mb-2"  name="orderScore" id ="score">
				<option ${pagingOption['orderScore'] == '0' ? 'selected' : ''} value="0">전체 식당</option>
        		<option ${pagingOption['orderScore'] == '1' ? 'selected' : ''}  value="1">평점 높은 순</option>
        		<option ${pagingOption['orderScore'] == '2' ? 'selected' : ''}  value="2">평점 낮은 순</option>
        	</select>
            <button type="submit" class="btn btn-primary submit mb-2">검색</button>
        	                
        </form>
        
        <form class="d-flex flex-wrap align-items-center form-search" action="restaurantList.do" method="get">
        	<select class="form-control w-25 me-2 mb-2"  name="restaurantCodeNo" id ="restaurantCodeNo">
        		<option ${pagingOption['orderScore'] == '0' ? 'selected' : ''} value="0">카테고리 전체</option>
					<option ${pagingOption['restaurantCodeNo'] == '2' ? 'selected' : ''} value="2">중식</option>
					<option ${pagingOption['restaurantCodeNo'] == '3' ? 'selected' : ''} value="3">일식</option>
					<option ${pagingOption['restaurantCodeNo'] == '4' ? 'selected' : ''} value="4">치킨</option>
					<option ${pagingOption['restaurantCodeNo'] == '5' ? 'selected' : ''} value="5">패스트푸드</option>
					<option ${pagingOption['restaurantCodeNo'] == '6' ? 'selected' : ''} value="6">양식</option>
					<option ${pagingOption['restaurantCodeNo'] == '7' ? 'selected' : ''} value="7">카페디저트</option>
					<option ${pagingOption['restaurantCodeNo'] == '8' ? 'selected' : ''} value="8">분식</option>
					<option ${pagingOption['restaurantCodeNo'] == '9' ? 'selected' : ''} value="9">야식</option>
					<option ${pagingOption['restaurantCodeNo'] == '10' ? 'selected' : ''} value="10">아시안</option>
					<option ${pagingOption['restaurantCodeNo'] == '11' ? 'selected' : ''} value="11">한식</option>
        	</select>
        	 <button type="submit" class="btn btn-primary submit mb-2">카테고리별 검색</button>
        </form>

        <p class="mt-4">
            총 <strong class="h5 number">${paging.getTotalRecordCount()}</strong>개
        </p>

        <div class="row mt-4">
            <c:forEach var="restaurant" varStatus="statusResult" items="${restaurantList}">
                <a href="restaurantDetail.do?restaurantNo=${restaurant.restaurantNo}" class="col-md-3 mb-4">
                <div class="card h-100">
                    <img src="/upload/restaurant/${restaurant.fileSaveName}" class="card-img-top" alt="식당 이미지" onerror="this.src='${pageContext.request.contextPath}/assets/img/image-error.png'">
                    <div class="card-body">
                        <h5 class="card-title text-primary">${restaurant.restaurantName}</h5>
                        <p class="card-text"><i class="bi bi-geo-alt"></i> 주소: ${restaurant.restaurantAdd1}</p>
                        <p class="card-text"><i class="bi bi-telephone"></i> 전화번호: ${restaurant.restaurantTel}</p>
                        <p class="card-text"><i class="bi bi-star-fill text-warning"></i> 평점: <fmt:formatNumber value="${restaurant.score}" pattern="#.##"/></p>
                        
                    </div>
                </div>
            </a>
            </c:forEach>
        </div>

        <page-navi 
            url="restaurantList.do?${pagingOption}${searchVo.orderScore}${searchVo.restaurantCodeNo}"
            current="${paging.getPageNo()}" 
            total="${paging.getTotalPageCount()}"/>
    </div>

    <jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
    <jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>
