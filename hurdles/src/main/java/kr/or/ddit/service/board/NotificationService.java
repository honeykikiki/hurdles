package kr.or.ddit.service.board;

import java.util.List;

import kr.or.ddit.dao.board.NotificationDao;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.BoardVo;

public class NotificationService implements IBoardService {
	
	private static NotificationService instance;
	//ㅎ
	private NotificationService() {

	}

	public static NotificationService getInstance() {
		if (instance == null) {
			instance = new NotificationService();
		}

		return instance;
	}
	NotificationDao notDao = NotificationDao.getInstance();

	
	@Override
	public List<BoardVo> list(Pagenation<BoardVo> pagenation) {
	
		return notDao.list(pagenation);
	}

	@Override
	public BoardVo detail(BoardVo board) {
	
		
		return notDao.detail(board);
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
	
	public int totalCount(Pagenation<BoardVo> pagenation) {
		return notDao.totalCount(pagenation);
	}
}