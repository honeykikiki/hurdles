<%@page import="kr.or.ddit.vo.CartVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="restaurant" scope="request"/>
<c:set var="titleName" value="주문결제페이지" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- 
<%
  List<CartVo> list = (List<CartVo>) request.getAttribute("selectedCartList");
 
  int no=0;
  String str = "";
  for(CartVo  vo : list){
	   no =    vo.getCartNo();
	   str += no;
  }

%> --%>
<style>
.card-title {
    font-weight: 600;
}

</style>

<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            //document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
    
    <title>주문결제페이지</title>
    <jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
    <jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

    <main class="container py-5">
        <h2 class="text-center mb-4">주문 결제 페이지</h2>
        <form method="post" action="/hurdles/site/kakaoPay.do">
        <div class="row g-4">
            <!-- 배송지 정보 -->
            <div class="col-md-6">
                <h5 class="mb-3 fw-bold">배송지 정보</h5>
                <!-- <form action="/hurdles/site/payAddressUpdate.do" method="post"> -->
                    
                    <div class="mb-3">
                        <label for="receiverName" class="form-label">수령인</label>
                        <input type="text" class="form-control" id="receiverName" value="${member.memberName}" placeholder="수령인을 입력하세요">
                    </div>
                    <div class="mb-3">
                        <label for="contact" class="form-label">연락처</label>
                        <input type="text" class="form-control" id="phoneNumber" value="${member.memberTel }" placeholder="전화번호를 입력하세요">
                    </div>
                <!--     <div class="mb-3">
                        <label for="postcode" class="form-label">우편번호</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="sample6_postcode" value="" placeholder="우편번호">
                        </div>
                    </div> -->
                    <div class="mb-3">
                        <label for="address" class="form-label">주소</label>
                            <button type="button" name="address" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()">배송지변경</button>
                        <input type="text" class="form-control" name="sample6_address" id="sample6_address" value="${member.memberAdd1 }" placeholder="주소" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="detailAddress" class="form-label">상세주소</label>
                        <input type="text" class="form-control" name="sample6_detailAddress" id="sample6_detailAddress" value="${member.memberAdd2 }" placeholder="상세주소">
                    </div>
                    <div class="mb-3">
                        <!-- <label for="extraAddress" class="form-label">참고항목</label> -->
                        <input type="hidden" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
                    </div> 
                    <!-- <div class="text-end">
                        <button onclick="addressUpdate()" class="btn btn-primary">배송지 변경</button>
                    </div> -->
                    
                <!-- </form> -->
                
                <!-- 할인 정보 -->
                <h5 class="mb-3 fw-bold">할인</h5>
                <div class="form-group mb-3">
				    <label for="coupon" class="form-label">쿠폰</label>
				    <select class="form-control" id="coupon" name="coupon">
				        <option value="0">쿠폰 선택</option>
				        <c:forEach var="coupon" items="${couponList}">
				            <option data-no="${coupon.couponNo }" value="${coupon.couponPrice}">${coupon.couponName} - ${coupon.couponPrice}원 할인</option>
				        </c:forEach>
				    </select>
				    <input type="hidden" id="couponValue" name="couponValue" value="0">
				    <input type="hidden" name="couponNo" value="0">
				</div>
				 <div class="form-group mb-4">
				    <label for="mileage" class="form-label">마일리지</label>
				    <div class="d-flex align-items-center mb-2">
				        <small class="text-muted me-2">보유 마일리지:</small>
				        <strong class="text-success"><fmt:formatNumber value="${member.memberMileage}" pattern="#,###"/>M</strong>
				    </div>
				    <input type="number" class="form-control" name="mileageUse" id="mileage" step="1000" min="0" max="${member.memberMileage}" value="0" placeholder="마일리지 입력" required>
				    <input type="hidden" name="mileageUse" value="${mileageUse }">
				    <small class="form-text text-muted mt-1">사용할 마일리지를 입력해주세요 (단위: 1,000M)</small>
				</div>
                
            </div>

            <div class="col-md-6">
            	
            
                <!-- 결제 정보 -->
                <h5 class="mb-3 fw-bold">결제할 상품 목록</h5>
                <%-- <h1><%=  str  %></h1> --%>
                <!-- <form method="post" action="/hurdles/site/kakaoPay.do"> -->
					<div class="row">
			            <c:forEach var="cart" items="${selectedCartList}" varStatus="status">
			                <div class="col-md-4 col-lg mb-4">
			                    <div class="card">
			                        <!-- 상품 이미지 추가 (필요에 따라 수정) -->
			                        <%-- <img src="${cart.productImage}" class="card-img-top" alt="상품 이미지"> --%>
			                        <div class="card-body">
			                        	<input type="hidden" name="item_name" value="${cart.productName}" />
			                        	<input type="hidden" name="quantity" value="${cart.productQty}" />
			                        	<input type="hidden" name="cartNo" value="${cart.cartNo }" />
			                            <h5 class="card-title">${cart.restaurantName}</h5>
			                            <p class="card-text">${cart.productName}</p>
			                            <p class="card-text">가격 : <strong><fmt:formatNumber value="${cart.productPrice}" pattern="#,###"/>원</strong></p>
			                            <p class="card-text">수량 : ${cart.productQty} 개</p>
			                            <p class="card-text">상품 총 가격 : <strong><fmt:formatNumber value="${cart.productQty * cart.productPrice}" pattern="#,###"/>원</strong></p>
			                        </div>
			                    </div>
			                </div>
			            </c:forEach>
			        </div>
			        
                    <!-- <h5 class="mb-3 fw-bold">결제 금액</h5> -->
                    <div class="card p-4 shadow-sm mb-4">
					    <h3 class="mb-3 text-center">
					        결제 금액 : <strong id="totalPrice" class="text-danger">
                                <fmt:formatNumber value="${totalPrice}" pattern="#,###"/>
                            </strong>원
					        <input type="hidden" name="totalPrice" value="${totalPrice }">
					    </h3>
					    <input type="hidden"id="totalAmount" name="total_amount" value="${totalPrice}">
					</div>
	                <h5 class="mb-3 text-center">
	       				예상 마일리지 적립 : <strong id="expectedMileage" class="text-success">0</strong>M
	       				<input type="hidden" name="expectedMileage" value="${expectedMileage }">
	    			</h5>
                    
                    <h5 class="mb-3 fw-bold">결제 방법</h5>
                    <div class="mb-3 form-check">
                        <input class="form-check-input" type="radio" value="kakaopay" id="kakaopay" checked>
                        <label class="form-check-label" for="kakaopay">
                            <img src="../assets/img/kakaopay.png" alt="카카오페이" style="width: 80px;"> 카카오페이
                        </label>
                    </div>
                    
                    <!-- Kakaopay Hidden Fields -->
                    <input type="hidden" name="partner_order_id" value="123">
                    <input type="hidden" name="partner_user_id" value="12">
                    <input type="hidden" name="tax_free_amount" value="0">        
                    <input type="hidden" name="command" value="ready">
                    <input type="hidden" value="TC0ONETIME" name="cid" readonly>
                    <input type="hidden" value="http://localhost:8080/hurdles/pay/success.jsp" name="approval_url" readonly>
                    <input type="hidden" value="http://localhost:8080/hurdles/WEB-INF/view/site/pay/cancel.jsp" name="cancel_url" readonly>
                    <input type="hidden" value="http://localhost:8080/hurdles/WEB-INF/view/site/pay/fail.jsp" name="fail_url" readonly>
                    
                    <!-- 결제내역 INSERT 하기 위한 hidden 파리미터 값 -->
                    <input type="hidden" name="memberNo" value="${member.memberNo}">
                    <%-- <input type="hidden" name="sample6_address" value="${member.memberAdd1}">
                    <input type="hidden" name="sample6_detailAddress" value="${member.memberAdd2}"> --%>
                    
                    
                    <div class="text-center">
                        <button type="submit" class="btn btn-danger btn-lg w-100">결제하기</button>
                    </div>
                <!-- </form> -->
            </div>
        </div>
        </form>
    </main>
    
