package kr.or.ddit.auth.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.auth.service.AuthService;
import kr.or.ddit.util.JsonUtil;
import kr.or.ddit.util.ParamResult;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/auth/idFind.do")
@MultipartConfig
public class IdFindController extends HttpServlet {
	AuthService authService = AuthService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/auth/idFind.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] requiredParams = { "memberName", "memberEmail" };

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

		MemberVo idFind = authService.idFind(newUser);

		resp.setContentType("application/json");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", idFind != null ? "success" : "fail");
		map.put("id", idFind != null ? idFind.getMemberId() : "정보를 찾을수 없습니다.");

		resp.getWriter().write(JsonUtil.toJson(map));
	}
}
