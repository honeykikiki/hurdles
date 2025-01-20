package kr.or.ddit.controller.cart;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.cart.CartService;
import kr.or.ddit.service.cart.ICartService;

@WebServlet("/site/cartDelete.do")
public class CartDeleteController extends HttpServlet {

	ICartService cartService = CartService.getInstance();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cartNoStr = req.getParameter("cartNo");
		int cartNo = Integer.parseInt(cartNoStr);

		int[] cartRemoveIds = { cartNo };
		int delete = cartService.delete(cartRemoveIds);
		System.out.println(delete);
	}
}
