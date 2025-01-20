<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="장바구니" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <title>장바구니 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   
<style>
.quantity-input {
  width: 60px;
  padding: 5px;
  text-align: center;
}

.card-custom {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
}

.card-img-top {
  height: 180px;
  object-fit: cover;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.card-body {
  padding: 15px;
}

.btn-custom {
  background-color: #f76c6c;
  color: white;
  transition: background-color 0.3s;
}

.btn-custom:hover {
  background-color: #e05959;
}

.price-text, .product-total-price{
  font-weight: bold;
  color: #333;
}
.card-title {
    font-weight: 600;
}
</style>    
    <jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
    <jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

    <main class="main">
         <div class="container-fluid">
         	
        	<c:if test="${not empty cartList}">
            <form action="/hurdles/site/pay.do" method="post" id="cartForm">
			    <div class="row">
			        <c:forEach var="cart" items="${cartList}" varStatus="status">
			          
			            <div class="col-md-4 col-lg-3 mb-4 cart-item">
			                <div class="card card-custom h-100">
			                    <input type="hidden" name="cartNo" class="cartNo" value="${cart.cartNo}">
			                    <!-- 체크박스 추가 -->
			                    
                                  <input type="checkbox" style="zoom:1.5" class="form-check-input cart-checkbox" data-price="${cart.productPrice}" data-qty="${cart.productQty}" id="cart-checkbox-${cart.cartNo}" data-cartno="${cart.cartNo}"/>
                                    <label for="cart-checkbox-${cart.cartNo}">
			                    
                                  	<div class="card-body d-flex flex-column justify-content-between">
                                        <h5 class="card-title">${cart.restaurantName}</h5>
                                        <p class="card-text">${cart.productName}</p>
                                         <p class="card-text">상품 금액 : <span class="price-text"><fmt:formatNumber value="${cart.productPrice}" pattern="#,###"/></span> 원</p>
                                        <div class="form-group mb-3">
                                            <label for="quantity-${cart.cartNo}">수량</label>
                                            <!-- 수량 입력 필드 추가 -->
                                            <input type="number" id="quantity-${cart.cartNo}" data-cart-no="${cart.cartNo }" class="quantity-input" value="${cart.productQty}" min="1"/>
                                        </div>
                                        <p class="card-text">상품 총 가격 : <span class="product-total-price"><fmt:formatNumber value="${cart.productQty * cart.productPrice}" pattern="#,###"/></span> 원</p>     
                                       <button type="button" data-cart-no="${cart.cartNo}" class="btn btn-primary cart-delete">삭제</button>
                                  	</div>
                                 </label>
			                </div>
			            </div>
			        </c:forEach>
			    </div>
			
			    <!-- 총합계 -->
			    <div class="mt-4">
			     	<input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="0"/>
			        <h4>총합계: <span id="totalPrice">0</span>원</h4>
			    </div>
				
			    <button type="submit" class="btn btn-danger btn-block mt-4 col-3 ">주문하기</button>
			</form>
			</c:if>
			
			<c:if test="${empty cartList}">
			<h2 class="text-center mb-4">장바구니</h2>
            	<div class="alert alert-info text-center">
                	<strong>장바구니가 비었습니다.</strong>
            	</div>
       	    </c:if>
        </div>
    </main>

<script>
// cart-delete
document.querySelectorAll('.cart-delete').forEach((item) => {
	item.addEventListener("click", (e) => {
		  $.ajax({
				
			  url : "/hurdles/site/cartDelete.do",
			  type : "POST",
			  data : {			  
				  "cartNo" : e.target.dataset.cartNo
			  },
			  success : function(res) {
				alert("삭제되었습니다");
				location.reload();
			  }
			  
		  });
	})
	
});

$(function(){

	$(document).on('change', '.quantity-input', function(e){		
		//alert($(this).val());
		let productQty = $(this).val();
		//번호 
		let cartNo = e.target.dataset.cartNo;
		
		//alert(productQty + " , " +  cartNo);
		
		$.ajax({
		   url : "/hurdles/site/cartList.do",
		   data : {
			   "cartNo" : cartNo,
			   "productQty" : productQty
			},
		   type : 'post',
		   success : function(res){
			   //성공하면 - db 변경 성공
			   
			   // result.jsp에 있는 flag를 읽어온다
			   alert(res.flag);
			
		   },
		   error : function(xhr){
			   alert("오류: " + xhr.status);
		   },
		   dataType : 'json'
		}) 
	})
})


// 총 가격 계산 함수
function calculateTotalPrice() {
    let total = 0;

    // 모든 체크된 체크박스에 대해 가격 계산
    document.querySelectorAll('.cart-checkbox:checked').forEach(checkbox => {
        const quantity = checkbox.closest('.cart-item').querySelector('.quantity-input').value;
        const pricePerItem = checkbox.dataset.price;

        total += quantity * pricePerItem;
    });

    // 총합계 표시
    document.querySelector('#totalPrice').innerText = total.toLocaleString();
    
 	// hidden 필드에 총합계 금액 설정
    document.querySelector('#hiddenTotalPrice').value = total;
}

//초기 설정 및 이벤트 처리
document.querySelectorAll('.cart-item').forEach(cartItem => {
    const checkbox = cartItem.querySelector('.cart-checkbox');
    const quantityInput = cartItem.querySelector('.quantity-input');
    const productTotalPriceDom = cartItem.querySelector('.product-total-price');
    
    // 수량 변경 이벤트
    quantityInput.addEventListener('input', () => {
        const quantity = quantityInput.value;
        const pricePerItem = checkbox.dataset.price;
        
        // 상품 총 가격 업데이트
        productTotalPriceDom.innerText = (quantity * pricePerItem).toLocaleString();

        // 체크박스가 체크된 경우 총합계 재계산
        if (checkbox.checked) {
            calculateTotalPrice();
        }
    });

    // 체크박스 클릭 이벤트
    checkbox.addEventListener('change', () => {
        calculateTotalPrice();
    });
});

// 페이지 로드 시 초기 총 가격 계산
calculateTotalPrice();

// 폼 제출 전에 체크된 항목의 cartNo만 전송
document.getElementById('cartForm').addEventListener('submit', function(event) {
	
	 // 체크된 체크박스가 있는지 확인
    const checkedCheckboxes = document.querySelectorAll('.cart-checkbox:checked');
	
    if (checkedCheckboxes.length === 0) {
 
        alert('장바구니에서 상품을 하나 이상 선택해주세요.');
        event.preventDefault(); // 폼 제출 막기
        return;
    }
	 
	 
     // 폼에서 기존의 cartNo들을 제거
    document.querySelectorAll('input[name="cartNo"]').forEach(input => input.remove());

    // 체크된 항목에 대해 cartNo를 동적으로 추가
    document.querySelectorAll('.cart-checkbox:checked').forEach(checkbox => {
        const cartNo = checkbox.dataset.cartno;
        const cartNoInput = document.createElement('input');
        cartNoInput.type = 'hidden';
        cartNoInput.name = 'cartNo';
        cartNoInput.value = cartNo;
        this.appendChild(cartNoInput);
    });
});

</script>

    <jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
    <jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>