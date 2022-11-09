package aspect;

import java.util.logging.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggingAspect {
	
	private Logger logger = Logger.getLogger(getClass().getName());
	
	@Pointcut("execution(* controller.*.*(..))")
	private void forControllerPackage() {}
	
	@Pointcut("execution(* dao.*.*(..))")
	private void forDaoPackage() {}
	
	@Pointcut("execution(* service.*.*(..))")
	private void forServicePackage() {}
	
	@Pointcut("forControllerPackage() || forServicePackage() || forDaoPackage()")
	private void forAppFlow() {}
	
	@Before("forAppFlow()")
	public void before(JoinPoint joinpoint) {
		String method = joinpoint.getSignature().toShortString();
		logger.info("=====>> in @Before: calling method: " + method);
		
		
		Object[] args = joinpoint.getArgs();
		
		for(Object o: args) {
			logger.info("=====>> argument: " + o);
		}
	}
	
	@AfterReturning(pointcut="forAppFlow()", returning="result")
	public void afterReturning(JoinPoint joinpoint, Object result) {
		String method = joinpoint.getSignature().toShortString();
		logger.info("=====>> in @AfterReturning: from method: " + method);
		
		logger.info("=====>> result: " + result);
	}
}
