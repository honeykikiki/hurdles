<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<c:set var="nav" value="main" scope="request"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>사장님 메인</title>
	<jsp:include page="/WEB-INF/view/owner/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
	 <jsp:include page="/WEB-INF/view/owner/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">

         <!-- Page Heading -->
         <div class="d-sm-flex align-items-center justify-content-between mb-4">
             <h1 class="h3 mb-0 text-gray-800">매출 및 통계</h1>
   
         </div>

         <!-- Content Row -->
         <div class="row">

             <!-- Earnings (Monthly) Card Example -->
             <div class="col-xl-5 col-md-8 mb-8">
                 <div class="card border-left-primary shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                     예약 건 수</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">총 ${ownGetCountReservation } 건 </div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-calendar fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Earnings (Monthly) Card Example -->
             <div class="col-xl-5 col-md-8 mb-8">
                 <div class="card border-left-success shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                     총 매출</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">₩ <fmt:formatNumber value="${ownGetTotalPrice }" pattern="#,###"/>원</div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Earnings (Monthly) Card Example -->
         

             <!-- Pending Requests Card Example -->

         </div>
         <hr>
         <!-- Content Row -->
         <div class="row">
         	  <div class="col-xl-5 col-md-8 mb-8">
                 <div class="card border-left-warning shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                     총 주문 건</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">${ownGetCountOrder }</div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-comments fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Earnings (Monthly) Card Example -->
             <div class="col-xl-5 col-md-8 mb-8">
                 <div class="card border-left-primary shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                     등록하신 매장 수</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">총 ${ownRestaurant } 개 </div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-calendar fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
		  </div>
			  <hr>
		   <div class="row">
             <div class="col-xl-5 col-md-8 mb-8">
                 <div class="card border-left-info shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-info text-uppercase mb-1">리뷰 : 총 ${ownReviewCount }건의 평균 만족도(평점)
                                 </div>
                                 <div class="row no-gutters align-items-center">
                                     <div class="col-auto">
                                         <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${reviewPer}% </div>
                                     </div>
                                     <div class="col">
                                         <div class="progress progress-sm mr-2">
                                             <div class="progress-bar bg-info" role="progressbar"
                                                 style="width:<fmt:formatNumber value="${reviewPer}" pattern="#.#"/>%" aria-valuenow="50" aria-valuemin="0"
                                                 aria-valuemax="100"></div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
          </div>


     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
	 <jsp:include page="/WEB-INF/view/owner/layout/footer.jsp" />
     <!-- End of Footer -->

	<jsp:include page="/WEB-INF/view/owner/layout/prescript.jsp" />
</body>


</html>