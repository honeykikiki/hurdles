<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="restaurantList" scope="request"/>
<c:set var="titleName" value="식당 목록" scope="request"/>
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
     <form class="d-flex flex-wrap align-items-center form-search" action="ownRestaurantList.do" method="get">
        <input type="text" class="form-control w-25 mr-2 mb-2" name="restaurantName" id="restaurantName1" placeholder="식당 이름을 입력하세요." value="${pagingOption['restaurantName']}" />
        <input type="text" class="form-control w-25 mr-2 mb-2" name="restaurantAdd1" id="restaurantAdd1" placeholder="주소를 입력하세요." value="${pagingOption['restaurantAdd1']}" />
				<select class="form-control w-25 mr-2 mb-2"  name="orderScore" id ="score">
					<option ${pagingOption['orderScore'] == '0' ? 'selected' : ''} value="0">전체 식당</option>
					<option ${pagingOption['orderScore'] == '1' ? 'selected' : ''}  value="1">평점 높은 순</option>
					<option ${pagingOption['orderScore'] == '2' ? 'selected' : ''}  value="2">평점 낮은 순</option>
        </select>
        <button type="submit" class="btn btn-primary submit mb-2">검색</button>
			</form>
        
			<form class="d-flex flex-wrap align-items-center form-search" action="ownRestaurantList.do" method="get">
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

		<p class="mb-1">
			총 <strong class="h5 number">${paging.getTotalRecordCount()}</strong>개	
		</p>

    	
       <div class="table-responsive">
           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               <thead>
                   <tr>
                       <th>순번</th>
                       <th>식당이름</th>                       
                       <th>주소</th>
                       <th>전화번호</th>
                       <th>평점</th>
                       <th>생성일</th>
                       <th>삭제여부</th>
                       <th></th>
                   </tr>
               </thead>
               <tbody>
					<c:forEach var="item" varStatus="statusResult" items="${restaurantList}">
						<tr>
							<td>${paging.getTotalRecordCount()-((paging['pageNo']-1) * paging['recordCountPerPage'] + statusResult.index)}</td>
							<td>${item.restaurantName }</td>
							<td>${item.restaurantAdd1 } ${item.restaurantAdd2 }</td>
							<td>${item.restaurantTel }</td>
							
							<td><fmt:formatNumber value="${item.score}" pattern="#.#"/>점</td>
							<td>${item.createDate }</td>
							<td>${item.delyn }</td>
							<td>
									<a href="ownRestaurantDetail.do?restaurantNo=${item.restaurantNo }" class="btn btn-outline-primary">상세보기</a> 
							</td>
						</tr>
					</c:forEach>
               </tbody>
           </table>
       </div>
       
       <page-navi 
   		url="ownRestaurantList.do?${pagingOption}"
   		current="${paging.getPageNo()}" 
   		total="${paging.getTotalPageCount()}"/>
     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>
</html>


