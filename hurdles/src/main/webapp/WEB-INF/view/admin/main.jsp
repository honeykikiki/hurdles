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
   
   <title>관리자 메인</title>
   <jsp:include page="/WEB-INF/view/admin/layout/prestyle.jsp" />
</head>

<body>
     <!-- Sidebar -->
    <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
     <!-- End of Sidebar -->

     <!-- Begin Page Content -->
     <div class="container-fluid">

         <!-- Content Row -->
         <div class="row">

             <!-- Earnings (Monthly) Card Example -->
             <div class="col-xl-3 col-md-6 mb-4">
                 <div class="card border-left-primary shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                     예약 수</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">${reservationCnt }</div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-calendar fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Earnings (Monthly) Card Example -->
             <div class="col-xl-3 col-md-6 mb-4">
                 <div class="card border-left-success shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                     총 매출</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">₩ <fmt:formatNumber value="${payTotalPrice }" pattern="#,###"/>원</div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Earnings (Monthly) Card Example -->
             <div class="col-xl-3 col-md-6 mb-4">
                 <div class="card border-left-info shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-info text-uppercase mb-1">주문건 당 리뷰작성률
                                 </div>
                                 <div class="row no-gutters align-items-center">
                                     <div class="col-auto">
                                         <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><fmt:formatNumber value="${ordersPerReview }" pattern="#.#"/>%</div>
                                     </div>
                                     <div class="col">
                                         <div class="progress progress-sm mr-2">
                                             <div class="progress-bar bg-info" role="progressbar"
                                                 style="width: <fmt:formatNumber value="${ordersPerReview }" pattern="#.#"/>%" aria-valuenow="50" aria-valuemin="0"
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

             <!-- Pending Requests Card Example -->
             <div class="col-xl-3 col-md-6 mb-4">
                 <div class="card border-left-warning shadow h-100 py-2">
                     <div class="card-body">
                         <div class="row no-gutters align-items-center">
                             <div class="col mr-2">
                                 <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                     사용자 수</div>
                                 <div class="h5 mb-0 font-weight-bold text-gray-800">${memberCnt }</div>
                             </div>
                             <div class="col-auto">
                                 <i class="fas fa-comments fa-2x text-gray-300"></i>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>

         <!-- Content Row -->

         <div class="row mb-4">

             <!-- Area Chart -->
             <div class="col-xl-6">
                 <div class="card">
                 	<div class="card-body">
                 		<div id="columnchart_values"  style="width: 100%; height: 400px;"></div>
                 	</div>
                 </div>
             </div>

             <!--파이 차트 -->
		    <div class="col-xl-6">
		        <!-- 차트 렌더링 영역 -->
		        <div class="card">
		        	<div class="card-body">
		        		<div id="chart_div" class="p-4" style="width: 100%; height: 400px;"></div>
		        	</div>
		        </div>
		    </div>

          </div>
      <!--파이 차트 끝  -->
         <!-- Content Row -->
         <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">

                <!-- Project Card Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">목표</h6>
                    </div>
                    <div class="card-body">
                        <h4 class="small font-weight-bold">목표 매출: ₩<fmt:formatNumber value="${targetPrice }" pattern="#,###"/>원 / 현재 매출: ₩<fmt:formatNumber value="${payTotalPrice }" pattern="#,###"/>원<span
                                class="float-right"><fmt:formatNumber value="${targetPP }" pattern="#.#"/>%</span></h4>
                        <div class="progress mb-4">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: <fmt:formatNumber value="${targetPP }" pattern="#.#"/>%"
                                aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                        </div> 
                        <h4 class="small font-weight-bold">목포 사용자 수 : ${targetMember } 명 / 현재 : ${memberCnt } 명<span
                                class="float-right"><fmt:formatNumber value="${targetMM }" pattern="#.#"/>%</span></h4>
                        <div class="progress mb-4">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: <fmt:formatNumber value="${targetMM }" pattern="#.#"/>%"
                                aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <h4 class="small font-weight-bold">목표 주문건 :${targetOrder } 건 / 현재 : ${ordersCnt } 건 <span
                                class="float-right"><fmt:formatNumber value="${targetOO }" pattern="#.#"/>%</span></h4>
                        <div class="progress mb-4">
                            <div class="progress-bar" role="progressbar" style="width: <fmt:formatNumber value="${targetOO }" pattern="#.#"/>%"
                                aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>  
                        <h4 class="small font-weight-bold">목표 리뷰 수 : ${targetReview } 개 / 현재 : ${reviewCnt } 개 <span
                                class="float-right"> <fmt:formatNumber value="${targetRR }" pattern="#.#"/>%</span></h4>
                        <div class="progress mb-4">
                            <div class="progress-bar bg-info" role="progressbar" style="width: <fmt:formatNumber value="${targetRR }" pattern="#.#"/>%"
                                aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <h4 class="small font-weight-bold">목표 예약 : ${targetReservation } 건 / 현재 : ${reservationCnt } <span
                                class="float-right"><fmt:formatNumber value="${targetRes }" pattern="#.#"/>%</span></h4>
                        <div class="progress">
                            <div class="progress-bar bg-success" role="progressbar" style="width: <fmt:formatNumber value="${targetRes }" pattern="#.#"/>%"
                                aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>

               
            </div>

            <div class="col-lg-6 mb-4">

                <!-- Illustrations -->
                <div class="card  mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Schedules</h6>
                    </div>
                    <div class="card-body">
                       <p>1.팀 프로젝트 마슈<br><strong>1월 10일 금요일</strong><br>마슈 로고 최종회의 및 최종 디버깅</p>
                    </div>
                </div>

                <!-- Approach -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Position</h6>
                    </div>
                    <div class="card-body">
                        <p>PL : 허성진 - 프로젝트 검토 및 api 개발/

                           TA : 오정균  - 기술 가이드 및 디버깅/

                           AA : 김은영 - 인터페이스 수정 및 디버깅/

                           DA : 김영신 - 데이터 설계 및 디버깅/

                           UA : 백현명 - html구조화 및 퍼블리싱 담당
                       </p>
                    </div>
                </div>

            </div>
        </div>

     </div>
     <!-- /.container-fluid -->

     <!-- Footer -->
    <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
     <!-- End of Footer -->

   <jsp:include page="/WEB-INF/view/admin/layout/prescript.jsp" />
   
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        // Google Charts 라이브러리 로드 및 초기화
        google.charts.load('current', { packages: ['corechart'] });

        // 라이브러리 로드 후 drawChart 실행
        google.charts.setOnLoadCallback(drawChart);

        async function drawChart() {
            try {
                // 데이터 요청 (서버에서 데이터를 가져옴)
                let response = await fetch(`/hurdles/admin/main.do`, { method: "POST" });

                if (!response.ok) throw new Error("Failed to fetch data");

                let data = await response.json();
                console.log(data);

                if (data != null && data.item) {
                    let items = data.item;

                    // Google DataTable 생성
                    let googleData = new google.visualization.DataTable();
                    googleData.addColumn('string', '지역 이름'); // 지역 이름 컬럼
                    googleData.addColumn('number', '식당 수');  // 식당 수 컬럼

                    // 데이터를 차트 데이터로 추가
                    items.forEach((item) => {
                        googleData.addRow([item.localName, item.cnt]);
                    });

                    // 차트 옵션 설정
                    let options = {
                        title: '지역별 식당 수',
                        width: 700,
                        height: 360,
                        pieHole: 0.4, // 도넛 차트 (값이 없으면 기본 원형 차트)
                        colors: ['#4CAF50', '#FFC107', '#2196F3', '#FF5722'], // 색상 커스터마이징
                        chartArea: { width: '100%', height: '80%' }, // 차트 크기 조정
                        legend: { position: 'side' } // 범례 위치
                    };

                    // 차트를 그릴 컨테이너 선택
                    let chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                    
                    // 차트 그리기
                    chart.draw(googleData, options);
                } else {
                    console.error("No data found!");
                }
            } catch (error) {
                console.error("Error fetching data:", error);
                document.getElementById('chart_div').innerHTML = "<p>데이터를 불러오지 못했습니다.</p>";
            }
        }
        
        
        google.charts.load('current', { packages: ['corechart'] });
        google.charts.setOnLoadCallback(drawChar);
                async function drawChar() {
                    try {
                        // 데이터 요청
                        let response = await fetch(`/hurdles/admin/main.do`, { method: "POST" });

                        if (!response.ok) throw new Error("Failed to fetch data");

                        let data = await response.json();
                        console.log(data);

                        if (data != null && data.price) {
                            let items = data.price;

                            // Google DataTable 생성
                            let googleData = new google.visualization.DataTable();
                            googleData.addColumn('string', '날짜'); // 날짜 컬럼
                            googleData.addColumn('number', '매출'); // 매출 컬럼

                            // 데이터를 DataTable에 추가
                            items.forEach((item) => {
                                googleData.addRow([item.createDate, item.payTotalPrice]);
                            });

                            // 차트 옵션 설정
                            let options = {
                                title: '날짜별 매출',
                                width: 800,
                                height: 360,
                                bar: { groupWidth: "75%" }, // 막대 너비 설정
                                legend: { position: "none" }, // 범례 제거
                                chartArea: { width: '70%', height: '70%' }, // 차트 영역 크기
                                hAxis: { title: '날짜' }, // x축 제목
                                vAxis: { title: '매출' }, // y축 제목
                                colors: ['#4285F4'] // 막대 색상
                            };

                            // 차트 렌더링
                            let chart = new google.visualization.ColumnChart(document.getElementById('columnchart_values'));
                            chart.draw(googleData, options);
                        } else {
                            console.error("No data found!");
                            document.getElementById('columnchart_values').innerHTML = "<p>데이터가 없습니다.</p>";
                        }
                    } catch (error) {
                        console.error("Error fetching data:", error);
                        document.getElementById('columnchart_values').innerHTML = "<p>데이터를 불러오지 못했습니다.</p>";
                    }
                }
            </script>
	</body>
</html>