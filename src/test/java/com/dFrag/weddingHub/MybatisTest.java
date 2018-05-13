package com.dFrag.weddingHub;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
// JUnit Test Case로 만든 클래스
//JUnit 4 버전으로 테스트
@RunWith(SpringJUnit4ClassRunner.class)
//스프링 설정 파일의 위치를 지정
@ContextConfiguration(locations= 
{"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MybatisTest {
	//로깅을 위한 변수
	private static final Logger logger=
			LoggerFactory.getLogger(MybatisTest.class);
	//의존관계 주입 코드
	@Inject
	private SqlSessionFactory sqlFactory;
	//test할 코드
	@Test
	public void testFactory() {
		logger.info("sqlFactory:"+sqlFactory);
	}
	@Test
	public void testSession() {
		try(SqlSession sqlSession=sqlFactory.openSession()) {
			logger.info("sqlSession:"+ sqlSession);
			logger.info("mybatis 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}






