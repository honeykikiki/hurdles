package kr.or.ddit.auth.service;

import kr.or.ddit.auth.dao.AuthDao;
import kr.or.ddit.vo.MemberVo;

public class AuthService implements IAuthService {
	private static AuthService instance;
	private AuthDao authDao = AuthDao.getInstance();

	private AuthService() {

	}

	public static AuthService getInstance() {
		if (instance == null) {
			instance = new AuthService();
		}

		return instance;
	}

	@Override
	public MemberVo login(MemberVo member) {
		return authDao.login(member);
	}

	@Override
	public int logOut(MemberVo member) {
		return authDao.logOut(member);
	}

	@Override
	public int join(MemberVo member) {
		return authDao.join(member);
	}
	
	@Override
	public int joinProfile(MemberVo member) {
		return authDao.joinProfile(member);
	}

	@Override
	public MemberVo idFind(MemberVo member) {
		return authDao.idFind(member);
	}

	@Override
	public MemberVo pwFind(MemberVo member) {
		return authDao.pwFind(member);
	}

	@Override
	public int delete(MemberVo member) {
		return authDao.delete(member);
	}

	@Override
	public MemberVo detail(MemberVo member) {
		return authDao.detail(member);
	}

	public MemberVo validId(MemberVo member) {
		return authDao.validId(member);

	}

	public MemberVo validEmail(MemberVo member) {
		return authDao.validEmail(member);

	}

	@Override
	public int getMemberNo() {
		return authDao.getMemberNo();
	}
}
