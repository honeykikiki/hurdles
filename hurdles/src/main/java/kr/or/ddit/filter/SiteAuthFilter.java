package kr.or.ddit.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.vo.MemberVo;

 @WebFilter(value = { 
		 "/site/myPage.do",
		 "/site/asdasdasd.do",
		 "/site/myPage.do",
		 "/site/myPageUpdate.do",
		 "/site/reservationList.do",
		 "/site/reservationInsert.do",
		 "/site/reservationDelete.do",
		 "/site/reservationDetail.do",
		 "/site/reservationList.do",
		 "/site/kakaoPay.do",
		 "/site/question.do",
		 "/site/questionList.do",
		 "/site/questionDetail.do",
		 "/site/reviewDetail.do",
		 "/site/cartList.do",
		 "/site/payList.do",
		 "/site/payDetail.do",
		 "/site/couponIssuedList.do"
		})
 
 
public class SiteAuthFilter implements Filter {
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {		
		
		
//		로그인이 필요한 사이트

		// HttpServletRequest로 캐스팅
      HttpServletRequest httpRequest = (HttpServletRequest) req;
      HttpServletResponse httpresp = (HttpServletResponse) resp;
      
      // 세션 가져오기 (세션이 없으면 null 반환)
      HttpSession session = httpRequest.getSession(false);
      System.out.println(session);
      
      if (session != null) {
      	MemberVo member = (MemberVo) session.getAttribute("member");
      	
      	if (member != null) {
      		chain.doFilter(req, resp);
      		return;
      	} 
      }
      
      httpresp.sendRedirect(httpRequest.getContextPath() + "/auth/login.do");
	}

}
