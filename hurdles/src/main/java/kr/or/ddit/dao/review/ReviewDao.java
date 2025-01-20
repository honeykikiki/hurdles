package kr.or.ddit.dao.review;

import java.util.List;

import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.ReviewReportVo;
import kr.or.ddit.vo.ReviewVo;

public class ReviewDao extends MybatisDao implements IReviewDao {
	private static ReviewDao instance;

	private ReviewDao() {

	}

	public static ReviewDao getInstance() {
		if (instance == null) {
			instance = new ReviewDao();
		}

		return instance;
	}

	@Override
	public ReviewVo reviewDetail(ReviewVo reviewVo) {
		return selectOne("review.reviewDetail", reviewVo);
	}

	@Override
	public int reviewDelete(ReviewVo reviewVo) {
		return update("review.reviewDelete", reviewVo);
	}

	@Override
	public ReviewVo getFilePath(ReviewVo reviewVo) {
		return selectOne("review.getFilePath", reviewVo);
	}

	@Override
	public List<ReviewVo> reviewList(ReviewVo reviewVo) {
		return selectList("review.reviewList", reviewVo);
	}

	@Override
	public ReviewVo getName(ReviewVo reviewVo) {
		return selectOne("review.getName", reviewVo);
	}

	@Override
	public ReviewVo getScore(ReviewVo reviewVo) {
		return selectOne("review.getScore");
	}

	@Override
	public int reviewInsert(ReviewVo reviewVo) {
		return insert("review.insert", reviewVo);
	}

	@Override
	public int getReviewNo() {
		return selectOne("review.getReviewNo");
	}

	@Override
	public int getReviewReportNo() {
		return selectOne("reviewReport.getReviewReportNo");
	}

	@Override
	public int reviewReportInsert(ReviewReportVo param) {
		return insert("reviewReport.reviewReportNo", param);
	}

	public List<FileVo> getFileList(ReviewVo searchReview) {
		// TODO Auto-generated method stub
		return selectList("review.getFileList", searchReview);
	}

}
