<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="main" scope="request"/>
<c:set var="titleName" value="메인" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>허들 - 마슈</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body class="index-page">
	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />
  <main>

    <!-- Hero Section -->
    <section id="hero" class="hero section light-background">

      <div class="container">
        <div class="row gy-4 justify-content-center justify-content-lg-between">
          <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
            <h1 data-aos="fade-up">맛있는 선택,<br>행복한 하루<br>Mashu<span class="red-boll">.</span></h1>
            <p data-aos="fade-up" data-aos-delay="100">당신의 한 끼를 특별하게, Mashu<span class="red-boll">.</span>가 책임집니다!</p>
          </div>
          <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
            <img src="${pageContext.request.contextPath}/assets/img/hero-img.png" class="img-fluid animated" alt="">
          </div>
        </div>
      </div>

    </section><!-- /Hero Section -->

    <!-- About Section -->
    <section id="about" class="about section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>About Us<br></h2>
        <p><span>Learn More</span> <span class="description-title">About Us</span></p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">
          <div class="col-lg-7" data-aos="fade-up" data-aos-delay="100">
            <img src="${pageContext.request.contextPath}/assets/img/about.jpg" class="img-fluid mb-4" alt="">
          </div>
          <div class="col-lg-5" data-aos="fade-up" data-aos-delay="250">
            <div class="content ps-0 ps-lg-5">
              <p class="fst-italic">
                  우리는 고객님과 지역 맛집을 연결하는 최고의 음식 플랫폼입니다.  
                  신선한 재료와 다양한 메뉴를 통해 더욱 특별한 식사 경험을 제공합니다.
              </p>
              <ul>
                <li><i class="bi bi-check-circle-fill"></i> <span>수백 개의 다양한 레스토랑 메뉴를 한곳에서 비교하고 선택하세요.</span></li>
                <li><i class="bi bi-check-circle-fill"></i> <span>빠르고 신뢰할 수 있는 배달 서비스로 따뜻한 음식을 받아보세요.</span></li>
                <li><i class="bi bi-check-circle-fill"></i> <span>정기적인 할인과 혜택으로 더 알뜰하게 즐기세요.</span></li>
              </ul>
              <p>
                우리의 목표는 단순한 식사 이상의 가치를 제공하는 것입니다.  
                오늘도 최고의 음식을 쉽고 편리하게 즐길 수 있도록 최선을 다하겠습니다!
              </p>
            </div>
          </div>
        </div>

      </div>

    </section><!-- /About Section -->

    <!-- Why Us Section -->
    <section id="why-us" class="why-us section light-background">
      <div class="container">
        <div class="row gy-4">
          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="why-box">
              <h3>Mashu<span class="red-boll">.</span></h3>
              <br>
              <p>
                마슈는 지역의 인기 맛집부터 숨겨진 보석 같은 <br>레스토랑까지 수많은 음식점을 한곳에서 만날 수 있는 플랫폼입니다. <br>
                간단한 검색만으로 다양한 음식 카테고리를 <br>탐색하고,한식, 양식, 중식, 디저트 등 원하는 메뉴를 손쉽게 선택할 수 있습니다. <br>
                새로운 맛집을 발견하거나 좋아하는 단골 음식점을 간편하게 주문할 수 있어,<br>고객의 미식 경험을 더욱 풍부하게 만들어 드립니다.
              </p>
            </div>
          </div><!-- End Why Box -->

          <div class="col-lg-8 d-flex align-items-stretch">
            <div class="row gy-4" data-aos="fade-up" data-aos-delay="200">

              <div class="col-xl-4">
                <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                  <i class="bi bi-clipboard-data"></i>
                  <h4>다양한 선택과 편리함</h4>
                  <p>우리의 플랫폼은 다양한 음식점과 메뉴를 한곳에서 확인할 수 있는 최고의 편리함을 제공합니다. 고객의 기호와 현재 위치에 따라 맞춤형 추천을 제공하여 선택을 더욱 간단하게 만듭니다.</p>
                </div>
              </div><!-- End Icon Box -->

              <div class="col-xl-4" data-aos="fade-up" data-aos-delay="300">
                <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                  <i class="bi bi-gem"></i>
                  <h4>빠르고 신뢰할 수 있는 서비스</h4>
                  <p>주문부터 배달까지 빠르고 정확한 프로세스를 통해 고객의 시간을 절약합니다. 신뢰할 수 있는 배달 파트너와 함께하여 항상 신선하고 뜨거운 음식을 제공합니다.</p>
                </div>
              </div><!-- End Icon Box -->

              <div class="col-xl-4" data-aos="fade-up" data-aos-delay="400">
                <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                  <i class="bi bi-inboxes"></i>
                  <h4>합리적인 가격과 특별 혜택</h4>
                  <p>정기적인 할인, 프로모션, 포인트 적립 등 다양한 혜택을 통해 고객에게 최고의 가성비를 제공합니다. 우리 플랫폼을 이용할수록 더 큰 혜택을 누릴 수 있습니다.</p>
                </div>
              </div><!-- End Icon Box -->

            </div>
          </div>

        </div>

      </div>

    </section><!-- /Why Us Section -->

    <!-- Stats Section -->
    <section id="stats" class="stats section dark-background">

      <img src="${pageContext.request.contextPath}/assets/img/stats-bg.jpg" alt="" data-aos="fade-in">

      <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"></span>
              <p>사용자</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter"></span>
              <p>가맹 점포수</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="1453" data-purecounter-duration="1" class="purecounter"></span>
              <p>플랫폼 결제 건수</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="32" data-purecounter-duration="1" class="purecounter"></span>
              <p>일일 마슈 이용고객 수</p>
            </div>
          </div><!-- End Stats Item -->

        </div>

      </div>

    </section><!-- /Stats Section -->

    <!-- Testimonials Section -->
    <section id="testimonials" class="testimonials section light-background">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>TESTIMONIALS</h2>
        <p>What Are They <span class="description-title">Saying About Us</span></p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

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
            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="row gy-4 justify-content-center">
                  <div class="col-lg-6">
                    <div class="testimonial-content">
                      <p>
                        <i class="bi bi-quote quote-icon-left"></i>
                        <span>처음 이용해봤는데 정말 만족스러웠습니다. 음식도 따뜻하게 도착했고, 배달도 너무 빨랐어요. 앞으로도 자주 이용할 것 같아요!</span>
                        <i class="bi bi-quote quote-icon-right"></i>
                      </p>
                      <h3>김지현</h3>
                      <h4>직장인</h4>
                      <div class="stars">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-2 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/undraw_profile.svg" class="img-fluid testimonial-img" alt="Testimonial Image">
                  </div>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="row gy-4 justify-content-center">
                  <div class="col-lg-6">
                    <div class="testimonial-content">
                      <p>
                        <i class="bi bi-quote quote-icon-left"></i>
                        <span>다양한 메뉴와 합리적인 가격이 정말 좋았어요. 무엇보다 정기적인 프로모션 덕분에 더 저렴하게 맛있는 음식을 즐길 수 있어서 만족합니다.</span>
                        <i class="bi bi-quote quote-icon-right"></i>
                      </p>
                      <h3>이민수</h3>
                      <h4>대학생</h4>
                      <div class="stars">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-2 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/undraw_profile.svg" class="img-fluid testimonial-img" alt="Testimonial Image">
                  </div>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="row gy-4 justify-content-center">
                  <div class="col-lg-6">
                    <div class="testimonial-content">
                      <p>
                        <i class="bi bi-quote quote-icon-left"></i>
                        <span>친절한 고객 서비스에 정말 감동받았습니다. 배달 오류가 있었지만 빠르게 대응해 주셔서 기분 좋게 이용할 수 있었습니다. 믿고 사용하는 플랫폼이에요!</span>
                        <i class="bi bi-quote quote-icon-right"></i>
                      </p>
                      <h3>박수현</h3>
                      <h4>프리랜서</h4>
                      <div class="stars">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-2 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/undraw_profile.svg" class="img-fluid testimonial-img" alt="Testimonial Image">
                  </div>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="row gy-4 justify-content-center">
                  <div class="col-lg-6">
                    <div class="testimonial-content">
                      <p>
                        <i class="bi bi-quote quote-icon-left"></i>
                        <span>추천 시스템이 정말 좋아요! 제가 좋아할 만한 메뉴를 추천해줘서 고민할 필요 없이 맛있는 음식을 바로 선택할 수 있었어요.</span>
                        <i class="bi bi-quote quote-icon-right"></i>
                      </p>
                      <h3>최영훈</h3>
                      <h4>IT 개발자</h4>
                      <div class="stars">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-2 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/undraw_profile.svg" class="img-fluid testimonial-img" alt="Testimonial Image">
                  </div>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="row gy-4 justify-content-center">
                  <div class="col-lg-6">
                    <div class="testimonial-content">
                      <p>
                        <i class="bi bi-quote quote-icon-left"></i>
                        <span>다른 플랫폼보다 배달 속도가 빠르고 음식 상태도 훌륭했어요. 믿을 수 있는 서비스 덕분에 가족들과 함께하는 시간이 더 즐거워졌습니다.</span>
                        <i class="bi bi-quote quote-icon-right"></i>
                      </p>
                      <h3>정은지</h3>
                      <h4>주부</h4>
                      <div class="stars">
                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-2 text-center">
                    <img src="${pageContext.request.contextPath}/assets/img/undraw_profile.svg" class="img-fluid testimonial-img" alt="Testimonial Image">
                  </div>
                </div>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>

    </section><!-- /Testimonials Section -->
  </main>
	
<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>


</html>