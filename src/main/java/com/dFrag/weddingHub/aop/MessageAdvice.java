package com.dFrag.weddingHub.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component // 기타 bean
@Aspect // aop bean - 공통 업무를 지원하는 코드
public class MessageAdvice {

	private static final Logger logger
		=LoggerFactory.getLogger(MessageAdvice.class);
	
	@Before(
			"execution(* "
			+ " com.dFrag.weddingHub.service.message"
			+ ".MessageService*.*(..))")	
	public void startLog(JoinPoint jp) {
		logger.info("핵심 업무 코드의 정보:"+jp.getSignature());
		logger.info("method:"+jp.getSignature().getName());
		logger.info("매개변수:"+Arrays.toString(jp.getArgs()));
	}
	
	@Around(
			"execution(* "
			+ " com.dFrag.weddingHub.service.message"
			+ ".MessageService*.*(..) )")
	public Object timeLog(ProceedingJoinPoint pjp)
		throws Throwable {
		//호출 전(Before)
		long start=System.currentTimeMillis();
		Object result=pjp.proceed();
		//호출 후(After)
		long end=System.currentTimeMillis();
		logger.info(pjp.getSignature().getName()+":"+(end-start));
		logger.info("=================");
		return result;
	}
}










