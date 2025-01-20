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
import kr.or.ddit.auth.service.UserType;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/auth/login.do")
public class LoginController extends HttpServlet {
    private final AuthService authService = AuthService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false); // 기존 세션 가져오기
        MemberVo member = (session != null) ? (MemberVo) session.getAttribute("member") : null;

        // 로그인된 사용자가 있다면 리다이렉트
        if (member != null) {
            moveToLogin(member, req, resp);
            return;
        }

        // 로그인 페이지로 이동
        ServletContext ctx = req.getServletContext();
        ctx.getRequestDispatcher("/WEB-INF/view/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 요청 데이터를 MemberVo로 매핑
        MemberVo memberParam = RequestToVoMapper.mapRequestToVo(req, MemberVo.class);
        MemberVo member = authService.login(memberParam);

        // 로그인 실패 처리
        if (member == null) {
            req.setAttribute("member", memberParam); // 입력 값 유지
        	req.setAttribute("message", "로그인에 실패 했습니다. 다시 시도해주세요.");
            ServletContext ctx = req.getServletContext();
            ctx.getRequestDispatcher("/WEB-INF/view/auth/login.jsp").forward(req, resp);
            return;
        }

        // 로그인 성공
        HttpSession session = req.getSession();
        member = authService.detail(member);
        session.setAttribute("member", member);
        System.out.println(member);
        moveToLogin(member, req, resp);
    }

    private void moveToLogin(MemberVo user, HttpServletRequest req, HttpServletResponse resp) throws IOException {
    	if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/login.do");
            return;
    	}
    	
		UserType type = UserType.fromCode(user.getMemberRole());
		System.out.println(type);
        if (type == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/login.do");
            return;
        }

        switch (type) {
            case ADMIN:
                resp.sendRedirect(req.getContextPath() + "/admin/main.do");
                break;
            case OWNER:
                resp.sendRedirect(req.getContextPath() + "/site/main.do");
                break;
            case NORMAL:
                resp.sendRedirect(req.getContextPath() + "/site/main.do");
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/auth/login.do");
        }
    }
}
