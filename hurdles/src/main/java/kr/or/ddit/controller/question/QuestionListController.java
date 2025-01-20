package kr.or.ddit.controller.question;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.service.question.QuestionService;
import kr.or.ddit.vo.MemberVo;
import kr.or.ddit.vo.QuestionVo; 
@WebServlet("/site/questionList.do")
public class QuestionListController extends HttpServlet{
	QuestionService questionService = QuestionService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		
		
		 
		List<QuestionVo> list = questionService.list(member);
		
		req.setAttribute("list", list); 
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/question/questionList.jsp").forward(req, resp);
	}

} 
  