<script type="text/javascript">
  // totalPrice
  // total_amount
  
  
 //금액결제 쉼표  
function formatPriceWithCommas(price){
	  return price.toLocaleString();
  }  
  
window.onload =function(){
  let totalPriceElement = document.querySelector("#totalPrice");
  let totalAmount = document.querySelector("input[name=total_amount]");
  
  let expectedMileage = document.querySelector("input[name=expectedMileage]");

}

  let coupon = 0;
  let mileage = 0;
  let basePrice = Number(totalPrice.innerText.replaceAll(",", ""));
  
  let gradeNo = ${member.gradeNo};
  let mileagePercent = getMileagePercent(gradeNo);
  
  
  //마일리지 적립율 찾기
  function getMileagePercent(gradeNo){
	  
	  let mileageRates = {
		  
		  1: 0, // 새싹
	  	  2: 0.005, // 나무
	  	  3: 0.01, // 꽃
	  	  4: 0.015, // 열매
	  	  5: 0.03  // 숲
	  
	  };
	  return mileageRates[gradeNo] || 0;
	  
  }
  
  //예상 마일리지
  function updateExpectedMileage(){
	
	  let totalAmountDiscount = basePrice - coupon - mileage;
	  console.log(basePrice ,coupon ,mileage);
	  console.log(totalAmountDiscount, mileagePercent);
	  let calculatedMileage = Math.floor(totalAmountDiscount * mileagePercent);
	  //expectedMileage.innerText = calculatedMileage.toLocaleString();
	  expectedMileage.innerText = formatPriceWithCommas(calculatedMileage);
	  document.querySelector("input[name=expectedMileage]").value = calculatedMileage;
  }
  
  document.querySelector("select[name=coupon]").addEventListener("change", (e) => {
	const dataResult = e.target[e.target.selectedIndex];	 
	 let couponValue = e.target.value || 0;
	 
	 document.querySelector("input[name=couponNo]").value = dataResult.dataset.no;
	 document.querySelector("#couponValue").value = couponValue;
	 
	 coupon = Number(e.target.value.replace(",", "")) || 0;
	
	 totalPrice.innerText = formatPriceWithCommas(basePrice - Number(e.target.value.replace(",", "")) - mileage);
	 
	 
	 updateExpectedMileage();
  });
  
  document.querySelector("input[name=mileageUse]").addEventListener("change", (e) => {
    //let totalAmount = document.querySelector("input[name=total_amount]");
	  mileage = Number(e.target.value) || 0;
	  totalPrice.innerText = (basePrice - Number(e.target.value.replace(",", "")) - coupon).toLocaleString();
	  totalPrice.innerText = formatPriceWithCommas(basePrice - Number(e.target.value.replace(",", "")) - coupon);

	  totalAmount.value = basePrice - Number(e.target.value.replace(",", "")) - coupon;
	  
	  updateExpectedMileage();
  });
  
  updateExpectedMileage();
  // 쿠폰 선택하면 금액만큼 총금액 차감
  // 마일리지 사용 하면 사용한 만큼 차감
  
  
  
  function addressUpdate() {
	  alert("주소가 변경되었습니다");
	  event.preventDefault();

 	  let addr1 = $('#sample6_address').val();
 	  let addr2 = $('#sample6_detailAddress').val();

 
 	  $.ajax({
	  		url : "/hurdles/site/payAddressUpdate.do",
	  		type : "POST",
	  		dataType : "json",
 	  		data : {
		  
		 		 "sample6_address" : addr1,
		  		"sample6_detailAddress" : addr2
	  		},
	  		success : function(res){
		    alert(res.result);
	  		}
 	});
 }
 

</script>

<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>