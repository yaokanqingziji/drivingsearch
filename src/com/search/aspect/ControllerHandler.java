package com.search.aspect;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ldw.frame.common.db.SessionManager;

/**
 * controller层统一切面处理 
 */
@Aspect
@Component
public class ControllerHandler {
	@Autowired
	protected SessionManager sessionManager;

	Logger logger = Logger.getLogger(ControllerHandler.class);

	/**
	 * 
	 * 设置切入点（也就是说这个execute()方法来代替切入的方法）<br>
	 * 
	 * 切入点：第一个*指的是对于任意返回类型，<br>
	 * 接下来com..BaseController包 ..指的是：本包或者子包里面，<br>
	 * 然后接下来*指的是任意方法(..)指的是任意参数
	 */
	@Pointcut("execution(public * com..BaseController+.*(..))")
	public void execute() {
	}

	/**
	 * 定义前置通知，在执行前先执行execute()
	 */
	@Before("execute()")
	public void BeforeExecute() {
	}

	/**
	 * 定义环绕通知
	 * 
	 * @param point
	 * @return Object类型
	 * @throws Throwable
	 */
	@Around("execute()")
	public Object AroundExecute(ProceedingJoinPoint point) throws Throwable {
		//比如记录日志等
		
		
		return point.proceed();
	}


	/**
	 * 定义后置通知
	 */
	@AfterReturning("execute()")
	public void commit() {
	}

	/**
	 * 定义最后通知
	 */
	@After("execute()")
	public void AfterExecute() {
	}

}
