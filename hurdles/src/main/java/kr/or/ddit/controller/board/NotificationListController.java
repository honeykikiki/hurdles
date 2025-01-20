package kr.or.ddit.controller.board;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.board.NotificationService;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.BoardVo;

@WebServlet ("/site/notificationList.do")
public class NotificationListController extends HttpServlet{
	NotificationService service = NotificationService.getInstance();
	// BoardService boardService = BoardService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Pagenation<BoardVo> pagenation = RequestToVoMapper.mapRequestToVo(req, Pagenation.class);
		pagenation.setSearchVo(RequestToVoMapper.mapRequestToVo(req, BoardVo.class));
		pagenation.getSearchVo().setBoardCodeNo(1); // 공지사항으로 세팅
		
		int totalCount = service.totalCount(pagenation);
		pagenation.setTotalRecordCount(totalCount);
		
//		BoardVo gongji = new BoardVo();
		List<BoardVo> list = service.list(pagenation);
		
		req.setAttribute("paginationInfo", pagenation);
		req.setAttribute("list", list);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/notification/notification.jsp").forward(req, resp);
	}
} 
   