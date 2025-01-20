package kr.or.ddit.controller.pay;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/site/payList.do")
public class PayListController extends HttpServlet {

	IPayService payService = PayService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		PayVo pay = new PayVo();
		pay.setMemberNo(memberNo);
		List<PayVo> payList = payService.payList(pay);
		
		req.setAttribute("payList", payList);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/pay/payList.jsp").forward(req, resp);
	
	}
}
