package kr.or.ddit.controller.reservation;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.reservation.IReservationService;
import kr.or.ddit.service.reservation.ReservationService;
import kr.or.ddit.vo.MemberVo;
import kr.or.ddit.vo.ReservationVo;

@WebServlet("/site/reservationList.do")
public class ReservationListController extends HttpServlet{
	
	IReservationService reserveService = ReservationService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//로그인 기능 활성화후 비활성화
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		ReservationVo reservation = new ReservationVo();
		reservation.setMemberNo(memberNo);
		List<ReservationVo> reservationList = reserveService.reservationList(reservation);
		req.setAttribute("reservationList", reservationList);
		
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/reservation/reservationList.jsp").forward(req, resp);
	}
	
}
