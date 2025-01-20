package kr.or.ddit.service.member;


import java.util.List;

import kr.or.ddit.dao.member.MemberDao;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.MemberVo;

public class MemberService implements IMemberService {
	private static MemberService instance;

	private MemberService() {

	}

	public static MemberService getInstance() {
		if (instance == null) {
			instance = new MemberService();
		}

		return instance;
	}
	MemberDao memberDao = MemberDao.getInstance();

	public MemberVo memberDetail(MemberVo memberVo) {
		return memberDao.memberDetail(memberVo);
	}

	
	public String getFilePath(int fileNo) {
		return memberDao.getFilePath(fileNo);
	}

	@Override
	public int getFollowCount(int memberNo) {
		return memberDao.getFollowCount(memberNo);
	}

	@Override
	public int getFollowingCount(int memberNo) {
		return memberDao.getFollowingCount(memberNo);
	}

	@Override
	public String getGradeName(int gradeNo) {
		return memberDao.getGradeName(gradeNo);
	}

	@Override
	public String getMemberName(int memberNo) {
		return memberDao.getMemberName(memberNo);
	}


	@Override
	public int getTotalPageCount(Pagenation<MemberVo> pagenation) {
		return memberDao.getTotalPageCount(pagenation);
	}

	@Override
	public List<MemberVo> followDetail(Pagenation<MemberVo> pagenation) {
		return memberDao.followDetail(pagenation);
	}

	@Override
	public List<MemberVo> followerDetail(Pagenation<MemberVo> pagenation) {
		return memberDao.followerDetail(pagenation);
	}

	@Override
	public  MemberVo followMember(MemberVo followMember) {
		
		return memberDao.followMember(followMember);
	}

	@Override
	public int profileUpdate(MemberVo param) {
		return memberDao.profileUpdate(param);
	}

	@Override
	public int follow(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return memberDao.follow(memberVo);
	}

	@Override
	public int cancelFollow(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return memberDao.cancelFollow(memberVo);
	}
	
	public int getPickCnt(int memberNo) {
		return memberDao.getPickCnt(memberNo);
	}
	public int getReservationCnt(int memberNo) {
		return memberDao.getReservationCnt(memberNo);
	}
	public int getcouponCnt(int memberNo) {
		return memberDao.getcouponCnt(memberNo);
	}
	public int getQuestionCnt(int memberNo) {
		return memberDao.getQuestionCnt(memberNo);
	}
	public int getReviewCnt(int memberNo) {
		return memberDao.getReviewCnt(memberNo);
	}
	public int getCartCnt(int memberNo) {
		return memberDao.getCartCnt(memberNo);
	}

	@Override
	public int mileageUpdate(MemberVo member) {
		// TODO Auto-generated method stub
		return memberDao.mileageUpdate(member);
	}

	@Override
	public int getMileage(MemberVo member) {
		// TODO Auto-generated method stub
		return memberDao.getMileage(member);
	}


}
