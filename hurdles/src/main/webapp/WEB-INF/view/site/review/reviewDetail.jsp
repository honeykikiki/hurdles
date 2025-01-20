<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="리뷰상세보기" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>리뷰 상세보기</title>
    <jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
   
</head>

<body>
    <jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

    <main class="main container mt-5">
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-header text-center bg-primary text-white">
                <h4>리뷰 상세</h4>
            </div>
            <div class="card-body text-center">
                <!-- Restaurant Profile -->
                
                <%-- <img 
                    src="/upload/review/${reviewDetail.fileSaveName}" 
                    onerror="this.src='${pageContext.request.contextPath}/assets/img/image-error.png'" 
                    class="img-thumbnail rounded-circle mb-3" 
                    alt="Profile Image" 
                    width="150" 
                    height="150"
                > --%>
                
                <a href="restaurantDetail.do?restaurantNo=${reviewDetail.restaurantNo }"><h5 class="card-title mt-3">${reviewDetail.restaurantName}</h5></a>
                <a href="restaurantDetail.do?restaurantNo=${reviewDetail.restaurantNo }"><p class="card-text text-muted">구매한 상품명: ${reviewDetail.productName}</p></a>
                <p class="card-text">수량: <span class="fw-bold">${reviewDetail.ordersProductQty}</span></p>
                <p class="card-text">평점: <span class="fw-bold text-warning">&#9733; ${reviewDetail.reviewScore}</span></p>
                <p class="card-text">내용:</p>
                <blockquote class="blockquote">
                    <p class="mb-0">${reviewDetail.reviewContent}</p>
                </blockquote>
                ${reviewDetail.createDate }
            </div>
            			<%-- 		<div class="col-lg-4">
						<div class="swiper init-swiper">
							<script type="application/json" class="swiper-config">
								{
									"loop": true,
									"speed": 600,
									"autoplay": {
										"delay": 5000
									},
									"slidesPerView": "auto",
									"pagination": {
										"el": ".swiper-pagination",
										"type": "bullets",
										"clickable": true
									}
								}
							</script>
							<div class="swiper-wrapper">
								<c:forEach items="${fileList}" var="file">
									<div class="swiper-slide">
										<img 
											src="/upload/review/${reviewDetail.fileSaveName}"
											alt="Review Photo"
											class="img-fluid rounded restaurant-image"
											onerror="this.src='${pageContext.request.contextPath}/assets/img/image-error.png'"
										/>
									</div><!-- End testimonial item -->
								</c:forEach>

							</div>
							<div class="swiper-pagination"></div>
						</div>

						<c:if test="${fileList.size() == 0}" >
							<img 
								src="/upload/review/${reviewDetail.fileSaveName}"
								alt="Review Photo"
								class="img-fluid rounded restaurant-image"
								onerror="this.src='${pageContext.request.contextPath}/assets/img/image-error.png'"
							/>
						</c:if>
					</div> --%>
            <div class="card-footer text-center">
            	<!-- <button class="btn btn-light" onclick="history.back()">뒤로가기</button> -->
            	<a class="btn btn-light" href="myPage.do">마이페이지</a>
            	<a class="btn btn-light" href="reviewList.do?memberNo=${member.memberNo }">리뷰목록</a>
                <%-- <a href="reviewDelete.do?reviewNo=${reviewDetail.reviewNo }" class="btn btn-light" >리뷰삭제하기</a> --%>
            </div>
        </div>
    </main>
    <script>
			if ("${member.memberNo}" == 0) {
				bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
				return;
			}
	</script>

    <jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
    <jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
