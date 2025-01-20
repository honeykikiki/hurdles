<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="리뷰 작성" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>


<!DOCTYPE html>
<html lang="ko">
<head>

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>리뷰작성</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
</head>
<style>

.rating {
   position: relative;
   width: 180px;
   background: transparent;
   display: flex;
   justify-content: center;
   align-items: center;
   gap: .3em;
   padding: 5px;
   overflow: hidden;
   border-radius: 20px;
   box-shadow: 0 0 2px #b3acac;
}

.rating__result {
   position: absolute;
   top: 0;
   left: 0;
   transform: translateY(-10px) translateX(-5px);
   z-index: -9;
   font: 3em Arial, Helvetica, sans-serif;
   color: #ebebeb8e;
   pointer-events: none;
}

.rating__star {
   font-size: 1.3em;
   cursor: pointer;
   color: #dabd18b2;
   transition: filter linear .3s;
}

.rating__star:hover {
   filter: drop-shadow(1px 1px 4px gold);
}



</style>
<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main style="max-width: 1280px; margin: 0 auto;">
  	     <div class="container-fluid mb-4">
  	     <h1>리뷰</h1>
			<form action="reviewInsert.do"  class="user needs-validation" novalidate method="post" enctype="multipart/form-data">
			<!-- memberNo -->
			<input type="hidden" name="memberNo" value="${ReviewVo.memberNo}">
	        <!-- restaurantNo -->
	        <input type="hidden" name="restaurantNo" value="${ReviewVo.restaurantNo}">
	        <input type="hidden" name="ordersNo" value="${ReviewVo.ordersNo}">
	        <input type="hidden" name="score" value="${ReviewVo.reviewScore}">
<%-- 	        <input type="hidden" name="restaurantName" value="${ReviewVo.restaurantName}"> --%>
<!-- 	        <input type="hidden" name="restaurantNo" value="106"> -->
			  
<!-- 			  별점 -->
			<div class="rating">
			    <span class="rating__result"></span> 
			    <i class="rating__star far fa-star"></i>
			    <i class="rating__star far fa-star"></i>
			    <i class="rating__star far fa-star"></i>
			    <i class="rating__star far fa-star"></i>
			    <i class="rating__star far fa-star"></i>
	    	</div>
					
  	    	 <!-- 내용 -->
			  <div class="mb-4">
			    <label for="questionContent" class="form-label">리뷰 내용</label>
			    <textarea class="form-control"  rows="10" id="reviewContent" name="reviewContent" placeholder="내용을 입력해 주세요" required></textarea>
                <div class="invalid-feedback">내용을 입력해주세요</div>
			  </div>	
					<!-- 단일 파일 -->
				  <%-- <file-upload name="filename" label="첨부파일" contextPath="${pageContext.request.contextPath}" max-files="1"></file-upload> --%>
				<button class="btn-getstarted" type="submit">저장</button>
			</form>
	 		
     	</div>
	</main>


	
	 
<!-- required	이벤트 처리  -->
		<script>
		
		// if ("${member.memberNo}" == 0) {
		// 	bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
		// 	return;
		// }

// 	     별점 
     	const ratingStars = [...document.getElementsByClassName("rating__star")];
		const ratingResult = document.querySelector(".rating__result");
		const scoreInput = document.querySelector("input[name='score']"); // hidden input 요소
		
		printRatingResult(ratingResult);
		
		function executeRating(stars, result) {
			console.log("??")
		   const starClassActive = "rating__star fas fa-star";
		   const starClassUnactive = "rating__star far fa-star";
		   const starsLength = stars.length;
		   let i;
		
		   stars.map((star) => {
		      star.onclick = () => {
		         i = stars.indexOf(star);
		
		         if (star.className.indexOf(starClassUnactive) !== -1) {
		            const selectedRating = i + 1; // 선택된 별점 값
		            printRatingResult(result, selectedRating);
		            scoreInput.value = selectedRating; // hidden input의 value 설정
		            for (i; i >= 0; --i) stars[i].className = starClassActive;
		         } else {
		            const selectedRating = i; // 선택된 별점 값
		            printRatingResult(result, selectedRating);
		            scoreInput.value = selectedRating; // hidden input의 value 설정
		            for (i; i < starsLength; ++i) stars[i].className = starClassUnactive;
		         }
		      };
		   });
		}
		
		function printRatingResult(result, num = 0) {
		   result.textContent = `${num}/5`;
		}
		
		executeRating(ratingStars, ratingResult);
     </script>
     
	 <jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	 <jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>