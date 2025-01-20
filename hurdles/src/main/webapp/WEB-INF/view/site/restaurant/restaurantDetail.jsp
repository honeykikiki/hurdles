<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nav" value="restaurant" scope="request"/>
<c:set var="titleName" value="식당 상세보기" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>데모 ${titleName}</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
		<style>
			.map-container {
				width: 100%;
				height: 400px;
			}

			.profile-img {
				width: 40px;
				height: 40px;
				border-radius: 50%;
				object-fit: cover;
			}
		</style>
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
			<div class="container-fluid">
				<div class="container my-5">
				<!-- Restaurant Info -->
				<div class="row mb-4">
					<div class="col-lg-4">
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
											src="/upload/restaurant/${file.fileSaveName}"
											alt="Restaurant Photo"
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
								src="/upload/restaurant/${file.fileSaveName}"
								alt="Restaurant Photo"
								class="img-fluid rounded restaurant-image"
								onerror="this.src='${pageContext.request.contextPath}/assets/img/image-error.png'"
							/>
						</c:if>
					</div>

					<div class="col-lg-6">
						<h1 id="restaurant-name">
							${restaurant.restaurantName}
							<c:if test="${member.memberNo == restaurant.memberNo}" >
								<a href="${pageContext.request.contextPath}/owner/ownRestaurantDetail.do?restaurantNo=${restaurant.restaurantNo }" class="btn btn-warning ms-2">관리하기</a>
							</c:if>
						</h1>
						<p><strong>카테고리 :</strong> <span id="restaurant-category">${restaurant.resturantCodeName}</span></p>
						<%-- <p><strong>주소 :</strong> <span >${restaurant.restaurantAdd1} ${restaurant.restaurantAdd2 }</span> <a href="https://map.naver.com/?lng=${restaurant.restaurantY }&lat=${restaurant.restaurantX }&title=${restaurant.restaurantName}" target="_blank">네이버 지도 바로가기</a></p> --%>
						<p><strong>주소 :</strong> <span >${restaurant.restaurantAdd1} ${restaurant.restaurantAdd2 }</span></p>
						
						<p>
							⭐ 
							<span id="restaurant-rating"><fmt:formatNumber value="${restaurant.score}" pattern="#.##"/></span>
							(<span id="review-count">${restaurant.reviewCnt} 리뷰</span>)
						</p>
						<div>
							<strong>식당 설명</strong> 
							<p id="food-categories">${restaurant.restaurantDes}</p>
						</div>

					</div>
					<div class="col-2">
						<a class="btn btn-danger mb-3 login-required" data-member-no="${member.memberNo}" href="question.do?restaurantNo=${restaurant.restaurantNo}">문의 하기</a>
						
						<c:if test="${restaurant.pick == 0}" >
							<button class="btn btn-outline-secondary mb-3 pick-btn" data-restaurant-no="${restaurant.restaurantNo}"data-member-no="${member.memberNo}">찜하기</button>
						</c:if>
						<c:if test="${restaurant.pick != 0}" >
							<button class="btn btn-primary mb-3 pick-btn" data-restaurant-no="${restaurant.restaurantNo}"data-member-no="${member.memberNo}">찜취소</button>
						</c:if>
						
						
					</div>
				</div>

				<!-- Menu -->
				<section id="menu" class="menu section">
					<!-- Section Title -->
					<div class="container section-title" data-aos="fade-up">
						<h2>Our Menu</h2>
						<p><span>Check Our</span> <span class="description-title">식당 메뉴</span></p>
					</div><!-- End Section Title -->

					<div class="container">
						<ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="100">

							<li class="nav-item">
								<a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#menu-starters">
									<h4>메뉴</h4>
								</a>
							</li><!-- End tab nav item -->

							<li class="nav-item">
								<a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-breakfast">
									<h4>예약 메뉴</h4>
								</a><!-- End tab nav item -->

							</li>
							<li class="nav-item">
								<a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-lunch">
									<h4>배송 메뉴</h4>
								</a>
							</li><!-- End tab nav item -->
						</ul>

						<div class="tab-content" data-aos="fade-up" data-aos-delay="200">
								<div class="tab-pane fade active show" id="menu-starters">
									<div class="tab-header text-center">
										<p>Menu</p>
										<h3>식당 메뉴</h3>
									</div>
									<div class="row gy-5">
										<c:forEach items="${menuList}" var="menu">
											<div class="col-lg-3 menu-item">
												<img 
													src="/upload/menu/${menu.fileSaveName}"
													class="img-fluid menu-img mb-2"
													alt=""
													onerror="this.src='${pageContext.request.contextPath  }/assets/img/image-error.png'"
												>
												<h4>${menu.menuName}</h4>
												<p class="ingredients">${menu.menuDes}</p>
												<p class="price">
													<fmt:formatNumber value="${menu.menuPrice}" pattern="#,###"/>원
												</p>
											</div><!-- Menu Item -->
										</c:forEach>

										<c:if test="${menuList.size() == 0}" >
											<div class="alert alert-secondary text-center">
													<strong>메뉴 정보가 없습니다.</strong>
											</div>
										</c:if>
									</div>
								</div>

								<!-- End Starter Menu Content -->
								<div class="tab-pane fade" id="menu-breakfast">
									<div class="tab-header text-center">
										<p>Menu</p>
										<h3>예약 메뉴</h3>
									</div>
									<div class="row gy-5">
										<c:forEach items="${reserveProductList}" var="reserveProduct">
											<div class="col-lg-3 menu-item">
												<img 
													src="/upload/menu/${reserveProduct.fileSaveName}"
													class="img-fluid menu-img mb-2"
													alt=""
													onerror="this.src='${pageContext.request.contextPath  }/assets/img/image-error.png'"
												>
												<h4>${reserveProduct.reserveProductName}</h4>
												<p class="ingredients">${reserveProduct.reserveProductDes}</p>
												<p class="price">
													<a href="reservationInsert.do?reserveProductNo=${reserveProduct.reserveProductNo}">예약하기</a>
												</p>
											</div><!-- Menu Item -->
										</c:forEach>
										
										<c:if test="${reserveProductList.size() == 0}" >
											<div class="alert alert-secondary text-center">
													<strong>예약 메뉴 정보가 없습니다.</strong>
											</div>
										</c:if>
									</div>
								</div><!-- End Starter Menu Content -->

								<div class="tab-pane fade" id="menu-lunch">
									<div class="tab-header text-center">
										<p>Menu</p>
										<h3>배송 메뉴</h3>
									</div>
									<div class="row gy-5">
										<c:forEach items="${productList}" var="product">
											<div class="col-lg-3 menu-item">
												<img 
													src="/upload/menu/${product.fileSaveName}"
													class="img-fluid menu-img mb-2"
													alt=""
													onerror="this.src='${pageContext.request.contextPath  }/assets/img/image-error.png'"
												>
												<h4>${product.productName}</h4>
												<p class="ingredients">${product.productDes}</p>
												<p class="price">
													<fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원
												</p>
												<button class="btn btn-warning cart-insert" data-product-no="${product.productNo}">장바구니 담기</button>
											</div><!-- Menu Item -->
										</c:forEach>

										<c:if test="${productList.size() == 0}" >
											<div class="alert alert-secondary text-center">
													<strong>배송 메뉴 정보가 없습니다.</strong>
											</div>
										</c:if>

									</div>
								</div><!-- End Starter Menu Content -->
						</div>
					</div>
				</section><!-- /Menu Section -->

				<hr>

				<!-- 쿠폰 -->
				<h2 class="mt-5">식당 쿠폰</h2>
				<div id="coupon-list" class="mb-4 row">
					<c:forEach items="${couponList}" var="coupon">
						<div class="col-4 mb-4">
							<div class="card">
								<div class="card-body">
									<h5>${coupon.couponName}</h5>
									<p>${coupon.couponDes}</p>
									<p>
										<strong>쿠폰 기간</strong> 
										${fn:substring(coupon.startDate, 0, 10)} ~ ${fn:substring(coupon.endDate, 0, 10)}
									</p>
									<p class="pb-0 mb-2">금액 : <fmt:formatNumber value="${coupon.couponPrice}" pattern="#,###"/>원</p>
									<%-- 발급 받은 쿠폰 확인 하기--%>
									<c:if test="${not empty member}">	
										<c:choose>
												<c:when test="${coupon.issued != null && coupon.issued != ''}">
														<button class="btn btn-secondary" disabled>발급 받은 쿠폰</button>
												</c:when>
												<c:otherwise>
														<button class="btn btn-primary coupon-issued" data-coupon-no="${coupon.couponNo}" data-member-no="${member.memberNo}" >쿠폰 발급 받기</button>
												</c:otherwise>
										</c:choose>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>

					<c:if test="${couponList.size() == 0}" >
						<div class="alert alert-secondary text-center">
                <strong>쿠폰 정보가 없습니다.</strong>
            </div>
					</c:if>
				</div>

				<hr>

				<!-- 리뷰 -->
				<h2 class="mt-5">리뷰</h2>
				<div id="review-list" class="row">
					<%-- 리뷰 VO 확인 하고 수정 하기 --%>
					<c:forEach items="${reviewList}" var="review">
						<div class="col-4 mb-4">
							<div class="card">
								<div class="card-body">
									<div class="d-flex align-items-center">
										<a href="memberDetail.do?memberNo=${review.memberNo}">
											<img class="img-profile rounded-circle"
													src="/upload/member/${review.fileSaveName}" 
													onerror="this.src='${pageContext.request.contextPath}/assets/img/undraw_profile.svg'" 
													width="30px"
												>
												<span class="ms-2 me-2">${review.memberName}</span>
										</a>
											<c:if test="${not empty member && member.memberNo != review.memberNo}">
												<button data-member-no="${review.memberNo}" class="btn btn-sm btn-outline-secondary ms-2 follow ${review.followNo == 0 ? '' : 'd-none'}">팔로우</button>
												<button data-member-no="${review.memberNo}" class="btn btn-sm btn-outline-secondary ms-2 follower ${review.followNo != 0 ? '' : 'd-none'}">팔로우 취소</button>
											</c:if>
									</div>
									<p class="mt-2">${review.reviewContent}</p>
									<div>
										<p>⭐ ${review.reviewScore}점</p>
									</div>
									<div class="d-flex justify-content-between">
										<small>${fn:substring(review.createDate, 0, 10)}</small>
										<a class="review-report"
											style="cursor: pointer"
											data-review-no="${review.reviewNo}"
											data-target-member-no="${review.memberNo}"
										>신고하기</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

					<c:if test="${reviewList.size() == 0}" >
						<div class="alert alert-secondary text-center">
                <strong>리뷰 정보가 없습니다.</strong>
            </div>
					</c:if>
				</div>

				<!-- Map -->
				<div class="map-container mt-4 mb-4" id="map"></div>
			</div>
		</main>

	<!-- 장바구니 -->
	<div class="modal fade" id="cartModal" tabindex="-1" role="dialog">
		<div class="modal-dialog  modal-md" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">장바구니</h5>
				</div>
				<div class="modal-body">
					<div class="mb-4">
						<label for="productQty" class="form-label">수량</label>
						<input name="productQty" type="number" class="form-control" required="required" min="1" max="10" value="1">
						<div class="invalid-feedback">수량을 입력해주세요</div>
					</div>
				</div>
				<div class="modal-footer border-0 pt-0">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button class="btn btn-primary" type="button">장바구니 담기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 장바구니 바로가기 -->
	<div class="modal fade" id="cartMoveModal" tabindex="-1" role="dialog">
		<div class="modal-dialog  modal-md" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">장바구니</h5>
				</div>
				<div class="modal-body">
					<p>장바구니로 이동 하시겠습니까?</p>
				</div>
				<div class="modal-footer border-0 pt-0">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<a href="cartList.do" class="btn btn-primary" >장바구니로 이동</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 리뷰 신고 -->
	<div class="modal fade" id="reviewReportModal" tabindex="-1" role="dialog">
		<div class="modal-dialog  modal-md" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">리뷰 신고</h5>
				</div>
				<div class="modal-body">
					<div class="mb-4">
						<label for="reviewReportDes" class="form-label">리뷰 신고 내용</label>
						<input name="reviewReportDes" type="type" class="form-control" required>
						<div class="invalid-feedback">신고내용을 10자 이상 입력해주세요</div>
					</div>
				</div>
				<div class="modal-footer border-0 pt-0">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button class="btn btn-danger" type="button">신고하기</button>
				</div>
			</div>
		</div>
	</div>

	<%-- 신고 완료 모달 --%>
	<div class="modal fade" id="reviewReportConfirmModal" tabindex="-1" role="dialog">
		<div class="modal-dialog  modal-md" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">리뷰 신고 완료</h5>
				</div>
				<div class="modal-body">
					리뷰 신고가 완료 되었습니다.
				</div>
				<div class="modal-footer border-0 pt-0">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<%-- 네이버 지도 --%>
	<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=eze5i4kjnp"></script>
	<script>
	  let mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일
		if (mapDiv) {
			//옵션 없이 지도 객체를 생성하면 서울 시청을 중심으로 하는 16 레벨의 지도가 생성됩니다.
			let mapOptions = {
				center: new naver.maps.LatLng("${restaurant.restaurantX}", "${restaurant.restaurantY}"),
				zoom: 16,
				draggable: false,
				disableTwoFingerTapZoom: false,
				disableDoubleTapZoom: false,
				disableDoubleClickZoom: false,
				scrollWheel: false,
			};

			let map = new naver.maps.Map(mapDiv, mapOptions);

			let marker = new naver.maps.Marker({
				position: new naver.maps.LatLng("${restaurant.restaurantX}", "${restaurant.restaurantY}"),
				map: map,
				title: '${restaurant.restaurantName}',
			});
		}
	</script>

	<script type="text/javascript">
			// 신고하기
			document.querySelectorAll(".review-report").forEach((item) => {
				item.addEventListener("click", async (e) => {
						if ("${member.memberNo}" == 0) {
							bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
							return;
						}

						let modal = document.querySelector("#reviewReportModal");
						bootstrap.Modal.getOrCreateInstance(modal).show();

						// 이벤트 리스너 추가
						const dangerButton = modal.querySelector(".btn-danger");
						// 핸들러를 분리
						const handleDangerClick = async () => {
								const inputField = document.querySelector("input[name=reviewReportDes]");
								if (inputField.value.length <= 10) { // 길이가 10 이하인지 확인
										inputField.classList.add("is-invalid");
										return;
								}

								const { reviewNo, targetMemberNo } = e.target.dataset;
								const formData = new FormData();
								formData.append("reviewNo", reviewNo);
								formData.append("targetMemberNo", targetMemberNo);
								formData.append("memberNo", "${member.memberNo}");
								formData.append("reviewReportDes", inputField.value);

								try {
										let response = await fetch("/hurdles/site/reviewReportInsert.do", {
												method: "POST",
												body: formData,
										});

										if (!response.ok) throw new Error("Failed to fetch data");

										let data = await response.json();
										if (data != null && data.item) {
												let item = data.item;

												if (item === "success") {
														inputField.value = "";
														bootstrap.Modal.getOrCreateInstance(modal).hide();
														bootstrap.Modal.getOrCreateInstance(document.querySelector("#reviewReportConfirmModal")).show();
												}
										}
								} catch (error) {
										console.error("Error fetching data:", error);
								}
								dangerButton.removeEventListener("click", handleDangerClick);
						};

						dangerButton.addEventListener("click", handleDangerClick);

						// 이벤트 리스너 제거
				})
			})

			// 찜하기
			document.querySelectorAll(".pick-btn").forEach((item) => {
				item.addEventListener("click", async (e)=> {
            if ("${member.memberNo}" == 0) {
              bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
              return;
            }

            const { restaurantNo, memberNo } = e.target.dataset;
						const bPick = item.innerText === "찜취소";
						const url = bPick ? "restrauntPickDelete.do" : "restrauntPick.do";

						const formData = new FormData();
						formData.append("restaurantNo", restaurantNo);
						formData.append("memberNo", memberNo);
            let response = await fetch(
							"/hurdles/site/" + url,
              {method: "POST", body: formData}
            );

            if (!response.ok) throw new Error("Failed to fetch data");
            let data = await response.json(); // JSON 형태로 ���� 처리

            if (data != null && data.item) {
              let item = data.item;
              if (item == "success") {
								if (bPick) {
									e.target.classList.add("btn-outline-secondary");
									e.target.classList.remove("btn-primary");
									e.target.innerText = "찜하기";
								} else {
									e.target.classList.remove("btn-outline-secondary");
									e.target.classList.add("btn-primary");
									e.target.innerText = "찜취소";
								}
              }
            }
          })
			})

			// 장바구니 담기
			document.querySelectorAll(".cart-insert").forEach((item) => {
				item.addEventListener("click", async (e) => {
						if ("${member.memberNo}" == 0) {
							bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
							return;
						}

						const { productNo } = e.target.dataset;
						let modal = document.querySelector("#cartModal");
						bootstrap.Modal.getOrCreateInstance(modal).show();
						
						// Add the event listener
						const primaryButton = modal.querySelector(".btn-primary");
						const handleClick = async () => {
								const formData = new FormData();
								formData.append("productNo", productNo);
								formData.append("productQty", document.querySelector("input[name=productQty]").value);
								formData.append("memberNo", "${member.memberNo}");

								try {
										let response = await fetch(`/hurdles/site/cartInsert.do`, {
												method: "POST",
												body: formData,
										});

										if (!response.ok) throw new Error("Failed to fetch data");
										let data = await response.json();

										if (data != null && data.item) {
												let item = data.item;
												if (item === "success") {
														document.querySelector("input[name=productQty]").value = 1;
														bootstrap.Modal.getOrCreateInstance(document.querySelector("#cartMoveModal")).show();
												}
										}
								} catch (error) {
										console.error("Error fetching data:", error);
								}

								bootstrap.Modal.getOrCreateInstance(modal).hide();
								// Remove the event listener
								primaryButton.removeEventListener("click", handleClick, false);
						};

	
						primaryButton.addEventListener("click", handleClick);

				})
			})

			// 쿠폰 발급
			document.querySelectorAll(".coupon-issued").forEach((item) => {
				item.addEventListener("click", async (e)=> {
						if ("${member.memberNo}" == 0) {
							bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
							return;
						}

						const { couponNo, memberNo } = e.target.dataset;
						const formData = new FormData();
						formData.append("couponNo", couponNo);
						formData.append("memberNo", memberNo);
						try {
							// 내가 빨로우 할 넘버
							let response = await fetch(`/hurdles/site/couponIssued.do`,
									{method: "POST", body: formData}
							);

							if (!response.ok) throw new Error("Failed to fetch data");
						
							let data = await response.json(); // JSON 형태로 응답 처리
							
							if (data != null && data.item) {
								if (data.item == "success") {
									item.disabled = true;
									item.classList.add("btn-secondary");
									item.classList.remove("btn-primary");
								}
							}
						} catch (error) {
							console.error("Error fetching data:", error);
						}
				})
			})

			// 팔로우
			document.querySelectorAll(".follow").forEach((item) => {
				item.addEventListener("click", async (e)=> {
					const { dataset : { memberNo } } = e.target;
					console.log(memberNo);
					let result = await follow(memberNo);
					if (result) {
						followBtnChange(".follow", memberNo, false);
						followBtnChange(".follower", memberNo, true);
					}
				})
			})

			// 팔로워
			document.querySelectorAll(".follower").forEach((item) => {
				item.addEventListener("click", async (e)=> {
					const { dataset : { memberNo } } = e.target;
					console.log(memberNo);
					let result = await cancelFollow(memberNo);
					if (result) {
						followBtnChange(".follower", memberNo, false);
						followBtnChange(".follow", memberNo, true);
					}
				})
			})

			function followBtnChange(className, memberNo, bRemove) {
				document.querySelectorAll(className).forEach((item) => {
						if (item.dataset.memberNo == memberNo) {
							
							bRemove ? item.classList.remove("d-none") : item.classList.add("d-none")
						}
					});
			}

			async function follow(memberNo) {
					try {
						// 내가 빨로우 할 넘버
						let response = await fetch(
								`/hurdles/site/followMember.do?memberNo=` + memberNo,
							{method: "POST"}
						);
						if (!response.ok) throw new Error("Failed to fetch data");
					
						let data = await response.json(); // JSON 형태로 응답 처리
						
						if (data != null && data.item) {
							let item = data.item;
							
							
							if (item == "success") {
								// document.querySelector("#follow").classList.add("d-none");
								// document.querySelector("#cancelFollow").classList.remove("d-none");
								// let followerCnt = document.querySelector("#followerCnt");
								// +followerCnt.innerText++;
								return true
							}
						}
					} catch (error) {
						console.error("Error fetching data:", error);
						return false;
					}
				}
				
			async function cancelFollow(memberNo) {
					try {
						// 내가 빨로우 끊을 넘버
							let response = await fetch(
										`/hurdles/site/cancelFollowMember.do?memberNo=` + memberNo,
									{method: "POST"}
								);
							if (!response.ok) throw new Error("Failed to fetch data");
					
						let data = await response.json(); // JSON 형태로 응답 처리
						console.log(data);
						if (data != null && data.item) {
							let item = data.item;
							
							if (item == "success") {
								return true
							}
						}
					}catch (error) {
							console.error("Error fetching data:", error);
							return false;
						}
				}
			</script>
	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>
	

