package kr.or.ddit.controller.reservation;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.reservation.IReservationService;
import kr.or.ddit.service.reservation.ReservationService;
import kr.or.ddit.vo.ReservationVo;

@WebServlet("/site/reservationDelete.do")
public class ReservationDeleteController extends HttpServlet {

	IReservationService reserveService = ReservationService.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String reservationNoStr = req.getParameter("reservationNo");
		int reservationNo = Integer.parseInt(reservationNoStr);
		
		ReservationVo reservation = new ReservationVo();
		reservation.setReservationNo(reservationNo);
		int reservationDelete = reserveService.reservationDelete(reservation);
		
		System.out.println(reservationDelete+"개 삭제되었습니다");
		
		resp.sendRedirect(req.getContextPath()+"/site/reservationList.do");
	}
	
}
