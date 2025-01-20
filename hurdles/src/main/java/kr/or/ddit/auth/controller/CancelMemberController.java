package kr.or.ddit.auth.controller;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.auth.service.AuthService;
import kr.or.ddit.util.ParamResult;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/auth/cancelMember.do")
public class CancelMemberController extends HttpServlet {
	AuthService authService = AuthService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/auth/cancelMember.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] requiredParams = { "memberNo" };

		ParamResult paramResult = ParamResult.valid(req, requiredParams);// 필수인자 확인

		if (paramResult.getCode() == 1 && !paramResult.getMessage().equals("")) {
			// 에러 메시지를 요청 속성에 추가
			req.setAttribute("errorMessage", paramResult.getMessage());

			// 에러 페이지로 포워드
			req.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(req, resp);
			return;
		}

		MemberVo newUser = RequestToVoMapper.mapRequestToVo(req, MemberVo.class);
		System.out.println(newUser);
		int delete = authService.delete(newUser);
		
		if (delete == 1) {
			HttpSession session = req.getSession();
			session.removeAttribute("member");
			resp.sendRedirect(req.getContextPath() + "/site/main.do");
		} else {
			resp.sendRedirect(req.getContextPath() + "/site/myPage.do");
		}
	}

}
