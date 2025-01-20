<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container position-relative d-flex align-items-center justify-content-between">

      <a href="${pageContext.request.contextPath}/site/main.do" class="logo d-flex align-items-center me-auto me-xl-0">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="">
        <h1 class="sitename">Mashu</h1>
        <span>.</span>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="${pageContext.request.contextPath}/site/main.do" class="${nav == 'main' ? 'active' : '' }">홈<br></a></li>
          <li><a href="${pageContext.request.contextPath}/site/restaurantList.do" class="${nav == 'restaurant' ? 'active' : '' }">식당</a></li>
          <li><a href="${pageContext.request.contextPath}/site/faq.do" class="${nav == 'faq' ? 'active' : '' }">게시판(FAQ, 등급)</a></li>
          <li><a href="${pageContext.request.contextPath}/site/notificationList.do" class="${nav == 'notification' ? 'active' : '' }">공지사항</a></li>
          <c:if test="${not empty member }">
            <li><a href="${pageContext.request.contextPath}/site/myPage.do" class="${nav == 'myPage' ? 'active' : '' }">마이페이지</a></li>
          </c:if>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
		<c:if test="${member == null || member.memberNo == 0}">
	 	  <a class="btn-getstarted" href="${pageContext.request.contextPath}/auth/login.do">로그인</a>
		</c:if>
		
		<c:if test="${member != null && member.memberNo != 0 }">
		   <%-- <c:set var="member" value="${sessionScope.member }" /> --%>
        <div class="dropdown d-xl-block d-none">
          <a class="nav-link dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <span class="me-2 d-none d-lg-inline text-gray-600" width="45px">${member.memberName }</span>
            <img class="img-profile rounded-circle"
              src="/upload/member/${member.filePath}" 
              onerror="this.src='${pageContext.request.contextPath}/assets/img/undraw_profile.svg'" 
              width="30px"
              height="30px"
            >
        </a>
        <!-- Dropdown - User Information -->
        <ul class="dropdown-menu dropdown-menu-dark">
        
          <c:if test="${member.memberRole == 0 }">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/main.do">관리자 페이지</a></li>
            <hr>
          </c:if>
          <c:if test="${member.memberRole == 1 }">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/owner/main.do">식당 관리하기</a></li>
            <hr>
          </c:if>
          
          <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal">로그아웃</a></li>
        </ul>
        </div>
    </c:if>

    </div>
  </header>


            <!-- <li><a href="#chefs">Chefs</a></li>
          <li><a href="#gallery">Gallery</a></li>
          <li class="dropdown"><a href="#"><span>Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="#">Dropdown 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                <ul>
                  <li><a href="#">Deep Dropdown 1</a></li>
                  <li><a href="#">Deep Dropdown 2</a></li>
                  <li><a href="#">Deep Dropdown 3</a></li>
                  <li><a href="#">Deep Dropdown 4</a></li>
                  <li><a href="#">Deep Dropdown 5</a></li>
                </ul>
              </li>
              <li><a href="#">Dropdown 2</a></li>
              <li><a href="#">Dropdown 3</a></li>
              <li><a href="#">Dropdown 4</a></li>
            </ul>
          </li>
          <li><a href="#contact">Contact</a></li> -->