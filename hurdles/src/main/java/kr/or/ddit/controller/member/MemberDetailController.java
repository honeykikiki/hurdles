package kr.or.ddit.controller.member;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.member.MemberService;
import kr.or.ddit.util.Utils;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/site/memberDetail.do")
public class MemberDetailController extends HttpServlet {

	MemberService memberService = MemberService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false); // 기존 세션 가져오기
		MemberVo member = (session.getAttribute("member") != null) ? (MemberVo) session.getAttribute("member") : new MemberVo();

		String targetNoStr = req.getParameter("memberNo");
		int targetNo = Utils.parseInt(targetNoStr, 0);

		MemberVo memberVo = new MemberVo();
		memberVo.setMemberNo(targetNo);
		MemberVo targetMember = memberService.memberDetail(memberVo);

		int fileNo = targetMember.getFileNo();
		// 팔로우 여부 확인하기
		MemberVo follow = new MemberVo();
		follow.setTargetNo(targetNo);
		follow.setMemberNo(member.getMemberNo());

		MemberVo followMember = memberService.followMember(follow);
		String filePath = memberService.getFilePath(fileNo);
		int getFollowCount = memberService.getFollowCount(targetMember.getMemberNo());
		int getFollowingCount = memberService.getFollowingCount(targetMember.getMemberNo());
		int gradeNo = targetMember.getGradeNo();
		String gradeName = memberService.getGradeName(gradeNo);

		req.setAttribute("followMember", followMember);
		req.setAttribute("gradeName", gradeName);
		req.setAttribute("getFollowCount", getFollowCount);
		req.setAttribute("getFollowingCount", getFollowingCount);
		req.setAttribute("filePath", filePath);
		req.setAttribute("memberDetail", targetMember);

		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/member/memberDetail.jsp").forward(req, resp);
	}
}
