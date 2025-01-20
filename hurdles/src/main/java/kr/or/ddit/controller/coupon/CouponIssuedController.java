package kr.or.ddit.controller.coupon;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.coupon.CouponService;
import kr.or.ddit.util.JsonUtil;
import kr.or.ddit.util.ParamResult;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.CouponVo;

@WebServlet("/site/couponIssued.do")
@MultipartConfig
public class CouponIssuedController extends HttpServlet {
	CouponService couponService = CouponService.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String[] params = {"couponNo", "memberNo"};
		
		ParamResult paramResult = ParamResult.valid(req, params);// 필수인자 확인
		
		if (paramResult.getCode() == 1 && !paramResult.getMessage().equals("")) {
			// 에러 메시지를 요청 속성에 추가
			req.setAttribute("errorMessage", paramResult.getMessage());

			// 에러 페이지로 포워드
			req.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(req, resp);
			return;
		}
		
		CouponVo coupon = RequestToVoMapper.mapRequestToVo(req, CouponVo.class);
		System.out.println(coupon);
		int result = couponService.insert(coupon);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", result == 1 ? "success" : "fail");
		
		resp.setContentType("application/json");
		resp.getWriter().write(JsonUtil.toJson(map));
	}
}
