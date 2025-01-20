package kr.or.ddit.dao.review;

import java.util.List;

import kr.or.ddit.vo.ReviewReportVo;
import kr.or.ddit.vo.ReviewVo;

public interface IReviewDao {

	public ReviewVo reviewDetail(ReviewVo reviewVo);

	public ReviewVo getFilePath(ReviewVo reviewVo);

	public int reviewDelete(ReviewVo reviewVo);

	public List<ReviewVo> reviewList(ReviewVo reviewVo);

	public ReviewVo getName(ReviewVo reviewVo);

	public ReviewVo getScore(ReviewVo reviewVo);

	public int reviewInsert(ReviewVo reviewVo);

	public int getReviewNo();

	public int getReviewReportNo();

	public int reviewReportInsert(ReviewReportVo param);
}
