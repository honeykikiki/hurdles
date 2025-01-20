package kr.or.ddit.auth.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.auth.service.UserType;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/auth/logout.do")
public class LogoutController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		// 세션 초기화
		UserType type = UserType.fromCode(member.getMemberRole());
		session.removeAttribute("member");
		
		if (type == UserType.ADMIN) {
			resp.sendRedirect(req.getContextPath() + "/auth/login.do");
			return;
		}
		
		resp.sendRedirect(req.getContextPath() + "/site/main.do");
	}
}
