<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="메인" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>문의 상세보기</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
	<style>
/* 	  /* 버튼 색상 정의 */ */
/* 	  .btn-getstarted { */
/* 	    background-color: #007bff; /* 실제 버튼 색상 */ */
/* 	    color: #fff; */
/* 	  } */
	
/* 	  /* 테이블 감싸는 빨간 네모칸 스타일 */ */
/* 	  .table-wrapper { */
/* 	    border: 2px solid #007bff; /* 버튼 색상과 동일 */ */
/* 	    padding: 10px; */
/* 	    display: inline-block; */
/* 	    background-color: #f9f9f9; /* 배경색 추가 (필요 시) */ */
/* 	  } */
	
 	  /* 테이블 왼쪽 정렬 */
/*  	   .table {  */
/* 	    margin-left: 0;  */
/*  	  }  */
	
/*  	  /* 컨테이너의 패딩 제거 */  */
/* 	  .container-fluid { */
/* 	    padding: 0;  */
/*  	  }  */
</style>
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />


  	<main class="main">
  	     <div class="container-fluid mb-4" >
  	     <h1>1:1 문의하기</h1>
<!-- 			작성자,작성일,수정일 -->
		  	<div class="container-fluid mb-4 table-wrapper p-0">
			    <table class="table">
			      <thead>
			        <tr>
			          <th>작성자</th>
			          <th>작성일</th>
			          <th>수정일</th>
			        </tr>
			      </thead>
			      <tbody>
			        <tr>
			          <td>${question.memberId}</td>
			          <td>${question.createDate}</td>
			          <td>${question.updateDate}</td>
			        </tr>
			      </tbody>
			    </table>
			  </div>
<!-- 	문의 제목,문의 내용 ,문의답글 ,이전버튼 -->
			<!-- memberNo -->
			<input type="hidden" name="memberNo" value="${question.memberNo}">
			<input type="hidden" name="memberRole" value="${question.memberRole}">
	        <!-- restaurantNo -->
	<%--         <input type="hidden" name="restaurantNo" value="${restaurantNo}"> --%>
	        <input type="hidden" name="restaurantNo" value="106">
				<!--  제목 -->
			  <div class="mb-4">
			   <label for="questionTitle" class="form-label"><h4>문의 제목</h4></label>
			    <p>${question.questionTitle}</p>
                
			  </div>
			  
  	    	 <!-- 내용 -->
			  <div class="mb-4">
			    <label for="questionContent" class="form-label"><h4>문의내용</h4></label>
			    <p>${question.questionContent}</p>
                
			  </div>
					<!-- 파일불러오기 -->
				<c:if test="${not empty fileList}">
								<div class="row mb-3">
								<c:forEach items="${fileList}" var="file">
									<img class="col-3 rounded img-thumbnail mb-2" src="/upload/question/${file.fileSaveName}" onerror="this.src='${pageContext.request.contextPath  }/assets/img/image-error.png'"/>
								</c:forEach>
								</div>
						</c:if>

                   <!-- 리스트로 가기 -->
<!-- 				<button class="btn-getstarted" type="submit">이전</button> -->
<!-- 				답글읽기 -->
				 <div class="mb-4">
			    <label for="questionContent" class="form-label"></label>
			    	<c:if test="${member.memberRole == 2}"> 
			   <p>${question.questionAnswer}<p>
			    </c:if>
			  </div>
				
				<!-- 답글 --> 
				<form action="questionDetail.do" method="post">
				 <label for="questionContent" class="form-label mb-4"><h4>답글</h4></label>
				 <c:choose> 
				  <c:when test="${empty question.questionAnswer}">
				    <p>답글이 없습니다</p>
				  </c:when>
				  <c:otherwise> 			
				      <p>${question.questionAnswer}</p>	 
				   </c:otherwise>
				 </c:choose>    
			    <input type="hidden" name="questionNo" value="${question.questionNo}">
				<br><br><br><br>
<!-- 					  <div class="mb-4"> -->
<!-- 					답글작성부분입니다 -->
<%-- 				<c:if test="${not empty sessionScope.member }"> --%>
<%-- 					<c:set var="member" value="${sessionScope.member }" /> --%>
<%-- 					<c:if test="${member.memberRole == 1}"> --%>
<!-- 					    <label for="questionAnswer" class="form-label">답글입력</label> -->
<%-- 					    <textarea class="form-control mb-4"  rows="3" id="questionAnswer" name="questionAnswer" required>${question.questionAnswer}</textarea> --%>
<!-- 						<button class="btn-getstarted" type="submit">답글저장</button> -->
<%-- 					</c:if> --%>
<%-- 				</c:if> --%>
				</div>
				</form>
					  </div>
						<a href="questionList.do" class="text-white"><button class="btn-getstarted ">이전</button></a>
				
			
     
	</main> 
		<script>
		if ("${member.memberNo}" == 0) {
			bootstrap.Modal.getOrCreateInstance(document.querySelector("#loginConfirmModal")).show();
			return;
		}
	</script>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
<!-- 사장님 답글쓰기 버튼 처리	  회원이면 비활성화처리 -->
	
</body>
</html>