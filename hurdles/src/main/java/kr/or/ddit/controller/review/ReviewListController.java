package kr.or.ddit.controller.review;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.review.ReviewService;
import kr.or.ddit.vo.ReviewVo;


@WebServlet("/site/reviewList.do")
public class ReviewListController extends HttpServlet{
	ReviewService reviewService =ReviewService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memberNoStr = req.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNoStr);
		
		ReviewVo reviewVo = new ReviewVo();
		reviewVo.setMemberNo(memberNo);
		
		
		
		List<ReviewVo>reviewList= reviewService.reviewList(reviewVo);
		ReviewVo getName= reviewService.getName(reviewVo);
		
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("getName", getName);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/review/reviewList.jsp").forward(req, resp);
	}
}
