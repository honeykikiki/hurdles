package kr.or.ddit.controller.review;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.review.ReviewService;
import kr.or.ddit.util.ParamResult;
import kr.or.ddit.vo.ReviewVo;

@WebServlet("/site/reviewDetail.do")
public class ReviewDetailController extends HttpServlet{
	
	ReviewService reviewService = ReviewService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		HttpSession session = req.getSession(false);
//		
//		MemberVo memberNoVo = (MemberVo)session.getAttribute("member");
//		
//		String memberName = memberNoVo.getMemberName();
//		
//		int memberNo = memberNoVo.getMemberNo();
//		int memberNo = 3;
		
		String[] params = {"reviewNo"};
		
		ParamResult paramResult = ParamResult.valid(req, params);// 필수인자 확인
		
		if (paramResult.getCode() == 1 && !paramResult.getMessage().equals("")) {
			// 에러 메시지를 요청 속성에 추가
			req.setAttribute("errorMessage", paramResult.getMessage());
   
			// 에러 페이지로 포워드
			req.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(req, resp);
			return;
		}
		
		
		String reviewNoStr = req.getParameter("reviewNo");
		String restaurantNoStr = req.getParameter("restaurantNo");
		String memNoStr = req.getParameter("memberNo");
		String ordNoStr = req.getParameter("ordersNo");
		
		
		int restaurantNo = Integer.parseInt(restaurantNoStr);
		int reviewNo = Integer.parseInt(reviewNoStr);
		int memNo = Integer.parseInt(memNoStr);
		int ordNo = Integer.parseInt(ordNoStr);
		
		ReviewVo reviewVo = new ReviewVo();
		reviewVo.setReviewNo(reviewNo);
		reviewVo.setMemberNo(memNo);
		reviewVo.setOrdersNo(ordNo);
		System.out.println(reviewVo);
		
		ReviewVo reviewDetail = reviewService.reviewDetail(reviewVo);
		
		System.out.println(reviewDetail);
		
//		String fileSaveName = reviewDetail.getFileSaveName();

		reviewDetail.setRestaurantNo(restaurantNo);


//		List<FileVo>fileList = reviewService.getFileList(reviewDetail);
		

//		System.out.println(fileSaveName);
		
		
		
		System.out.println("조회한 리뷰정보=======================>" + reviewDetail);
//		req.setAttribute("fileList", fileList);
		req.setAttribute("reviewDetail",reviewDetail);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/review/reviewDetail.jsp").forward(req, resp);
		
		
	}
}
