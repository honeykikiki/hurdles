package kr.or.ddit.service.board;

import java.util.List;

import kr.or.ddit.dao.board.FaqDao;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.BoardVo;

public class FaqService implements IBoardService{
	
	private FaqDao faqDao = FaqDao.getInstance();
	
	/*Singleton*/
	private static FaqService instance;

	private FaqService() {

	}

	public static FaqService getInstance() {

		if (instance == null) {

			instance = new FaqService();

		}

		return instance;

	}
	
	@Override
	public List<BoardVo> list(Pagenation<BoardVo> pagenation) {
		return faqDao.list(pagenation);
	}

	@Override
	public BoardVo detail(BoardVo boardNo) {
		return null;
	}

	@Override
	public int insert(BoardVo board) {
		// TODO Auto-generated method stub
		return 0;
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
