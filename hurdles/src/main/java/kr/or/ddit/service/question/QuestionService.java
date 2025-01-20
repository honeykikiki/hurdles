package kr.or.ddit.service.question;




import java.util.List;

import kr.or.ddit.dao.question.QuestionDao;
import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.MemberVo;
import kr.or.ddit.vo.QuestionVo;

public class QuestionService implements IQuestionService{
	
	private static QuestionService instance;

	private QuestionService() {

	}

	public static QuestionService getInstance() {
		if (instance == null) {
			instance = new QuestionService();
		}

		return instance;
	}
	
	QuestionDao questionDao = QuestionDao.getInstance();
	
	//문의글 등록하기
	@Override
	public int insert(QuestionVo question) {
		
		return questionDao.insert(question);
	}
	//문의글 번호 가져오기
	@Override
	public QuestionVo detail(QuestionVo question) {
		
		return questionDao.detail(question);
	}
	//문의글 디테일
	@Override
	public int getQuestionNo() {
		return questionDao.getQuestionNo();
	}
	//파일 불러오는거 만들기

	@Override
	public List<QuestionVo> list(MemberVo memberNo) {
		
		return questionDao.list(memberNo);
	} 

	@Override
	public int update(QuestionVo question) {
		
		return questionDao.update(question);
	}

	@Override
	public List<FileVo> getFileList(QuestionVo question) {
		
		return questionDao.getFileList(question);
	}
	
	
	


	

	
	
	
}
