package kr.or.ddit.controller.reservation;

import java.io.IOException;

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

@WebServlet("/site/reservationDetail.do")
public class ReservationDetailController extends HttpServlet {
	
	IReservationService reserveService = ReservationService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memberNo = member.getMemberNo();
		
		String reservationNoStr = req.getParameter("reservationNo");
		int reservationNo = Integer.parseInt(reservationNoStr);
		
		//System.out.println(reservationNo);
		
		ReservationVo reservation = new ReservationVo();		
		reservation.setMemberNo(memberNo);
		reservation.setReservationNo(reservationNo);
		reservation = reserveService.reservationDetail(reservation);
		
		req.setAttribute("reservation", reservation);
		
		System.out.println(reservation);
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/reservation/reservationDetail.jsp").forward(req, resp);
	}

}
