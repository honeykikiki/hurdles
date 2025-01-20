package kr.or.ddit.dao.question;

import java.util.List;

import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.MemberVo;
import kr.or.ddit.vo.QuestionVo;

public interface IQuestionDao {

	
//문의글 작성
public int insert(QuestionVo question) ;

//문의글 번호 가져오기
public int getQuestionNo();

//문의글 디테일
public QuestionVo detail(QuestionVo question);
//문의글 리스트
public List<QuestionVo> list(MemberVo memberNo);

//파일가져오기..? 안쓴다 버려 

public List<FileVo> getFileList(QuestionVo question);

//문의 답글
public int update(QuestionVo question);

}
