package kr.or.ddit.controller.pick;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.pick.PickService;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.RestaurantVo;

@WebServlet("/site/pickRestaurantList.do")
public class RestaurantPickController extends HttpServlet {
	
	PickService pickService = PickService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*
		 * HttpSession session = req.getSession(); MemberVo sessionVo =
		 * (MemberVo)session.getAttribute("member");
		 * 
		 * int memberNo = sessionVo.getMemberNo();
		 */
		
		String memberNoStr = req.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNoStr);
		


		
		// req.setAttribute("memberNo", memberNo);
		
		Pagenation<RestaurantVo> pagenation =  RequestToVoMapper.mapRequestToVo(req, Pagenation.class);


	    
		pagenation.setSearchVo(RequestToVoMapper.mapRequestToVo(req, RestaurantVo.class));
		
		pagenation.setPageMap(Map.of("memberNo", memberNo + ""));
		
	    int totalCount = pickService.getTotalPageCount(pagenation);
	    pagenation.setTotalRecordCount(totalCount);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
	    
		


		List<RestaurantVo> restaurantList = pickService.pickRestaurantList(pagenation);
		
		req.setAttribute("restaurantList", restaurantList);
		
	    req.setAttribute("paginationInfo", pagenation);
	    
		
	    
	    ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/restaurant/pickRestaurantList.jsp").forward(req, resp);
	}
}
