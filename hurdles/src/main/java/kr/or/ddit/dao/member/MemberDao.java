package kr.or.ddit.dao.member;

import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.MemberVo;

public class MemberDao extends MybatisDao implements IMemberDao {
	private static MemberDao instance;

	private MemberDao() {

	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}

		return instance;
	}


	public MemberVo memberDetail(MemberVo memberVo) {
		return selectOne("member.detail", memberVo);
	}

	@Override
	public String getFilePath(int fileNo) {
		return selectOne("member.getFilePath", fileNo);
	}

	@Override
	public int getFollowCount(int memberNo) {
		return selectOne("member.getFollowCount",memberNo);
	}

	@Override
	public int getFollowingCount(int memberNo) {
		return selectOne("member.getFollowingCount",memberNo);
	}

	@Override
	public String getGradeName(int gradeNo) {
		return selectOne("member.getGradeName",gradeNo);
	}


	@Override
	public String getMemberName(int memberNo) {
		return selectOne("member.getMemberName", memberNo);
	}


	@Override
	public int getTotalPageCount(Pagenation<MemberVo> pagenation) {
		return selectOne("member.selectListTotalCount", pagenation);
	}

	@Override
	public List<MemberVo> followDetail(Pagenation<MemberVo> pagenation) {
		return selectList("member.followDetail", pagenation);
	}

	@Override
	public List<MemberVo> followerDetail(Pagenation<MemberVo> pagenation) {
		return selectList("member.followerDetail", pagenation);
	}

	@Override
	public  MemberVo followMember(MemberVo followMember) {
		
		return selectOne("member.followMember", followMember);
	}

	@Override
	public int profileUpdate(MemberVo param) {
		return update("member.profileUpdate", param);
	}

	@Override
	public int follow(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return insert("member.follow", memberVo);
	}

	@Override
	public int cancelFollow(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return delete("member.cancelFollow",memberVo);
	}

	
	public int getPickCnt(int memberNo) {
		return selectOne("member.pickCnt", memberNo);
	}
	public int getReservationCnt(int memberNo) {
		return selectOne("member.reservationCnt", memberNo);
	}
	public int getcouponCnt(int memberNo) {
		return selectOne("member.couponCnt", memberNo);
	}
	public int getQuestionCnt(int memberNo) {
		return selectOne("member.questionCnt", memberNo);
	}
	public int getReviewCnt(int memberNo) {
		return selectOne("member.reviewCnt", memberNo);
	}
	public int getCartCnt(int memberNo) {
		return selectOne("member.cartCnt", memberNo);
	}

	@Override
	public int mileageUpdate(MemberVo member) {
		// TODO Auto-generated method stub
		return update("member.mileageUpdate", member);
	}

	@Override
	public int getMileage(MemberVo member) {
		// TODO Auto-generated method stub
		return selectOne("member.getMileage", member);
	}
}
