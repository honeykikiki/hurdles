<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="titleName" value="멤버 상세보기" scope="request" />
<c:set var="paging" value="${paginationInfo}" />
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>유저 상세보기</title>
<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />




</head>

<body>
	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

<main class="main py-5">
    <div class="container-fluid">
        <!-- Card to display member details -->
        <div class="card mx-auto shadow" style="max-width: 600px;">
            <div class="card-body">
                <div class="text-center">
                    <!-- Image with fallback -->
                    <img 
                        src="${filePath}" 
                        onerror="this.src='${pageContext.request.contextPath}/assets/img/undraw_profile.svg'" 
                        class="img-thumbnail rounded-circle mb-3" 
                        alt="Profile Image" 
                        width="100" 
                        height="100"
                    >
                   
                </div>

                <!-- Member details -->
                <h5 class="card-title text-center">${memberDetail.memberName }님의 상세정보</h5>
                <ul class="list-group list-group-flush mb-3">
                    <li class="list-group-item">
                        <strong>이메일:</strong> ${memberDetail.memberEmail}
                    </li>
                    <li class="list-group-item">
                        <strong>등급:</strong> 
                       <%--  <a href="gradeDetail.do?gradeNo=${memberDetail.gradeNo}" class="text-decoration-none"> --%>
                            ${gradeName}
                        </a>
                    </li>
                    <li class="list-group-item">
                        <strong>팔로우 수:</strong> 
                        <a href="followDetail.do?memberNo=${memberDetail.memberNo}" class="text-decoration-none" id="followCnt">
                            ${getFollowCount}
                        </a>
                    </li>
                    <li class="list-group-item">
                        <strong>팔로워 수:</strong> 
                        <a href="followerDetail.do?memberNo=${memberDetail.memberNo}" class="text-decoration-none" id="followerCnt">
                            ${getFollowingCount}
                        </a>
                    </li>
                </ul>

                <!-- Action buttons -->
                <div class="d-grid gap-2">
                    <a href="reviewList.do?memberNo=${memberDetail.memberNo }">리뷰 목록 조회하기</a>
                    <a href="pickRestaurantList.do?memberNo=${memberDetail.memberNo }">찜한 식당 목록 조회하기</a>
                    <button id="follow" class="btn btn-success ${followMember == null && memberDetail.memberNo!=member.memberNo ? '' : 'd-none'}" onclick="follow()">팔로우하기</button>
                    <button id="cancelFollow" class="btn btn-danger ${followMember != null  ? '' : 'd-none'}"  onclick="cancelFollow()">팔로우 취소</button>
                    <button class="btn btn-light" onclick="history.back()">뒤로가기</button>
                </div>
            </div>
        </div>
    </div>
</main>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
	
	
	<script type="text/javascript">


async function follow() {
	if ("${member.memberNo}" == 0) {
		bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
		
	} 
	else{
    try {
      let response = await fetch(
  		  	`/hurdles/site/followMember.do?memberNo=${memberDetail.memberNo}`,
    		{method: "POST"}
      );
      if (!response.ok) throw new Error("Failed to fetch data");
	  
      let data = await response.json(); // JSON 형태로 응답 처리
      console.log(data);
      if (data != null && data.item) {
    	  let item = data.item;
    	  
    	  
    	  if (item == "success") {
    		  document.querySelector("#follow").classList.add("d-none");
    		  document.querySelector("#cancelFollow").classList.remove("d-none");
    		  let followerCnt = document.querySelector("#followerCnt");
    		  +followerCnt.innerText++;
    	  }
      }
    } catch (error) {
      console.error("Error fetching data:", error);
      return null;
    }
    }
  }
  
async function cancelFollow() {
	if ("${member.memberNo}" == 0) {
		bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
		
	} else {
		
	    try {
	        let response = await fetch(
	      		  	`/hurdles/site/cancelFollowMember.do?memberNo=${memberDetail.memberNo}`,
	        		{method: "POST"}
	          );
	        if (!response.ok) throw new Error("Failed to fetch data");
		  
	      let data = await response.json(); // JSON 형태로 응답 처리
	      console.log(data);
	      if (data != null && data.item) {
	    	  let item = data.item;
	    	  
	    	  if (item == "success") {
	    		  document.querySelector("#follow").classList.remove("d-none");
	    		  document.querySelector("#cancelFollow").classList.add("d-none");
	    		  let followerCnt = document.querySelector("#followerCnt");
	    		  +followerCnt.innerText--;
	    	  }
	      }
	    }catch (error) {
	        console.error("Error fetching data:", error);
	        return null;
	      }
	}
  }



</script>
</body>
</html>

