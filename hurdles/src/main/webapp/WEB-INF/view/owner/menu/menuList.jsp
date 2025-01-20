<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="restaurant" scope="request"/>
<c:set var="titleName" value="${restaurantName} - 메뉴 목록" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>관리자 ${titleName }</title>
	<jsp:include page="/WEB-INF/view/owner/layout/prestyle.jsp" />
</head>

<body>
    <!-- Sidebar -->
	<jsp:include page="/WEB-INF/view/owner/layout/header.jsp" />
    <!-- End of Sidebar -->

    <!-- Begin Page Content -->
	<div class="container-fluid">
        <div class="d-flex g-3">
            <a href="menuInsert.do?restaurantNo=${restaurantNo }&restaurantName=${restaurantName}" class="btn btn-primary mr-3">메뉴 추가</a>
            <a href="ownRestaurantDetail.do?restaurantNo=${restaurantNo }" class="btn btn-outline-dark">식당 상세보기</a> 
        </div>
        <div class="table-responsive mt-4">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>메뉴이름</th>
                        <th>메뉴가격</th>
                        <th>메뉴설명</th>
                        <th>생성일</th>
                        <th>삭제여부</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="item" varStatus="statusResult" items="${menuList}">
                    <tr>
                        <td>${item.menuName }</td>
                        <td><fmt:formatNumber value="${item.menuPrice}" pattern="#,###"/>원</td>
                        <td>${item.menuDes }</td>
                        <td>${item.createDate }</td>
                        <td>${item.delyn }</td>
                        <td>
                            <a href="menuDetail.do?menuNo=${item.menuNo }&restaurantName=${restaurantName}" class="btn btn-outline-primary">상세보기</a>
                            <a href="menuUpdate.do?menuNo=${item.menuNo}&restaurantName=${restaurantName}" class="btn btn-outline-primary">수정</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <c:if test="${menuList.size() == 0}" >
                <div class="alert alert-secondary text-center">
                    <strong>메뉴 정보가 없습니다.</strong>
                </div>
            </c:if>
        </div>
    </div>
    
	<jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>
</html>


