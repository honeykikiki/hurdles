<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="리뷰 목록" scope="request"/>


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>${getName } 님의 리뷰 목록</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	<c:if test="${not empty reviewList}">
       <div class="table-responsive">
           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               <thead>
                   <tr>
                      
                       <th>식당명</th>
                       <th>내용</th>
                       <th>식당주소</th>
                       <th>작성일</th>
                       <th>평점</th>
                       <th>식당 전화번호</th>
                       <!--<th></th>  -->
                   </tr>
               </thead>
               <tbody>
					<c:forEach var="review"  items="${reviewList}">
						<tr>
							
							<td>${review.restaurantName }</td>
							<td>${review.reviewContent }</td>
							<td>${review.restaurantAdd1 } ${review.restaurantAdd2 }</td>
							<td>${review.createDate }</td>
							<td>${review.reviewScore }</td>
							<td>${review.restaurantTel }</td>
							<td>
								<a href="reviewDetail.do?reviewNo=${review.reviewNo }&memberNo=${member.memberNo}&restaurantNo=${review.restaurantNo}&ordersNo=${review.ordersNo}" class="btn btn-outline-primary">상세보기</a>
							</td>
							 <%--  <td><a href="/hurdles/site/reviewDel.do?reviewNo=${reviewDetail.reviewNo }" class="btn btn-light" >리뷰삭제하기</a></td> --%>
						</tr>
					</c:forEach>
               </tbody>
           </table>
       </div>
       </c:if>
         <c:if test="${empty reviewList}">
            <div class="alert alert-info text-center">
                <strong>리뷰 정보가 없습니다.</strong>
            </div>
        </c:if>
                   <div class="card-footer text-center"><a class="btn btn-light" href="${pageContext.request.contextPath}/site/myPage.do">마이페이지</a></div>

	</main>
	
	<script>
		if ("${member.memberNo}" == 0) {
			bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
			return;
		}
	</script>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>