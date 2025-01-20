package kr.or.ddit.service.board;

import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.BoardVo;

public interface IBoardService {
	
	
	//  게시물 목록 조회
	  public List<BoardVo> list(Pagenation<BoardVo> pagenation);
	//  게시물 상세보기
	  public BoardVo detail(BoardVo board);
	//  게시물 등록
	  public int insert(BoardVo board);
	//  게시물 수정
	  public int update(BoardVo board);
	//  게시물 삭제
	  public int delete(BoardVo board);
	

	
}
