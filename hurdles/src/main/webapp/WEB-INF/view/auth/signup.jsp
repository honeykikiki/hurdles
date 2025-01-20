<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="signup" scope="request"/>
<c:set var="titleName" value="회원가입" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>회원가입</title>
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
                            <div class="p-5">
                                <div class="text-center mb-4">
                                    <h2>회원가입</h2>
                                    <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="">
                                </div>
                                <form class="user" novalidate method="post">
                                    <div class="mb-4">
                                        <label class="form-label mr-4" for="memberId">아이디</label>
                                        <input class="form-control" name="memberId" type="text" id="memberId" required value="${member.memberId }" placeholder="아이디를 입력해주세요."/>
                                        <div class="invalid-feedback">아이디를 입력해주세요.</div>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label mr-4" for="memberPw">비밀번호</label>
                                        <input  class="form-control" name="memberPw" type="password" id="memberPw" required placeholder="비밀번호를 입력해주세요." />
                                        <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label mr-4" for="memberPwConfirm">비밀번호 재입력</label>
                                        <input  class="form-control" name="memberPwConfirm" type="password" id="memberPwConfirm" required placeholder="비밀번호를 재입력해주세요." />
                                        <div class="invalid-feedback">비밀번호를 다시한번 입력해주세요.</div>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label mr-4" for="memberName">이름</label>
                                        <input  class="form-control" name="memberName" type="text" id="memberName" required placeholder="이름을 입력해주세요." />
                                        <div class="invalid-feedback">이름을 입력해주세요.</div>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label mr-4" for="memberEmail">이메일</label>
                                        <input  class="form-control" name="memberEmail" type="email" id="memberEmail" required placeholder="이메일을 입력해주세요." />
                                        <div class="invalid-feedback">이메일을 입력해주세요.</div>
                                    </div>

                                    <div class="mb-4">
                                        <label for="memberTel" class="form-label">전화번호</label>
                                        <input id="phoneNumber" name="memberTel" type="tel" class="form-control" required="required" value="${member.memberTel }" placeholder="전화번호를 입력해주세요." >
                                        <div class="invalid-feedback">전화번호를 입력해주세요</div>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label mr-4" for="memberBir">생일</label>
                                        <input  class="form-control" name="memberBir" type="date" id="memberBir" required />
                                        <div class="invalid-feedback">생일을 선택해주세요.</div>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label mr-4 d-block" for="memberBir">성별</label>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="memberGender" id="memberGender1" value="0" required>
                                            <label class="form-check-label" for="memberGender1">남</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="memberGender" id="memberGender0" value="1" required>
                                            <label class="form-check-label" for="memberGender0">여</label>
                                        </div>
                                        <div class="invalid-feedback">성별을 선택해주세요.</div>
                                    </div>

                                    <div class="mb-4">
                                        <label for="memberAdd1" class="form-label mb-3">주소찾기</label>
                                        <input type="text" name="memberAdd1" class="form-control address-select" id="memberAdd1" placeholder="주소를 입력하세요." required="required" value="${member.memberAdd1 }" />
                                        <div class="invalid-feedback memberAdd1">식당 주소 찾기를 진행해주세요</div>
                                        <input type="text" name="memberAdd2" class="form-control mt-3" id="addressDetail" maxlength="30" placeholder="상세주소를 입력하세요." required="required" value="${member.memberAdd2 }" />
                                        <div class="invalid-feedback">상세주소를 입력해주세요</div>
                                    </div>


                                    <button type="submit" class="btn-getstarted w-100">회원가입</button>
                                </form>

                                <div class="text-center mt-4">
                                    <a class="smail" href="${pageContext.request.contextPath}/auth/login.do">로그인</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</main>

    <!-- <div class="modal fade" id="postcodeModal" tabindex="-1" role="dialog" aria-hidden="true"> -->
    <div class="modal fade" id="postcodeModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">주소 검색</h5>
            </div>
            <div class="modal-body">
                <div class="postcode-wrap"></div>
            </div>
            <div class="modal-footer border-0 pt-0">
                <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">닫기</button>
            </div>
            </div>
        </div>
    </div>

    <script>
        // 이메일 중복체크 (키 아웃 될때)

        // 회원가입
        const forms = document.querySelectorAll('form')
        const id = document.getElementById('memberId');
        const pw = document.getElementById('memberPw');
        const pwConfirm = document.getElementById('memberPwConfirm');
        const email = document.getElementById('memberEmail');
        const idRegex = /^[a-zA-Z0-9]+$/;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        let bIdCheck = false;
        let bPwCheck = false;
        let bEmailCheck = false;

        // 아이디 중복 체크
        id.addEventListener("focusout", async (e) => {
            if (e.target.value == "") {
                id.classList.add('is-invalid');
                id.nextElementSibling.innerText = "아이디를 입력해주세요.";
                return;
            }

            try {
                const formData = new FormData();
                formData.append("memberId", e.target.value);

                let response = await fetch(`/hurdles/auth/validId.do`,
                    {method: "POST", body: formData}
                );

                if (!response.ok) throw new Error("Failed to fetch data");

                let data = await response.json(); // JSON 형태로 응답 처리

                if (data != null && data.item) {
                    if (data.item == "success") {
                        bIdCheck = true;
                        id.classList.remove('is-invalid');
                    } else {
                        bIdCheck = false;
                        id.classList.add('is-invalid');
                        id.nextElementSibling.innerText = "아이디가 중복되었습니다.";
                    }
                }
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        })

        // 이메일 중복 체크
        email.addEventListener("focusout", async (e) => {
            if (e.target.value == "") {
                email.classList.add('is-invalid');
                email.nextElementSibling.innerText = "이메일을 입력해주세요.";
                return;
            }

            if (!emailRegex.test(e.target.value)) {
                email.classList.add('is-invalid');
                email.nextElementSibling.innerText = "이메일을 형식에 맞춰 입력해주세요.";
                return;
            }
            
            try {
                const formData = new FormData();
                formData.append("memberEmail", e.target.value);

                let response = await fetch(`/hurdles/auth/validEmail.do`,
                    {method: "POST", body: formData}
                );

                if (!response.ok) throw new Error("Failed to fetch data");
            
                let data = await response.json(); // JSON 형태로 응답 처리
                
                if (data != null && data.item) {
                    if (data.item == "success") {
                        bIdCheck = true;
                        email.classList.remove('is-invalid');
                    } else {
                        bIdCheck = false;
                        email.classList.add('is-invalid');
                        email.nextElementSibling.innerText = "이메일이 중복되었습니다.";
                    }
                }
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        })

        pwConfirm.addEventListener("focusout", () => {
            if (pw.value != pwConfirm.value) {
                pwConfirm.classList.add('is-invalid');
                pwConfirm.nextElementSibling.innerText = "입력한 비밀번호가 다릅니다.";
                return
            } else {
                pwConfirm.classList.remove('is-invalid');
                pwConfirm.nextElementSibling.innerText = "비밀번호 재입력을 입력해주세요.";
                bPwCheck = true;
            }
        })
        
        // Loop over them and prevent submission
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                // /^[a-zA-Z0-9]+$/
                // 영문 대소문자, 숫자만 가능합니다.
                // 6자 이상 20자 이하로 입력해주세요
                // id 중복 체크 (키 아웃 될때)
                if (id.value.length < 6 || id.value.length > 20) {
                    event.preventDefault();
                    event.stopPropagation();
                    id.classList.add('is-invalid');
                    id.nextElementSibling.innerText = "6자 이상 20자 이하로 입력해주세요.";
                    id.focus();
                } else if (!idRegex.test(id.value)) {
                    event.preventDefault();
                    event.stopPropagation();
                    id.classList.add('is-invalid');
                    id.nextElementSibling.innerText = "영문 대소문자, 숫자만 가능합니다.";
                    id.focus();
                } else if (!bIdCheck) {
                    event.preventDefault();
                    event.stopPropagation();
                    id.classList.add('is-invalid');
                    id.nextElementSibling.innerText = "아이디가 중복되었습니다.";
                    id.focus();
                } else {
                    id.classList.remove('is-invalid');
                }

                // /^[a-zA-Z0-9]+$/
                // 영문 대소문자, 숫자만 가능합니다.
                // 8자 이상 20자 이하로 입력해주세요
                // 비밀번호 중복체크
                // pw pwConfirm
                if (pw.value.length < 8 || pw.value.length > 20) {
                    event.preventDefault();
                    event.stopPropagation();
                    pw.classList.add('is-invalid');
                    pw.nextElementSibling.innerText = "8자 이상 20자 이하로 입력해주세요.";
                    pw.focus();
                } else if (!idRegex.test(pw.value)) {
                    event.preventDefault();
                    event.stopPropagation();
                    pw.classList.add('is-invalid');
                    pw.nextElementSibling.innerText = "영문 대소문자, 숫자만 가능합니다.";
                    pw.focus();
                } else {
                    pw.classList.remove('is-invalid');
                }

                if (!bPwCheck) {
                    event.preventDefault();
                    event.stopPropagation();
                    pwConfirm.classList.add('is-invalid');
                    pwConfirm.nextElementSibling.innerText = "입력한 비밀번호가 다릅니다.";
                    pwConfirm.focus();
                }

                if (!form.checkValidity()) {
                    // 폼 걸린 경우
                    event.preventDefault();
                    event.stopPropagation()
                } else {
                    form.classList.add('was-validated');
                }

                
            }, false)
        })
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>