package kr.or.ddit.controller.pay;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.pay.IPayService;
import kr.or.ddit.service.pay.PayService;
import kr.or.ddit.vo.MemberVo;
import kr.or.ddit.vo.PayVo;

@WebServlet("/site/payDetail.do")
public class PayDetailController extends HttpServlet{
	
	IPayService payService = PayService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		String ordersNoStr = req.getParameter("ordersNo");
		int ordersNo = Integer.parseInt(ordersNoStr);
		
		PayVo pay = new PayVo();
		pay.setMemberNo(memberNo);
		pay.setOrdersNo(ordersNo);
		pay = payService.payDetail(pay);
		
		req.setAttribute("member", member);
		req.setAttribute("pay", pay);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/pay/payDetail.jsp").forward(req, resp);
	}
	
}
