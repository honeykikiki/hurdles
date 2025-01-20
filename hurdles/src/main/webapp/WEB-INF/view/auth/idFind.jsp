<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="login" scope="request"/>
<c:set var="titleName" value="아이디 찾기" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>${titleName }</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />

	<style>
		.modal-body.success {
				background-color: #e9f7e9;
				color: #155724;
				border-left: 5px solid #28a745;
		}

		.modal-body.error {
				background-color: #f8d7da;
				color: #721c24;
				border-left: 5px solid #dc3545;
		}
	</style>
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
												<h2>아이디 찾기</h2>
												<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt=""/>
	                    </div>
	                    <form class="user" novalidate method="post">
												<div class="mb-4">
														<label class="form-label mr-4" for="memberName">이름</label>
														<input  class="form-control" name="memberName" type="text" id="memberName" required placeholder="이름을 입력해주세요."/>
														<div class="invalid-feedback">이름을 입력해주세요.</div>
												</div>

												<div class="mb-4">
														<label class="form-label mr-4" for="memberEmail">이메일</label>
														<input  class="form-control" name="memberEmail" type="email" id="memberEmail" required placeholder="이메일을 입력해주세요." />
														<div class="invalid-feedback">이메일을 입력해주세요.</div>
												</div>
	                      <button class="btn-getstarted w-100">아이디 찾기</button>
	                    </form>
	                    <div class="text-center mt-4">
	                      <a class="smail me-4" href="${pageContext.request.contextPath}/auth/pwFind.do">비밀번호 찾기</a>
												<a class="smail" href="${pageContext.request.contextPath}/auth/login.do">로그인</a>
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

	<div class="modal" tabindex="-1" id="idFindModal">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">아이디 찾기 성공</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body success">
					<strong>성공! 아이디를 찾았습니다!</strong>
					<div class="d-flex ">
						
						<h2></h2>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/auth/login.do">로그인하러 가기</a>
				</div>
			</div>
		</div>
	</div>


	<div class="modal" tabindex="-1" id="idFindErrorModal">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">아이디 찾기 실패</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body error">
					<strong>실패 </strong>
					<h2></h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

		<script>
			
			document.querySelector("form").addEventListener("submit", async (e) => {
					e.preventDefault();

					if (!e.target.checkValidity()) {
						e.target.classList.add('was-validated')
						return;
          }
  
				try {
					const response = await fetch("/hurdles/auth/idFind.do",
						{method: "POST", body: new FormData(document.querySelector("form"))}
					)

					if (!response.ok) throw new Error("Failed to fetch data");

					let data = await response.json(); // JSON 형태로 응답 처리
						console.log(data);
						if (data != null && data.item) {
							let item = data.item;
							let id = data.id;
							let modal = null;

							if (item == "success") {
								modal = document.querySelector("#idFindModal");
							} else {
								modal = document.querySelector("#idFindErrorModal");
							}

							modal.querySelector(".modal-body h2").innerHTML = id;
							bootstrap.Modal.getOrCreateInstance(modal).show();
						}
				} catch (e) {
					console.error(e);
				}
			})
		</script>

		<%-- <jsp:include page="/WEB-INF/view/site/layout/footer.jsp" /> --%>
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>


</html>