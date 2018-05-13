package com.dFrag.weddingHub.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component //스프링에서 관리하는 bean
@Aspect // 공통적인 업무를 지원하는 bean
public class LogAdvice {
	//로깅을 위한 변수
	private static final Logger logger
		= LoggerFactory.getLogger(LogAdvice.class);
	
//	@Around(
//"execution(* com.dFrag.weddingHub.controller..*Controller.*(..))"
//+ " or execution(* com.dFrag.weddingHub.service..*Impl.*(..))"
//+ " or execution(* com.dFrag.weddingHub.model..dao.*Impl.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint)
		throws Throwable {
		long start=System.currentTimeMillis();
		
		Object result=joinPoint.proceed(); //핵심업무 실행
		
		//호출한 클래스 이름
		String type=
				joinPoint.getSignature().getDeclaringTypeName();
		String name="";
		if(type.indexOf("Controller") > -1) {
			name="Controller \t:";
		}else if(type.indexOf("Service") > -1) {
			name = "ServiceImpl \t:";
		}else if(type.indexOf("DAO") > -1) {
			name = "DaoImpl \t:";
		}
		//호출한 클래스, method 정보
		logger.info(name+type+"."+joinPoint.getSignature()
			.getName()+"()");
		//method에 전달되는 매개변수들
		logger.info(Arrays.toString(joinPoint.getArgs()));
		long end=System.currentTimeMillis();
		long time=end-start;
		logger.info("실행시간:"+time);
		return result;
	}
}
