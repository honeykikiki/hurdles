package kr.or.ddit.auth.service;

import kr.or.ddit.vo.MemberVo;

public interface IAuthService {
	public MemberVo login(MemberVo member);
	
	public int logOut(MemberVo member);
	
	public int join(MemberVo member);
	
	public int joinProfile(MemberVo user);
	
	public MemberVo idFind(MemberVo member);
	
	public MemberVo pwFind(MemberVo member);
	
	public int delete(MemberVo member);
	
	public MemberVo detail(MemberVo member);
	
	public int getMemberNo();
}
