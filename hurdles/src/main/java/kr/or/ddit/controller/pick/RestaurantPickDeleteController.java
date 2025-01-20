package kr.or.ddit.controller.pick;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.pick.PickService;
import kr.or.ddit.util.JsonUtil;
import kr.or.ddit.util.ParamResult;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.RestaurantVo;

@WebServlet("/site/restrauntPickDelete.do")
@MultipartConfig
public class RestaurantPickDeleteController extends HttpServlet {
	PickService pickService = PickService.getInstance();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] requiredParams = { "memberNo", "restaurantNo" };

		ParamResult paramResult = ParamResult.valid(req, requiredParams);// 필수인자 확인

		if (paramResult.getCode() == 1 && !paramResult.getMessage().equals("")) {
			// 에러 메시지를 요청 속성에 추가
			req.setAttribute("errorMessage", paramResult.getMessage());

			// 에러 페이지로 포워드
			req.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(req, resp);
			return;
		}
		
		int result = 0;
		try {
			RestaurantVo param = RequestToVoMapper.mapRequestToVo(req, RestaurantVo.class);
			result = pickService.deletePick(param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", result == 1 ? "success" : "fail");

		resp.setContentType("application/json");
		resp.getWriter().write(JsonUtil.toJson(map));
		
	}
}
