<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<footer id="footer" class="footer dark-background mt-5">
   <div class="container">
     <div class="row gy-3">
       <div class="col-lg-4 col-md-6 d-flex">
         <i class="bi bi-geo-alt icon"></i>
         <div class="address">
           <h4>Address</h4>
           
           <p>대전광역시 중구 계룡로 846</p>
           <p>대덕인재개발원 </p>
           <p></p>
         </div>
       </div>

       <div class="col-lg-4 col-md-6 d-flex">
         <i class="bi bi-telephone icon"></i>
         <div>
           <h4>Contact</h4>
           <p>
             <strong>Phone:</strong> <span>042-0000-0000</span><br>
             <strong>Email:</strong> <span>info@gmail.com</span><br>
           </p>
         </div>
       </div>

       <div class="col-lg-4 col-md-6 d-flex">
         <i class="bi bi-clock icon"></i>
         <div>
           <h4>Opening Hours</h4>
           <p>
             <strong>Mon-Fir:</strong> <span>09AM - 18PM</span><br>
             <strong>Sat-Sun</strong>: <span>Closed</span>
           </p>
         </div>
       </div>

       <!-- <div class="col-lg-3 col-md-6">
         <h4>Follow Us</h4>
         <div class="social-links d-flex">
           <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
           <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
           <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
           <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
         </div>
       </div> -->

     </div>
   </div>

   <div class="container copyright text-center mt-4">
     <p>© <span>Copyright</span> <strong class="px-1 sitename">Massu</strong> <span>All Rights Reserved</span></p>
     <div class="credits">
       <!-- All the links in the footer should remain intact. -->
       <!-- You can delete the links only if you've purchased the pro version. -->
       <!-- Licensing information: https://bootstrapmade.com/license/ -->
       <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
       Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
     </div>
   </div>

 </footer>
 
 <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <!-- Preloader -->
 <div id=" "></div>


<div class="modal" tabindex="-1" id="logoutModal">
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">로그아웃</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>로그아웃 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/auth/logout.do">로그아웃</a>
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" id="loginConfirmModal">
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">로그인 하시겠습니까?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>로그인 후 이용하실 수 있습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/auth/login.do">로그인하러 가기</a>
      </div>
    </div>
  </div>
</div>

<!-- <div class="modal fade" id="postcodeModal" tabindex="-1" role="dialog" aria-hidden="true"> -->
<div class="modal fade" id="postcodeModal" tabindex="-1" role="dialog">
  <div class="modal-dialog  modal-md" role="document">
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