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

@WebServlet("/site/reservationInsert.do")
public class ReservationInsertController extends HttpServlet {

	IReservationService reserveService = ReservationService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		
		// 멤버에서 이름, 전화번호 가져오기
		req.setAttribute("member", member);

		
		// 식당상세보기에서 넘어오는 예약상품번호 넣어주기
		String reserveProductNoStr = req.getParameter("reserveProductNo");
		int reserveProductNo = Integer.parseInt(reserveProductNoStr); 
		req.setAttribute("reserveProductNo", reserveProductNo);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/reservation/reservationInsert.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memberNoStr = req.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNoStr);

		String reserveProductNoStr = req.getParameter("reserveProductNo");
		int reserveProductNo = Integer.parseInt(reserveProductNoStr);

		String memberName = req.getParameter("name");
		String memberTel = req.getParameter("phone");
		String reserveDate = req.getParameter("date");
		String reserveTime = req.getParameter("time");

		String guestsStr = req.getParameter("guests");
		int guests = Integer.parseInt(guestsStr);

		ReservationVo reservation = new ReservationVo();
		reservation.setMemberNo(memberNo);
		reservation.setReserveProductNo(reserveProductNo);
		reservation.setMemberName(memberName);
		reservation.setMemberTel(memberTel);
		reservation.setReserveDate(reserveDate);
		reservation.setReserveTime(reserveTime);
		reservation.setGuests(guests);

		req.setAttribute("reservation", reservation);

		int reservationInsert = reserveService.reservationInsert(reservation);

		System.out.println(reservationInsert + "개 등록되었습니다");

		// resp.sendRedirect(req.getContextPath()+"/site/reservationSuccess.do");
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/reservation/reservationSuccess.jsp").forward(req, resp);

	}
}
