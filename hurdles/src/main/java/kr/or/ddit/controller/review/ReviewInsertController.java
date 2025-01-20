package kr.or.ddit.controller.review;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.file.service.FileService;
import kr.or.ddit.service.review.ReviewService;
import kr.or.ddit.util.FileUpload;
import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.MemberVo;
import kr.or.ddit.vo.ReviewVo;
@WebServlet("/site/reviewInsert.do")
@MultipartConfig
public class ReviewInsertController extends HttpServlet{
	
	ReviewService reviewService = ReviewService.getInstance();	
	FileService fileService = FileService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//로그인 정보
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memNo = member.getMemberNo();
		
		//리뷰를 쓸 식당정보 
		String restNo = req.getParameter("restaurantNo");
		int resNo = Integer.parseInt(restNo);
		System.out.println(restNo); 
		
		//주문번호 - 페이지 생성시 활성화
		String ordNoStr = req.getParameter("ordersNo");
		int ordNo = Integer.parseInt(ordNoStr);

		
		ReviewVo vo = new ReviewVo();
		vo.setMemberNo(memNo);
		vo.setRestaurantNo(resNo);
	    vo.setOrdersNo(ordNo);
		
		req.setAttribute("ReviewVo", vo);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/review/reviewInsert.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//로그인 정보
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memNo = member.getMemberNo();
		
		//리뷰를 쓸 식당정보 
		String restNo = req.getParameter("restaurantNo");
		int resNo = Integer.parseInt(restNo);
		
		//주문번호 - 페이지 생성시 활성화
		String ordNoStr = req.getParameter("ordersNo");
		int ordNo = Integer.parseInt(ordNoStr);

		//내용
		String content = req.getParameter("reviewContent");
		System.out.println("리뷰내용 ====>"+content);
		//별점
		String Score = req.getParameter("score");
		int reviewScore = Integer.parseInt(Score);
		System.out.println("리뷰점수=====>" +reviewScore);
		
		
		
		ReviewVo vo = new ReviewVo();
		vo.setMemberNo(memNo);
		vo.setRestaurantNo(resNo);
	    vo.setOrdersNo(ordNo);
	    vo.setReviewContent(content);
	    vo.setReviewScore(reviewScore);
	    

	    
	    List<FileVo> reviewFile = FileUpload.fileListWrite(req, "review");
	    
	    if(reviewFile.size()>0) {
	    	fileService.addFiles(reviewFile);
	    	
	    	vo.setFileNo(reviewFile.get(0).getFileNo());
	    }
	    
	    
	    int reviewNo = reviewService.getReviewNo();
	    vo.setReviewNo(reviewNo);
	    

	    
	    reviewService.reviewInsert(vo);
	    
	    
	    resp.sendRedirect(req.getContextPath() +"/site/reviewDetail.do?reviewNo=" + reviewNo + 
	    		"&restaurantNo=" + resNo + 
	    		"&ordersNo=" + ordNo + 
	    		"&memberNo=" + memNo);
		
		
		
		
	}

}
