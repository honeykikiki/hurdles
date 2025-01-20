package kr.or.ddit.controller.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.cart.CartService;
import kr.or.ddit.util.JsonUtil;
import kr.or.ddit.util.ParamResult;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.CartVo;

@WebServlet("/site/cartInsert.do")
@MultipartConfig
public class CartInsertController extends HttpServlet {
	CartService cartservice = CartService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		HttpSession session = req.getSession();
//		MemberVo member = (MemberVo) session.getAttribute("member");
//		int memberNo = member.getMemberNo();
//
//		CartVo cart = new CartVo();
//		cart.setMemberNo(memberNo);
//
//		int cartInsert = cartservice.insert(cart);
//		req.setAttribute("cartInsert", cartInsert);
//
//		ServletContext ctx = req.getServletContext();
//		ctx.getRequestDispatcher("/WEB-INF/view/site/cart/cartInsert.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] requiredParams = { "productNo", "productQty", "memberNo" };

		ParamResult paramResult = ParamResult.valid(req, requiredParams);// 필수인자 확인

		if (paramResult.getCode() == 1 && !paramResult.getMessage().equals("")) {
			// 에러 메시지를 요청 속성에 추가
			req.setAttribute("errorMessage", paramResult.getMessage());

			// 에러 페이지로 포워드
			req.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(req, resp);
			return;
		}

		// 장바구니에 추가 해주기
		CartVo newCart = RequestToVoMapper.mapRequestToVo(req, CartVo.class);
		int result = cartservice.insert(newCart);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", result == 1 ? "success" : "fail");
		
		resp.setContentType("application/json");
		resp.getWriter().write(JsonUtil.toJson(map));
	}

}
