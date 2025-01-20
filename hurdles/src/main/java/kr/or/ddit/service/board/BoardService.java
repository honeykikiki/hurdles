package kr.or.ddit.service.board;


import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.BoardVo;


public class BoardService implements IBoardService {
	private static BoardService instance;

	private BoardService() {

	}

	public static BoardService getInstance() {
		if (instance == null) {
			instance = new BoardService();
		}

		return instance;
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
	public int insert(BoardVo board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BoardVo board) {
		// TODO Auto-generated method stub
		return 0;
	}



	public int delete(BoardVo board) {

		// TODO Auto-generated method stub
		return 0;
	}

}
