<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="장바구니" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
   
	
	<title>장바구니</title>
<style type="text/css">
.quantity-input {
  width: 40px;
  padding: 5px;
  text-align: center;
}


</style>	
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>


<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid">
		
			<form action="/hurdles/site/pay.do" method="post"> 
				<table class="table">
				    <thead>
				      <tr>
				        <th> 상품명 </th>
				        <th>상품수량</th>
				        <th>상품가격</th>
				      </tr>
				    </thead>
					<tbody>
					  <c:forEach var ="cart" items="${cartList}" varStatus="status">
						<tr class="cart">
							<td><input name="product" id="${status.index }name" type="checkbox" value="${cart.cartNo }"><label for="${status.index }name">${cart.productName}</label></td>
							<td><input name="product" type="number" min="1" max="10" value="${cart.productQty}"></td>
							<td><input name="product" type="text" value="${cart.productPrice * cart.productQty}" readonly>원</td>
						</tr>
					  </c:forEach>
					  <tr>
					  	<td>예상 할인금액 : 원</td>
						<td>
							<h4>결제예상 금액 : <span id="totalPrice" name="product">0</span> 원</h4>
						</td>
					  </tr>
					</tbody>
				</table>
			</form>
			
					<h5 class="mb-3">배송지 정보</h5>
					<div class="mb-3">
                        <label for="receiverName" class="form-label">수령인</label>
                        <input type="text" class="form-control" id="receiverName" placeholder="수령인을 입력하세요">
                    </div>
                    <div class="mb-3">
                        <label for="contact" class="form-label">연락처</label>
                        <input type="text" class="form-control" id="contact" pattern="(010)-[0-9]{4}-[0-9]{4}" placeholder="010-1234-5678">
                    </div>
                    <div class="mb-3">
                        <label for="postcode" class="form-label">우편번호</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
                            <button type="button" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">주소</label>
                        <input type="text" class="form-control" id="sample6_address" placeholder="주소">
                    </div>
                    <div class="mb-3">
                        <label for="detailAddress" class="form-label">상세주소</label>
                        <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
                    </div>
                    <div class="mb-3">
                        <label for="extraAddress" class="form-label">참고항목</label>
                        <input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
                    </div>
                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">배송지 변경</button>
                    </div>
                    
                <h5 class="mb-3">할인</h5>
                <div class="form-group mb-3">
                    <label for="coupon" class="form-label">쿠폰</label>
                    <input type="text" class="form-control" id="coupon" placeholder="쿠폰 코드 입력">
                </div>
                <div class="form-group mb-3">
                    <label for="mileage" class="form-label">마일리지</label>
                    <input type="text" class="form-control" id="mileage" placeholder="마일리지 입력">
                </div>
				
				
				 <!-- 결제 정보 -->
                <h5 class="mb-3">결제할 상품 목록</h5>
                <form method="post" action="/hurdles/site/kakaoPay.do">
                    <div class="mb-3">
        
                        <label for="itemName" class="form-label">상품명</label>
                        <input type="text" class="form-control" id="itemName" name="item_name" value="초코파이" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="form-label">상품수량</label>
                        <input type="text" class="form-control" id="quantity" name="quantity" value="10" readonly>
                    </div>
                
                    <div class="mb-3">
                        <label for="totalAmount" class="form-label">상품총액</label>
                        <input type="text" class="form-control" id="totalAmount" name="total_amount" value="10" readonly>
                    </div>
                    
                    <h5 class="mb-3">결제 방법</h5>
                    <div class="mb-3 form-check">
                        <input class="form-check-input" type="radio" value="kakaopay" id="kakaopay" checked>
                        <label class="form-check-label" for="kakaopay">
                            <img src="../assets/img/kakaopay.png" alt="카카오페이" style="width: 80px;"> 카카오페이
                        </label>
                    </div>
                    
                    <!-- Hidden Fields -->
                    <input type="hidden" name="partner_order_id" value="123">
                    <input type="hidden" name="partner_user_id" value="12">
                    <input type="hidden" name="tax_free_amount" value="0">        
                    <input type="hidden" name="command" value="ready">
                    <input type="hidden" value="TC0ONETIME" name="cid" readonly>
                    <input type="hidden" value="http://localhost:8080/hurdles/pay/success.jsp" name="approval_url" readonly>
                    <input type="hidden" value="http://localhost:8080/hurdles/WEB-INF/view/site/pay/cancel.jsp" name="cancel_url" readonly>
                    <input type="hidden" value="http://localhost:8080/hurdles/WEB-INF/view/site/pay/fail.jsp" name="fail_url" readonly>
                    
                    <div class="text-center">
                        <button type="submit" class="btn btn-danger btn-lg w-100">결제하기</button>
                    </div>
                </form>
			
     	</div>
	</main>
	<script>
	  let totalPriceDom = document.querySelector("#totalPrice"); 
	  let priceList = [];
	  
	  // 총 가격 계산 함수
	  function calculateTotalPrice() {
	    let total = 0;
	    document.querySelectorAll(".cart").forEach((item, i) => {
	      let checkbox = item.querySelector("input[type=checkbox]");
	      let priceDom = item.querySelector("input[type=text]");
	      if (checkbox.checked) {
	        total += +priceDom.value; // 체크된 항목만 더함
	      }
	    });
	    totalPriceDom.innerText = total;
	  }

	  // 초기 설정
	  document.querySelectorAll(".cart").forEach((item, i) => {
	    let qty = item.querySelector("input[type=number]");
	    let priceDom = item.querySelector("input[type=text]");
	    let price = priceDom.value;
	    let checkbox = item.querySelector("input[type=checkbox]");
	    
	    priceList.push(price);
	    
	    // 수량 변경 이벤트
	    qty.addEventListener("change", (e) => {
	      const { value } = e.target;
	      priceDom.value = value * price;
	      
	      // 가격 리스트 수정
	      priceList[i] = priceDom.value;
	      calculateTotalPrice();  // 총 가격 재계산
	    });

	    // 체크박스 클릭 이벤트
	    checkbox.addEventListener("change", (e) => {
	      calculateTotalPrice(); // 체크박스 상태에 따라 가격 재계산
	    });

	    // 초기값 설정
	    calculateTotalPrice();
	  });

	</script>
	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
	    

</body>
</html>