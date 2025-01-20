package kr.or.ddit.controller.coupon;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.coupon.CouponService;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.ParamResult;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.CouponVo;

@WebServlet("/site/couponIssuedList.do")
public class CouponIssuedListController extends HttpServlet {
	CouponService couponService = CouponService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] params = {"memberNo"};
		
		ParamResult paramResult = ParamResult.valid(req, params);// 필수인자 확인
		
		if (paramResult.getCode() == 1 && !paramResult.getMessage().equals("")) {
			// 에러 메시지를 요청 속성에 추가
			req.setAttribute("errorMessage", paramResult.getMessage());

			// 에러 페이지로 포워드
			req.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(req, resp);
			return;
		}
		Pagenation<CouponVo> pagenation =  RequestToVoMapper.mapRequestToVo(req, Pagenation.class);
		pagenation.setSearchVo(RequestToVoMapper.mapRequestToVo(req, CouponVo.class));
		
		List<CouponVo> issuedList = couponService.issuedList(pagenation);
		
		Map<String, String> pageMap = new HashMap<String, String>();
		pageMap.put("used", "used");
		pagenation.setPageMap(pageMap);
		List<CouponVo> usedList = couponService.issuedList(pagenation);
		
		req.setAttribute("couponList", issuedList);
		req.setAttribute("usedList", usedList);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/coupon/couponList.jsp").forward(req, resp);
		
		
	}
}
