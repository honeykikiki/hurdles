<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="nav" value="myPage" scope="request"/>
<c:set var="titleName" value="회원탈퇴" scope="request"/>
<c:set var="paging" value="${paginationInfo}"/>
<c:set var="pagingOption" property="" value="${paginationInfo.getSearchVo()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>${titleName}</title>
	<jsp:include page="/WEB-INF/view/site/layout/prestyle.jsp" />
</head>

<body>
  	<jsp:include page="/WEB-INF/view/site/layout/header.jsp" />

  	<main class="main">
  	     <div class="container-fluid">
            <div class="row justify-content-center">
              <div class="col-md-8">
                  <div class="card shadow">
                      <div class="card-header text-center mt-2">
                          <h4>회원 탈퇴</h4>
                      </div>
                      <div class="card-body">
                          <p class="text-danger">탈퇴 시 계정과 모든 데이터는 삭제되며 복구가 불가능합니다. 신중히 결정해주세요.</p>
                          <hr>

                          <h5 class="mb-3">탈퇴 사유</h5>
                            <!-- 탈퇴 사유 선택 -->
                            <div class="mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reason" id="reason1" value="서비스 불만">
                                    <label class="form-check-label" for="reason1">서비스 불만</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reason" id="reason2" value="개인정보 우려">
                                    <label class="form-check-label" for="reason2">개인정보 우려</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reason" id="reason3" value="다른 서비스 이용">
                                    <label class="form-check-label" for="reason3">다른 서비스 이용</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reason" id="reason4" value="기타">
                                    <label class="form-check-label" for="reason4">기타</label>
                                </div>
                            </div>

                            <!-- 추가 의견 입력 -->
                            <div class="mb-3">
                                <label for="additionalFeedback" class="form-label">추가 의견 (선택)</label>
                                <textarea class="form-control" id="additionalFeedback" name="feedback" rows="4" placeholder="탈퇴와 관련된 의견을 남겨주세요."></textarea>
                            </div>

                            <!-- 버튼 -->
                            <div class="text-center">
                                <button class="btn btn-danger w-100 cancelMemberModal">회원 탈퇴</button>
                                <button onclick="history.back()" class="btn btn-secondary w-100 mt-3">취소</ㅠ>
                            </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
	</main>

  <div class="modal" tabindex="-1" id="cancelMemberModal">
		<div class="modal-dialog">
			<form action="${pageContext.request.contextPath}/auth/cancelMember.do" method="post">
			  <div class="modal-content">
  				<div class="modal-header">
  					<h5 class="modal-title">회원 탈퇴 여부</h5>
  				</div>
  				<div class="modal-body">
            <input type="hidden" name="memberNo" value="${member.memberNo}">
  					정말로 회원 탈퇴 하시겠습니까?
  				</div>
  				<div class="modal-footer">
  					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
  					<button type="submit" class="btn btn-danger">회원탈퇴</button>
  				</div>
  			</div>
			</form>
		</div>
	</div>

  <script>
    const modal = document.getElementById("cancelMemberModal");
    document.querySelector(".cancelMemberModal").addEventListener("click", () => {
      bootstrap.Modal.getOrCreateInstance(modal).show();

    })
  </script>

	<jsp:include page="/WEB-INF/view/site/layout/footer.jsp" />
	<jsp:include page="/WEB-INF/view/site/layout/prescript.jsp" />
</body>
</html>