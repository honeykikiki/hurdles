package kr.or.ddit.dao.board;

import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.QuestionVo;

public class QuestionDao extends MybatisDao  implements IBoardDao {
	
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
	public int insert(QuestionVo question) {
		
		return insert("question.insert", question);
	}
	
	public int getQuestionNo() {
		
		return selectOne("question.getQuestionNo");
		
	}
	public QuestionVo detail(QuestionVo question) {
		
		return selectOne("question.detail");
	}

	
	
	@Override
	public int insert(BoardVo board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVo> list(Pagenation<BoardVo> pagenation) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public BoardVo detail(BoardVo board) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(BoardVo board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(BoardVo board) {
		// TODO Auto-generated method stub
		return 0;
	}

}
