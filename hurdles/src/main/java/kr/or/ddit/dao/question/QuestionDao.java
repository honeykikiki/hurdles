package kr.or.ddit.dao.question;

import java.util.List;

import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.MemberVo;
import kr.or.ddit.vo.QuestionVo;

public class QuestionDao extends MybatisDao  implements IQuestionDao {
	
	private static QuestionDao instance;

	private QuestionDao() {

	}

	public static QuestionDao getInstance() {
		if (instance == null) {
			instance = new QuestionDao();
		}

		return instance;
	}
	
	
	//문의글 등록하기
	@Override
	public int insert(QuestionVo question) {
		
		return insert("question.insert", question);
	}
	//문의글 번호 가져오기
	@Override
	public int getQuestionNo() {
		
		return selectOne("question.getQuestionNo");
		
	}
	//문의글 디테일
	@Override
	public QuestionVo detail(QuestionVo question) {
		
		return selectOne("question.detail", question);
	}

	//문의글 리스트
	@Override
	public List<QuestionVo> list(MemberVo memberNo) {
		
		return selectList("question.list",memberNo);
	}

	@Override
	public int update(QuestionVo question) {
		
		return update("question.update",question);
	}

	//파일 가져오기...?
	@Override
	public List<FileVo> getFileList(QuestionVo question) {
		
		return  selectList("question.getFileList", question);
	}
	
	

	
	

}
