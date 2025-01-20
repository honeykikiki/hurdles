package kr.or.ddit.util.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisUtil {
	private static SqlSessionFactory sessionFactory;
	
	static {
		Charset charset = Charset.forName("UTF-8");
		Resources.setCharset(charset);
		
		try {
			Reader rd = Resources.getResourceAsReader("config/mybatis-config.xml");
			sessionFactory = new SqlSessionFactoryBuilder().build(rd);
			
			rd.close();
		} catch (IOException e) {
			throw new RuntimeException("SQL 접속 중 오류: " + e);
		}
	}
	
	public static SqlSession getInstance() {
		return sessionFactory.openSession();
	}
	
	public static SqlSession getInstance(boolean autoCommit) {
		return sessionFactory.openSession(autoCommit);
	}
}
