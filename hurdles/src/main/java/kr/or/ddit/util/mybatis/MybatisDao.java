package kr.or.ddit.util.mybatis;

import java.util.List;
import java.util.function.Function;

import org.apache.ibatis.session.SqlSession;


public class MybatisDao {
	private boolean autoCommit = true;
	
	private <T> T execute(String statement, Object parameter, Function<SqlSession, T> function) {
		long start = System.currentTimeMillis();
	    try (SqlSession session = MybatisUtil.getInstance(autoCommit)) {
			return function.apply(session);
		} catch (Exception e) {
			// 로그를 남기거나, 더 구체적인 예외를 던질 수 있습니다.
			throw new RuntimeException("SQL 실행 중 오류 발생: " + statement, e);
		} finally {
			long end = System.currentTimeMillis();
//			개발 환경에서만 사용			
			System.out.println(statement + " execution time: " + (end - start) + "ms");
		}
	    
	}
	
	// 목록 조회 (파라미터 없음)
	public <T> List<T> selectList(String statement) {
		return execute(statement, null, session -> session.selectList(statement));
	}

	// 목록 조회 (파라미터 있음)
	public <T> List<T> selectList(String statement, Object parameter) {
		return execute(statement, parameter, session -> session.selectList(statement, parameter));
	}

	// 단일 조회 (파라미터 없음)
	public <T> T selectOne(String statement) {
		return execute(statement, null, session -> session.selectOne(statement));
	}

	// 단일 조회 (파라미터 있음)
	public <T> T selectOne(String statement, Object parameter) {
		return execute(statement, parameter, session -> session.selectOne(statement, parameter));
	}

	// 수정 (파라미터 없음)
	public int update(String statement) {
		return execute(statement, null, session -> session.update(statement));
	}

	// 수정 (파라미터 있음)
	public int update(String statement, Object parameter) {
		return execute(statement, parameter, session -> session.update(statement, parameter));
	}

	// 삭제 (파라미터 없음)
	public int delete(String statement) {
		return execute(statement, null, session -> session.delete(statement));
	}

	// 삭제 (파라미터 있음)
	public int delete(String statement, Object parameter) {
		return execute(statement, parameter, session -> session.delete(statement, parameter));
	}

	// 삽입 (파라미터 없음)
	public int insert(String statement) {
		return execute(statement, null, session -> session.insert(statement));
	}

	// 삽입 (파라미터 있음)
	public int insert(String statement, Object parameter) {
		return execute(statement, parameter, session -> session.insert(statement, parameter));
	}
}
