<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="ownReviewList" scope="request"/>
<c:set var="titleName" value="리뷰 리스트" scope="request"/>
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
		   	<main class="main">
  	<c:if test="${not empty reviewList}">
       <div class="table-responsive">
           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               <thead>
                   <tr>
                      
                       <th>식당명</th>
                       <th>작성자명</th>
                       <th>리뷰내용</th>
                       <th>리뷰 점수</th>


                       <!--<th></th>  -->
                   </tr>
               </thead>
               <tbody>
					<c:forEach var="review"  items="${reviewList}">
						<tr>
							
							<td>${review.restaurantName }</td>
							<td>${review.memberName }
							<td>${review.reviewContent }</td>
							<td>${review.reviewScore }</td>
							<td>
								<form action="ownReviewReport.do" method="post">
									<input type="text" hidden="hidden" name="reviewNo" id="reviewNo" value="${review.reviewNo }">
									<input type="text" name="reviewReportDes" id="reviewReportDes"  placeholder="신고 사유를 입력해주세요">
									<input type="submit" value="신고하기">
								</form>
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
                   <div class="card-footer text-center">
            	<button class="btn btn-light" onclick="history.back()">뒤로가기</button>
              
            </div>

	</main>
     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>


</html>