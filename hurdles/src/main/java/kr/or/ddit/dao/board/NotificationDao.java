package kr.or.ddit.dao.board;

import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.BoardVo;

public class NotificationDao extends MybatisDao implements IBoardDao {
	private static NotificationDao instance;

	private NotificationDao() {

	}

	public static NotificationDao getInstance() {
		if (instance == null) {
			instance = new NotificationDao();
		}

		return instance;
	}

	
	@Override
	public List<BoardVo> list(Pagenation<BoardVo> pagenation) {
		
		return selectList("notification.list",pagenation);
	}

	@Override
	public BoardVo detail(BoardVo board) {
	
	
		return selectOne("notification.detail", board);
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
		return selectOne("notification.totalCount", pagenation);

	}


}