package kr.or.ddit.controller.question;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.file.service.FileService;
import kr.or.ddit.service.question.QuestionService;
import kr.or.ddit.util.FileUpload;
import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.MemberVo;
import kr.or.ddit.vo.QuestionVo;

@WebServlet("/site/question.do")
@MultipartConfig
public class QuestionController extends HttpServlet {
	QuestionService questionService = QuestionService.getInstance();
	FileService fileService = FileService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int memNo = Optional.ofNullable(member).map(MemberVo::getMemberNo).orElse(0);

		String resNoStr = req.getParameter("restaurantNo");
		int restaurantNo = Integer.parseInt(resNoStr);

		System.out.println(restaurantNo);
		// 레스토랑 no member no 없는경우 처리 하기 by 성진 0103
		

		req.setAttribute("memberNo", memNo);
		req.setAttribute("restaurantNo", restaurantNo);


		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/question/question.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 로그인 기능 활성화후 비활성화
		String memberNoStr = req.getParameter("memberNo");
		int memNo = Integer.parseInt(memberNoStr);

		String title = req.getParameter("questionTitle");
		String content = req.getParameter("questionContent");

		String resNoStr = req.getParameter("restaurantNo");
		int restaurantNo = Integer.parseInt(resNoStr);

		QuestionVo question = new QuestionVo();
		question.setQuestionTitle(title);
		question.setQuestionContent(content);
		question.setMemberNo(memNo);
		question.setRestaurantNo(restaurantNo);

//		System.out.println(question);
		// 파일 추가..?
		List<FileVo> queFile = FileUpload.fileListWrite(req, "question");

		// DB에 저장
		if (queFile.size() > 0) {
			fileService.addFiles(queFile);
			// question ,file 연결

			question.setFileNo(queFile.get(0).getFileNo());
		}

		// 인서트
		questionService.insert(question);
		int questionNo = questionService.getQuestionNo();
		question.setQuestionNo(questionNo);

		resp.sendRedirect(req.getContextPath() + "/site/questionDetail.do?questionNo=" + questionNo);
	}

}
