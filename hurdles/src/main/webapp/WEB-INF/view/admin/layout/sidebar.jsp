<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
      <div style="position: sticky;top: 0;">
	      <!-- Sidebar - Brand -->
	      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.do">
	          <div class="sidebar-brand-icon rotate-n-15">
	              <i class="fas fa-laugh-wink"></i>
	          </div>
	          <div class="sidebar-brand-text mx-3">관리자 관리</div>
	      </a>
	
	      <!-- Divider -->
	      <hr class="sidebar-divider my-0" />
	
	      <!-- Nav Item - Dashboard -->
	      <c:set var="mainNav" value="${fn:contains('main', nav) }"/>
	      <li class="nav-item ${mainNav ? 'active' : ''}">
	          <a class="nav-link" href="main.do">
	              <i class="fas fa-fw fa-tachometer-alt"></i>
	              <span>Dashboard</span>
	          </a>
	      </li>
	
	      <!-- Divider -->
	      <hr class="sidebar-divider" />
	
	      <!-- Heading -->
	      <div class="sidebar-heading">
	          Interface
	      </div>
	            
	      
	      <!-- Nav Item - Pages Collapse Menu -->
	      <%-- <c:set var="boardNav" value="${fn:contains('boardList, boardListInfinite, boardInsert, boardUpdate, boardDetail', nav) }"/>
	      <li class="nav-item">
	          <a class="nav-link ${boardNav ? '' : 'collapsed'}" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
	              <span>게시물</span>
	          </a>
	          <div id="collapseTwo" class="collapse ${boardNav ? 'show' : ''}" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	              <div class="bg-white py-2 collapse-inner rounded">
	                 <h6 class="collapse-header">Custom Components:</h6>
	                 <a class="collapse-item ${nav == 'boardList' ? 'active' : ''}" href="boardList.do">게시물 목록</a>
	                 <a class="collapse-item ${nav == 'boardListInfinite' ? 'active' : ''}" href="boardListInfinity.do">게시물 목록 무한스크롤</a>
	                 <a class="collapse-item ${nav == 'boardInsert' ? 'active' : ''}" href="boardInsert.do">게시글 추가</a>
	              </div>
	          </div>
	      </li>  --%>
	      <!-- Nav Item - Pages Collapse Menu -->
	      
	      <!-- Nav Item - Pages Collapse Menu -->
	      <c:set var="restaurantNav" value="${fn:contains('restaurant, restaurantList, restaurantListInfinite, restaurantInsert, restaurantUpdate, restaurantDetail', nav) }"/>
	      <li class="nav-item">
	          <a class="nav-link ${restaurantNav ? '' : 'collapsed'}" href="#" data-toggle="collapse" data-target="#restaurantNav" aria-expanded="true" aria-controls="restaurantNav">
	              <span>식당</span>
	          </a>
	          <div id="restaurantNav" class="collapse ${restaurantNav ? 'show' : ''}" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	              <div class="bg-white py-2 collapse-inner rounded">
	                 <h6 class="collapse-header">Custom Components:</h6>
	                 <a class="collapse-item ${nav == 'restaurant' ? 'active' : ''}" href="restaurantList.do">식당 목록</a>
	                 <a class="collapse-item ${nav == 'restaurantInsert' ? 'active' : ''}" href="restaurantInsert.do">식당 추가</a>
	              </div>
	          </div>
	      </li> 
	      <!-- Nav Item - Pages Collapse Menu -->
	
	      <!-- Nav Item - Pages Collapse Menu -->
	      <c:set var="faqNav" value="${fn:contains('faqList, faqInsert, faqUpdate, faqDetail', nav) }"/>
	      <li class="nav-item">
	          <a class="nav-link ${faqNav ? '' : 'collapsed'}" href="#" data-toggle="collapse" data-target="#faqNav" aria-expanded="true" aria-controls="faqNav">
	              <span>FAQ</span>
	          </a>
	          <div id="faqNav" class="collapse ${faqNav ? 'show' : ''}" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	              <div class="bg-white py-2 collapse-inner rounded">
	                 <h6 class="collapse-header">Custom Components:</h6>
	                 <a class="collapse-item ${nav == 'faqList' ? 'active' : ''}" href="faqList.do">FAQ 목록</a>
	                 <a class="collapse-item ${nav == 'faqInsert' ? 'active' : ''}" href="faqInsert.do">FAQ 추가</a>
	              </div>
	          </div>
	      </li> 
	      <!-- Nav Item - Pages Collapse Menu -->
	
	      <!-- Nav Item - Pages Collapse Menu -->
	      <c:set var="noticeNav" value="${fn:contains('noticeList, noticeInsert, noticeUpdate, noticeDetail', nav) }"/>
	      <li class="nav-item">
	          <a class="nav-link ${noticeNav ? '' : 'collapsed'}" href="#" data-toggle="collapse" data-target="#noticeNav" aria-expanded="true" aria-controls="noticeNav">
	              <span>공지사항 관리</span>
	          </a>
	          <div id="noticeNav" class="collapse ${noticeNav ? 'show' : ''}" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	              <div class="bg-white py-2 collapse-inner rounded">
	                 <h6 class="collapse-header">Custom Components:</h6>
	                 <a class="collapse-item ${nav == 'noticeList' ? 'active' : ''}" href="noticeList.do">공지 목록</a>
	                 <a class="collapse-item ${nav == 'noticeInsert' ? 'active' : ''}" href="noticeInsert.do">공지 추가</a>
	              </div>
	          </div>
	      </li> 
	      <!-- Nav Item - Pages Collapse Menu -->
	
	      <!-- Nav Item - Pages Collapse Menu -->
	      <c:set var="blackReviewListNav" value="${fn:contains('ReviewReportList, blackReviewList, blackReviewInsert, blackReviewUpdate, blackReviewDetail', nav) }"/>
	      <li class="nav-item">
	          <a class="nav-link ${blackReviewListNav ? '' : 'collapsed'}" href="#" data-toggle="collapse" data-target="#blackReviewListNav" aria-expanded="true" aria-controls="faqNav">
	              <span>신고목록</span>
	          </a>
	          <div id="blackReviewListNav" class="collapse ${blackReviewListNav? 'show' : ''}" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	              <div class="bg-white py-2 collapse-inner rounded">
	                 <h6 class="collapse-header">Custom Components:</h6>
	                 <a class="collapse-item ${nav == 'ReviewReportList' ? 'active' : ''}" href="reviewReportList.do">신고내역</a>
	              </div>
	          </div>
	      </li> 
				
	       <!-- Nav Item - Pages Collapse Menu -->
	      <c:set var="MemberListNav" value="${fn:contains('memberList, adminMemberList ,adminMemberMileage,adminMemberCouponList,blackList', nav) }"/>
	      <li class="nav-item">
	          <a class="nav-link ${MemberListNav ? '' : 'collapsed'}" href="#" data-toggle="collapse" data-target="#MemberListNav" aria-expanded="true" aria-controls="MemberListNav">
	              <span>회원관리</span>
	          </a>
	          <div id="MemberListNav" class="collapse ${MemberListNav? 'show' : ''}" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	              <div class="bg-white py-2 collapse-inner rounded">
	                 <h6 class="collapse-header">Custom Components:</h6>
	                 <a class="collapse-item ${nav == 'memberList' ? 'active' : ''}" href="memberList.do">전체 회원 조회</a>
									<%-- <a class="collapse-item ${nav == 'blackList' ? 'active' : ''}" href="blackList.do">블랙리스트 목록</a> --%>
	              </div>
	          </div> 
	      </li> 
	         <!-- Nav Item - Pages Collapse Menu -->
	      <c:set var="PayReservationListNav" value="${fn:contains('adminpPayList, adminReservationList, ', nav) }"/>
	      <li class="nav-item">
	          <a class="nav-link ${PayReservationListNav ? '' : 'collapsed'}" href="#" data-toggle="collapse" data-target="#PayReservationListNav" aria-expanded="true" aria-controls="PayReservationListNav">
	              <span>결제/예약내역 관리</span>
	          </a>
	          <div id="PayReservationListNav" class="collapse ${PayReservationListNav? 'show' : ''}" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	              <div class="bg-white py-2 collapse-inner rounded">
	                 <h6 class="collapse-header">Custom Components:</h6>
	                 <a class="collapse-item ${nav == 'adminpPayList' ? 'active' : ''}" href="adminpPayList.do">결제 내역 조회 </a>
	                 <a class="collapse-item ${nav == 'adminReservationList' ? 'active' : ''}" href="ReservationList.do">예약 내역 조회 </a>
	                 
	              </div>
	          </div> 
	      </li> 
	      
	      <!-- Nav Item - Pages Collapse Menu -->
	
	      <!-- Sidebar Toggler (Sidebar) -->
	      <div class="d-flex justify-content-center">
	          <button class="rounded-circle border-0" id="sidebarToggle"></button>
	      </div>
      </div>
  </ul>