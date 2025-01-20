package kr.or.ddit.controller.question;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.file.service.FileService;
import kr.or.ddit.service.question.QuestionService;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.QuestionVo;

@WebServlet("/site/questionDetail.do")
@MultipartConfig    
public class QuestionDetailController extends HttpServlet {
	//커밋을위한 주석

	QuestionService questService = QuestionService.getInstance();
	FileService fileSerive = FileService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	

//	int questionNo = questService.getQuestionNo();
	String questNoStr = req.getParameter("questionNo");
	int questionNo = Integer.parseInt(questNoStr);
	System.out.println(questionNo);

	//서비스에 디테일 메소드를 questionNo 로 부르기
	QuestionVo questionvo = new QuestionVo();
	questionvo.setQuestionNo(questionNo);
	
	//파라미터로 보낸 questionNo로 조회한 값이 resultavalue 에 담
	QuestionVo resultavalue = questService.detail(questionvo);
	resultavalue.setQuestionNo(questionNo);
	
	String fileSaveNameString = req.getParameter("fileSaveName");
	QuestionVo param = RequestToVoMapper.mapRequestToVo(req, QuestionVo.class);
	param.setFileSaveName(fileSaveNameString);
	List<FileVo>fileList = questService.getFileList(param);
	
	
	//jsp에서 꺼내주기 위해담아준다
	req.setAttribute("question", resultavalue);
	req.setAttribute("fileList", fileList); 
	System.out.println(fileList);
	
	
	//댓글도 담아오기(없을 수도 있으니 널처리)
	QuestionVo resultavalue1 = questService.detail(questionvo);
	if(resultavalue1 != null) {
	
	}
		
	ServletContext ctx = req.getServletContext();
	ctx.getRequestDispatcher("/WEB-INF/view/site/question/questionDetail.jsp").forward(req, resp);
	}
	
	
	//사장님 답글달기
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String questNoStr = req.getParameter("questionNo");
		
		String questionAnswer = req.getParameter("questionAnswer");
		int questionNo = Integer.parseInt(questNoStr);
	
		
		QuestionVo questionvo = new QuestionVo();
		questionvo.setQuestionNo(questionNo);
		questionvo.setQuestionAnswer(questionAnswer);
		
		questService.update(questionvo);
		

		
		
		 
		
		
		resp.sendRedirect(req.getContextPath() +"/site/questionDetail.do?questionNo=" + questionNo);
		
		
	}
	
	
}
