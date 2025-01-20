package kr.or.ddit.controller.board;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.service.board.NotificationService;
import kr.or.ddit.vo.BoardVo;
@WebServlet("/site/notificationDetail.do")
public class NotificationDetailController extends HttpServlet{
	
	NotificationService service = NotificationService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardNoStr = req.getParameter("boardNo");
		int boardNo = Integer.parseInt(boardNoStr);
	
		
		BoardVo board = new BoardVo ();
		board.setBoardNo(boardNo);
		
		board = service.detail(board);
		
		req.setAttribute("detail", board);
		System.out.println(board);
		
		System.out.println("컨트롤러");
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/notification/notificationDetail.jsp").forward(req, resp);
	}

}