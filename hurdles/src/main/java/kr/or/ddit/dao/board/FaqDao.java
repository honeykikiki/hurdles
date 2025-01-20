package kr.or.ddit.dao.board;

import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.BoardVo;

public class FaqDao extends MybatisDao implements IBoardDao {
	/*Singleton*/
	private static FaqDao instance;

	private FaqDao() {

	}

	public static FaqDao getInstance() {

		if (instance == null) {

			instance = new FaqDao();

		}

		return instance;

	}
	
	
//	public int getTotalPageCount(Pagenation<BoardVo> pagenation) {
		
//		return selectOne("faq.selectListTotalCount", pagenation);
//		return selectOne("selectListTotalCount", pagenation);
//		return selectOne("faq", pagenation);
//	}
	
	@Override
	public List<BoardVo> list(Pagenation<BoardVo> pagenation) {
		return selectList("faq.list",pagenation);
	}

	@Override
	public BoardVo detail(BoardVo boardNo) {
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
