package kr.or.ddit.auth.dao;

import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.MemberVo;

public class AuthDao extends MybatisDao implements IAuthDao {
	private static AuthDao instance;

	private AuthDao() {

	}

	public static AuthDao getInstance() {
		if (instance == null) {
			instance = new AuthDao();
		}

		return instance;
	}

	@Override
	public MemberVo login(MemberVo user) {
		return selectOne("auth.login", user);
	}

	@Override
	public int logOut(MemberVo user) {
		return 0;
	}

	@Override
	public int join(MemberVo user) {
		return insert("auth.join", user);
	}
	
	@Override
	public int joinProfile(MemberVo user) {
		return insert("auth.joinProfile", user);
	}

	@Override
	public MemberVo idFind(MemberVo user) {
		return selectOne("auth.idFind", user);
	}

	@Override
	public MemberVo pwFind(MemberVo user) {
		return selectOne("auth.pwFind", user);
	}

	@Override
	public int delete(MemberVo user) {
		return update("auth.delete", user);
	}

	@Override
	public MemberVo detail(MemberVo user) {
		return selectOne("auth.detail", user);
	}

	public MemberVo validId(MemberVo member) {
		return selectOne("auth.validId", member);

	}

	public MemberVo validEmail(MemberVo member) {
		return selectOne("auth.validEmail", member);
	}

	@Override
	public int getMemberNo() {
		return selectOne("auth.getMemberNo");
	}

}
