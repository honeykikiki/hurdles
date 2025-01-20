package kr.or.ddit.controller.board;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.board.FaqService;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.BoardVo;

@WebServlet("/site/faq.do")
public class FaqController extends HttpServlet{
	
	
	FaqService faqService = FaqService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Pagenation<BoardVo> pagenation = RequestToVoMapper.mapRequestToVo(req, Pagenation.class);
		pagenation.setSearchVo(RequestToVoMapper.mapRequestToVo(req, BoardVo.class));
		 pagenation.getSearchVo().setBoardCodeNo(2);
//		int totalCount = faqService.getTotalPageCount(pagenation);
//		pagenation.setTotalRecordCount(totalCount); .

		
		List<BoardVo> faqList = faqService.list(pagenation);

		req.setAttribute("paginationInfo", pagenation);
		req.setAttribute("faqList", faqList);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/faq/faq.jsp").forward(req, resp);
		
	}
}
