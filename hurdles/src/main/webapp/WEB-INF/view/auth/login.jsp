<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="login" scope="request"/>
<c:set var="titleName" value="로그인" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>${titleName }</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
		<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

		<main class="main">
			<div class="container-fluid">
			  <div class="row justify-content-center">
			    <div class="col-xl-5 col-lg-6 col-md-9">
			      <div class="card o-hidden border-0 shadow-lg my-5">
			        <div class="card-body p-0">
			          <!-- Nested Row within Card Body -->
			          <div class="row">
	                <div class="col-lg-12">
	                  <div class="p-5">
	                    <div class="text-center mb-4">
												<h2>로그인</h2>
	                      <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt=""/>
	                    </div>
	                    <form class="user needs-validation" novalidate method="post">
	                      <div class="mb-4">
	                        <label class="form-label mr-4" for="memberId">아이디</label>
	                        <input class="form-control" name="memberId" type="text" id="memberId" required value="${member.memberId }" placeholder="아이디를 입력해주세요." />
	                        <div class="invalid-feedback">아이디를 입력해주세요.</div>
	                      </div>
	                      <div class="mb-4">
	                        <label class="form-label mr-4" for="memberPw">비밀번호</label>
	                        <input class="form-control" name="memberPw" type="password" id="memberPw" required   placeholder="비밀번호를 입력해주세요."/>
	                        <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
	                      </div>
												<c:if test="${not empty message}" >
													<div class="alert alert-danger text-center">
															<strong>${message}</strong>
													</div>
												</c:if>
												
	                      <button type="submit" class="btn-getstarted w-100">로그인</button>
	                    </form>
	                    <div class="text-center mt-4">
	                      <a class="smail me-4" href="${pageContext.request.contextPath}/auth/idFind.do" >아이디 찾기</a>
	                      <a class="smail" href="${pageContext.request.contextPath}/auth/signup.do" >회원가입</a>
	                    </div>
	                  </div>
	                </div>
	              </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		</main>

		<%-- <jsp:include page="/WEB-INF/view/site/layout/footer.jsp" /> --%>
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>


</html>