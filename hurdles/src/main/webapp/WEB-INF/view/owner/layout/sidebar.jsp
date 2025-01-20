<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

  <ul class="navbar-nav bg-gradient-warning sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: pink;">
      <div style="position: sticky;top: 0;">
	      <!-- Sidebar - Brand -->
	      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.do">
	          <div class="sidebar-brand-icon rotate-n-15">
	              <i class="fas fa-laugh-wink"></i>
	          </div>
	          <div class="sidebar-brand-text mx-3">식당 관리자</div>
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
	            
	      <c:set var="restaurantNav" value="${fn:contains('restaurant,ownReviewList, restaurantList,ownerReservationList, restaurantListInfinite, restaurantInsert, restaurantUpdate, restaurantDetail', nav) }"/>
	     
	      
	      <!-- Nav Item - Pages Collapse Menu -->
	      <li class="nav-item">
	          <a class="nav-link ${restaurantNav ? '' : 'collapsed'}" href="#" data-toggle="collapse" data-target="#restaurantNav" aria-expanded="true" aria-controls="restaurantNav">
	              <span>식당</span>
	          </a>
	          <div id="restaurantNav" class="collapse ${restaurantNav ? 'show' : ''}" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	              <div class="bg-white py-2 collapse-inner rounded">
	                <h6 class="collapse-header">Custom Components:</h6>
	                <a class="collapse-item ${nav == 'restaurantList' ? 'active' : ''}" href="ownRestaurantList.do">소유 식당 목록</a>
	                <a class="collapse-item ${nav == 'ownReviewList' ? 'active' : ''}" href="ownReviewList.do">리뷰 리스트</a>
	                <a class="collapse-item ${nav == 'ownerReservationList' ? 'active' : ''}" href="ownerReservationList.do">예약 리스트</a>
	                
	              </div>
	          </div>
	       </li> 
	      
				<c:set var="ownQuestionNav" value="${fn:contains('ownQuestion, ownQuestionList, ownQuestionInsert, ownQuestionUpdate, ownQuestionDetail', nav) }"/>
	      <li class="nav-item">
	          <a class="nav-link ${ownQuestionNav ? '' : 'collapsed'}" href="#" data-toggle="collapse" data-target="#ownQuestionNav" aria-expanded="true" aria-controls="ownQuestionNav">
	              <span>고객문의</span>
	          </a>
	          <div id="ownQuestionNav" class="collapse ${ownQuestionNav ? 'show' : ''}" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	              <div class="bg-white py-2 collapse-inner rounded">
	                 <h6 class="collapse-header">Custom Components:</h6>
	                 <a class="collapse-item ${nav == 'ownQuestionList' ? 'active' : ''}" href="ownQuestionList.do">문의 리스트</a>
<%-- 	                 <a class="collapse-item ${nav == 'restaurantInsert' ? 'active' : ''}" href="restaurantInsert.do">식당 추가</a> --%>
	              </div>
	          </div>
	       </li> 
	
	      <!-- Sidebar Toggler (Sidebar) -->
	      <div class="d-flex justify-content-center">
	          <button class="rounded-circle border-0" id="sidebarToggle"></button>
	      </div>
      </div>
  </ul>