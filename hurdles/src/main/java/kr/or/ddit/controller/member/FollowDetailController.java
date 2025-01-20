package kr.or.ddit.controller.member;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.member.MemberService;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/site/followDetail.do")
public class FollowDetailController extends HttpServlet {

	MemberService memberService = MemberService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memberNoStr = req.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNoStr);

		Pagenation<MemberVo> pagenation = RequestToVoMapper.mapRequestToVo(req, Pagenation.class);

		pagenation.setSearchVo(RequestToVoMapper.mapRequestToVo(req, MemberVo.class));

		int totalCount = memberService.getTotalPageCount(pagenation);
		pagenation.setTotalRecordCount(totalCount);

		List<MemberVo> followDetail = memberService.followDetail(pagenation);

		req.setAttribute("paginationInfo", pagenation);

		MemberVo memberVo = new MemberVo();

		memberVo.setMemberNo(memberNo);

		String getMemberName = memberService.getMemberName(memberNo);

		req.setAttribute("getMemberName", getMemberName);
		req.setAttribute("followDetail", followDetail);

		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/follow/followDetail.jsp").forward(req, resp);
	}
}
