package kr.or.ddit.controller.restaurant;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.restaurant.RestaurantService;
import kr.or.ddit.util.BwpPropertyManager;
import kr.or.ddit.util.JsonUtil;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.util.Utils;
import kr.or.ddit.vo.RestaurantVo;

@WebServlet("/restaurant/list")
public class RestaurantListController extends HttpServlet {

	RestaurantService restaurantService = RestaurantService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		// 0 => 기본, 1 => 평정 높은순, 2 평점 낮은순
		String scoreStr = req.getParameter("orderScore");
		int orderScore = Utils.parseInt(scoreStr, 0);

		Pagenation<RestaurantVo> pagenation = RequestToVoMapper.mapRequestToVo(req, Pagenation.class);
		pagenation.setSearchVo(RequestToVoMapper.mapRequestToVo(req, RestaurantVo.class));

		/*
		 * Map<String, String> map = new HashMap<String, String>();
		 * map.put("orderScore", scoreStr); pagenation.setPageMap(map);
		 */

		int totalCount = restaurantService.getTotalPageCount(pagenation);
		pagenation.setTotalRecordCount(totalCount);

		List<RestaurantVo> restaurantList = restaurantService.restaurantList(pagenation);
		
//		/restaurant/a5ab488a0c8a4c0f99a488cfff8be202
		//BwpPropertyManager.getProperty(req.getServletContext(), "fileSaveAbsPath"))
		returnMap.put("filePath", "restaurant");
		returnMap.put("paginationInfo", pagenation);
		returnMap.put("items", restaurantList);

//		ServletContext ctx = req.getServletContext();
//		ctx.getRequestDispatcher("/WEB-INF/view/site/restaurant/restaurantList.jsp").forward(req, resp);
		
		resp.getWriter().write(JsonUtil.toJson(returnMap));

	}
}
