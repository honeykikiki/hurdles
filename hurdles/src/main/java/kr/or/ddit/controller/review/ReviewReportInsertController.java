package kr.or.ddit.controller.review;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.review.ReviewService;
import kr.or.ddit.util.JsonUtil;
import kr.or.ddit.util.ParamResult;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.ReviewReportVo;

@WebServlet("/site/reviewReportInsert.do")
@MultipartConfig
public class ReviewReportInsertController extends HttpServlet {
	ReviewService reviewService = ReviewService.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] requiredParams = { "reviewNo", "reviewReportDes", "memberNo", "targetMemberNo" };

		ParamResult paramResult = ParamResult.valid(req, requiredParams);// 필수인자 확인

		if (paramResult.getCode() == 1 && !paramResult.getMessage().equals("")) {
			// 에러 메시지를 요청 속성에 추가
			req.setAttribute("errorMessage", paramResult.getMessage());

			// 에러 페이지로 포워드
			req.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(req, resp);
			return;
		}
		
		ReviewReportVo newReviewReport = RequestToVoMapper.mapRequestToVo(req, ReviewReportVo.class);
		
		// 리뷰 신고 no가져오기
		int reviewReportNo = reviewService.getReviewReportNo();
		newReviewReport.setReviewReportNo(reviewReportNo);
		
		int  result = reviewService.reviewReportInsert(newReviewReport);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", result == 1 ? "success" : "fail");

		resp.setContentType("application/json");
		resp.getWriter().write(JsonUtil.toJson(map));
	}

}
