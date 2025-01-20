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
import kr.or.ddit.service.cart.ICartService;
import kr.or.ddit.vo.CartVo;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/site/cart.do")
public class CartCotroller extends HttpServlet{
	
	ICartService cartService = CartService.getInstance();
	
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
		ctx.getRequestDispatcher("/WEB-INF/view/site/cart/cart.jsp").forward(req, resp);
	
	}
}
