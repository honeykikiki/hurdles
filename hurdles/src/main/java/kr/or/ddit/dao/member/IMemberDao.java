package kr.or.ddit.dao.member;

import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.MemberVo;

public interface IMemberDao {
	//유저 상세보기 - 오정균 작업준비끝!
	
	public MemberVo memberDetail(MemberVo memberVo);
	
	public String getFilePath(int fileNo);
	
	public int getFollowCount(int memberNo);
	
	public int getFollowingCount(int memberNo);
	
	public String getGradeName(int gradeNo);
	
	public String getMemberName(int memberNo);
	
	public int getTotalPageCount(Pagenation<MemberVo> pagenation);
	
	public List<MemberVo> followDetail(Pagenation<MemberVo> pagenation);
	
	public List<MemberVo> followerDetail(Pagenation<MemberVo> pagenation);
	
	public MemberVo followMember(MemberVo followMember);

	// 멤버 프로필 정보 수정
	public int profileUpdate(MemberVo param);
	
	public int follow(MemberVo memberVo);
	
	public int cancelFollow(MemberVo memberVo);
	
	// 멤버 마일리지 업뎃 - 김영신
	public int mileageUpdate(MemberVo member);
	
	public int getMileage(MemberVo member);
}
