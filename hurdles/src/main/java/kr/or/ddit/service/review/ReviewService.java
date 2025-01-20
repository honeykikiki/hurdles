package kr.or.ddit.service.review;

import java.util.List;

import kr.or.ddit.dao.review.ReviewDao;
import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.ReviewReportVo;
import kr.or.ddit.vo.ReviewVo;

public class ReviewService implements IReviewService {
	private static ReviewService instance;

	private ReviewService() {

	}

	public static ReviewService getInstance() {
		if (instance == null) {
			instance = new ReviewService();
		}

		return instance;
	}

	ReviewDao reviewDao = ReviewDao.getInstance();

	@Override
	public ReviewVo reviewDetail(ReviewVo reviewVo) {
		return reviewDao.reviewDetail(reviewVo);
	}

	@Override
	public int reviewDelete(ReviewVo reviewVo) {
		return reviewDao.reviewDelete(reviewVo);
	}

	@Override
	public ReviewVo getFilePath(ReviewVo reviewVo) {
		return reviewDao.getFilePath(reviewVo);
	}

	@Override
	public List<ReviewVo> reviewList(ReviewVo reviewVo) {
		return reviewDao.reviewList(reviewVo);
	}

	@Override
	public ReviewVo getName(ReviewVo reviewVo) {
		return reviewDao.getName(reviewVo);
	}

	@Override
	public ReviewVo getScore(ReviewVo reviewVo) {
		return reviewDao.getScore(reviewVo);
	}

	@Override
	public int reviewInsert(ReviewVo reviewVo) {
		return reviewDao.reviewInsert(reviewVo);
	}

	@Override
	public int getReviewNo() {
		return reviewDao.getReviewNo();
	}

	@Override
	public int getReviewReportNo() {
		return reviewDao.getReviewReportNo();
	}

	@Override
	public int reviewReportInsert(ReviewReportVo param) {
		return reviewDao.reviewReportInsert(param);
	}

	public List<FileVo> getFileList(ReviewVo searchReview) {
		// TODO Auto-generated method stub
		return reviewDao.getFileList(searchReview);
	}

}
