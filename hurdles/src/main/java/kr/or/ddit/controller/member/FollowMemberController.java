package kr.or.ddit.controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.member.MemberService;
import kr.or.ddit.util.JsonUtil;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/site/followMember.do")
public class FollowMemberController extends HttpServlet {
		MemberService memberService = MemberService.getInstance();
		
		//팔로우 버튼 누르면 팔로우 추가
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			HttpSession session = req.getSession(false);
			MemberVo memberVo = new MemberVo();
			//팔로우를 누를 사람 (세션 정보)
			memberVo= (MemberVo)session.getAttribute("member");
			//mynumber
			int memberNo = memberVo.getMemberNo();
			
			//팔로우를 할 대상(req 넘버값)
			String followTargetNoStr = req.getParameter("memberNo");
			//타겟 대상 넘버
			int followTargetNo = Integer.parseInt(followTargetNoStr);
			System.out.println(followTargetNo);
			
			memberVo.setMemberNo(memberNo);
			memberVo.setTargetNo(followTargetNo);
			
			memberService.follow(memberVo); 
			
			Map<String, Object> map = new HashMap<String, Object>();
			resp.setContentType("application/json");
			map.put("item", "success");
			resp.getWriter().write(JsonUtil.toJson(map));
			
		}
		

	
}
