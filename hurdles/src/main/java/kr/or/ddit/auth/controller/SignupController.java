package kr.or.ddit.auth.controller;

import java.io.IOException;
import java.net.URLEncoder;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.auth.service.AuthService;
import kr.or.ddit.util.ParamResult;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/auth/signup.do")
@MultipartConfig
public class SignupController extends HttpServlet {
	AuthService authService = AuthService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/auth/signup.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] requiredParams = { "memberId", "memberPw", "memberPwConfirm", "memberName", "memberEmail", "memberTel", "memberBir", "memberGender", "memberAdd1", "memberAdd2" };

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
		
		// 멤버 넘버 가져오기
		int memberNo = authService.getMemberNo();
		System.out.println(memberNo);
		newUser.setMemberNo(memberNo);
		// 일반 사용자
		newUser.setMemberRole(2);
		
		// 멤버 기본정보 insert
		int join = authService.join(newUser);

		// 멤버 프로필 insert
		int joinProfile = authService.joinProfile(newUser);
		
		if (join == 1 && joinProfile == 1) {
			String encodedMemberName = URLEncoder.encode(newUser.getMemberName(), "UTF-8");

			resp.sendRedirect(req.getContextPath() + "/auth/signupConfirm.do?memberName=" + encodedMemberName);
			return;
		} 

		resp.sendRedirect(req.getContextPath() + "/auth/signup.do");
		
	}
}
