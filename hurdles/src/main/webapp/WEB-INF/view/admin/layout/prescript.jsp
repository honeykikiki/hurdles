<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Scroll to Top Button-->
<!-- <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
  </a> -->
  
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  

 
<!--  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a> -->

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
              </div>
              <div class="modal-body">로그아웃 하시겠습니까?</div>
              <div class="modal-footer">
                  <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
                  <a class="btn btn-primary" href="${pageContext.request.contextPath}/auth/logout.do">로그아웃</a>
              </div>
          </div>
      </div>
  </div>
  
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
        <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/assets/vendor/chart.js/Chart.min.js"></script>
  
    <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/assets/js/sb-admin-2.min.js"></script>

  <!-- Page level custom scripts -->
  <c:if test="${nav == 'main' }">
	  <script src="${pageContext.request.contextPath}/assets/js/demo/chart-pie-demo.js"></script>
	  <script src="${pageContext.request.contextPath}/assets/js/demo/chart-area-demo.js"></script>
  </c:if>
  

  <!-- 자체 개발 js -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/common.js"></script>
