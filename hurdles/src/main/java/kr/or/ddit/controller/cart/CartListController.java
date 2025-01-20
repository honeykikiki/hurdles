package kr.or.ddit.controller.cart;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.cart.CartService;
import kr.or.ddit.vo.CartVo;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/site/cartList.do")
public class CartListController extends HttpServlet{
	
	CartService cartService = CartService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		CartVo cart= new CartVo();
		cart.setMemberNo(memberNo);
		
		List<CartVo> cartList = cartService.list(cart);
		req.setAttribute("cartList", cartList);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/cart/cartList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수량 변경 파라미터 받기
        int cartNo = Integer.parseInt(req.getParameter("cartNo"));
        int productQty = Integer.parseInt(req.getParameter("productQty"));

        CartVo cartVo = new CartVo();
        cartVo.setCartNo(cartNo);
        cartVo.setProductQty(productQty);
                
        // 장바구니 수량 업데이트
        int updateCount = cartService.cartQtyUpdate(cartVo); // CartVo 객체를 사용
          
        //결과값 저장
    	req.setAttribute("result", updateCount);
    		
    	//view페이지로 이동 - insert - delete - update 공통으로 사용하는 view
    	req.getRequestDispatcher("/WEB-INF/view/site/cart/result.jsp").forward(req, resp);
    		
    }

}
