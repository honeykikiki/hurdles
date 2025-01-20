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

@WebServlet("/site/payAddressUpdate.do")
public class PayAddressUpdateController extends HttpServlet{

	IPayService payService = PayService.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		String addr1 = req.getParameter("sample6_address");
		String addr2 = req.getParameter("sample6_detailAddress");
		
		System.out.println(addr1);
		System.out.println(addr2);
	
		PayVo payVo = new PayVo();
		payVo.setMemberNo(memberNo);
		payVo.setMemberAdd1(addr1);
		payVo.setMemberAdd2(addr2);
		
		int updateCount = payService.addressUpdate(payVo);
		
		System.out.println(updateCount + "개 주소가 업데이트 되었습니다");
		
		req.setAttribute("payVo", payVo);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/pay/kakaPay.jsp").forward(req, resp);
		
	}
	
}
