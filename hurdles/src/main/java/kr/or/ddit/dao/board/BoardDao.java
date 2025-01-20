package kr.or.ddit.dao.board;

import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.BoardVo;

public class BoardDao implements IBoardDao {
	private static BoardDao instance;

	private BoardDao() {

	}

	public static BoardDao getInstance() {
		if (instance == null) {
			instance = new BoardDao();
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

	@Override
	public int delete(BoardVo board) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	


}
