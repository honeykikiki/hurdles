package kr.or.ddit.controller.review;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.review.ReviewService;
import kr.or.ddit.vo.ReviewVo;

@WebServlet("/site/reviewDel.do")
public class ReviewDeleteController extends HttpServlet{
	
	ReviewService reviewService=ReviewService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String reviewNoStr= req.getParameter("reviewNo");

		int reviewNo = Integer.parseInt(reviewNoStr);
		
		String memberNoStr = req.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNoStr);
		
		ReviewVo reviewVo= new ReviewVo();

		
		reviewVo.setMemberNo(memberNo);
		reviewVo.setReviewNo(reviewNo);

		reviewService.reviewDelete(reviewVo);

	
		resp.sendRedirect(req.getContextPath() +"/site/reviewList.do?memberNo="+memberNo);
	}
}
