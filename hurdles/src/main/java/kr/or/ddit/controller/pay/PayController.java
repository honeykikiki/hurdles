package kr.or.ddit.controller.pay;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.cart.CartService;
import kr.or.ddit.service.cart.ICartService;
import kr.or.ddit.service.coupon.CouponService;
import kr.or.ddit.service.coupon.ICouponService;
import kr.or.ddit.service.member.MemberService;
import kr.or.ddit.service.pay.IPayService;
import kr.or.ddit.service.pay.PayService;
import kr.or.ddit.vo.CartVo;
import kr.or.ddit.vo.CouponVo;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/site/pay.do")
public class PayController extends HttpServlet {
	
	IPayService payService = PayService.getInstance();
	ICartService cartService = CartService.getInstance();
	ICouponService couponService = CouponService.getInstance();
	MemberService memberService = MemberService.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		member = memberService.memberDetail(member);
		req.setAttribute("member", member);
		
		// 선택된 장바구니 번호
        String[] cartNoArray = req.getParameterValues("cartNo");
        System.out.println(Arrays.toString(cartNoArray));
        
        // 총합계 금액
        String totalPrice = req.getParameter("totalPrice");
        System.out.println("총금액 : " + totalPrice);
        
        // 이거 확인하기
        // List<List<CartVo>> list = new ArrayList<List<CartVo>>();
        
        // cartNo에 해당하는 상품 정보를 조회하여 List로 전달
        List<CartVo> selectedCartList = new ArrayList<>();
        for (String cartNoStr : cartNoArray) {
            int cartNo = Integer.parseInt(cartNoStr); // cartNo를 정수로 변환
            CartVo cart = cartService.getCartByCartNo(cartNo); // cartNo에 해당하는 상품 정보 조회
            selectedCartList.add(cart); // 선택된 상품 정보를 리스트에 추가
        }
        
        // selectedCartList를 kakaoPay.jsp에 전달
        // 여기 2차원 배열로
        // 식당별로 파싱 하기 추가
        
        
        req.setAttribute("selectedCartList", selectedCartList);
        req.setAttribute("totalPrice", totalPrice);
        
        // 레스토랑 넘버
		CouponVo coupon = new CouponVo();
		coupon.setMemberNo(memberNo);
		coupon.setRestaurantNo(selectedCartList.get(0).getRestaurantNo());
		
		List<CouponVo> couponList = couponService.memberCouponList(coupon);
		req.setAttribute("couponList", couponList);
        
		
		
        // resp.sendRedirect(req.getContextPath() + "/pay/kakaoPay.jsp");
        req.getRequestDispatcher("/pay/kakaoPay.jsp").forward(req, resp);
    }

}
