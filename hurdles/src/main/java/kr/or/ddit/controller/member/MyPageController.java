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
import kr.or.ddit.vo.MemberVo;

@WebServlet("/site/myPage.do")
public class MyPageController extends HttpServlet {
	MemberService memberService = MemberService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVo member = session.getAttribute("member") == null ? new MemberVo()
				: (MemberVo) session.getAttribute("member");

		// 회원 정보 가져오기 - 멤버 정보가 세션에 없는 경우 처리 해주기
		member = memberService.memberDetail(member);
		int memberNo = member.getMemberNo();

		// 팔로우 카운트,
		int followCnt = memberService.getFollowCount(memberNo);
		member.setFollowCnt(followCnt);
		// 팔로워 카운트
		int followingCnt = memberService.getFollowingCount(memberNo);
		member.setFollowingCnt(followingCnt);

		// 찜한 식당 갯수
		int pickCnt = memberService.getPickCnt(memberNo);
		member.setPickCnt(pickCnt);
		// 예약 갯수
		int reservationCnt = memberService.getReservationCnt(memberNo);
		member.setReservationCnt(reservationCnt);
		// 쿠폰 갯수
		int couponCnt = memberService.getcouponCnt(memberNo);
		member.setCouponCnt(couponCnt);
		// 문의내역 갯수
		int questionCnt = memberService.getQuestionCnt(memberNo);
		member.setQuestionCnt(questionCnt);
		// 내 리뷰 개수 가져오기
		int reviewCnt = memberService.getReviewCnt(memberNo);
		member.setReviewCnt(reviewCnt);
		// 내 장바구니 개수 가져오기
		int cartCnt = memberService.getCartCnt(memberNo);
		member.setCartCnt(cartCnt);

		req.setAttribute("member", member);

		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/member/myPage.jsp").forward(req, resp);
	}
}
