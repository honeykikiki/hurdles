package kr.or.ddit.auth.dao;

import kr.or.ddit.vo.MemberVo;

public interface IAuthDao {
	public MemberVo login(MemberVo user);
	
	public int logOut(MemberVo user);
	
	public int join(MemberVo user);
	
	public int joinProfile(MemberVo user);
	
	public MemberVo idFind(MemberVo user);
	
	public MemberVo pwFind(MemberVo user);
	
	public int delete(MemberVo user);
	
	public MemberVo detail(MemberVo user);
	
	public int getMemberNo();
}
