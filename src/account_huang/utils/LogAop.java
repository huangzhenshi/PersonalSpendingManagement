package account_huang.utils;

import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import account_huang.annotation.Mylog;
import account_huang.entity.Log;
import account_huang.entity.User;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.UUID;

@Component
@Aspect
public class LogAop
{
	private static final Logger logger = LoggerFactory.getLogger(LogAop.class);
	private static final String ELEXPRESSION_PRE = "${";
	private static final String ELEXPRESSION_SUF = "}";
	

	@Resource
	HttpServletRequest request;
	@Resource
	HttpSession session;

	@Resource
    private SqlSessionTemplate template;
	
	@Around("@annotation(account_huang.annotation.Mylog)")
	public Object log(ProceedingJoinPoint joinPoint)
	{
		Object result = null;

		try {
			result = joinPoint.proceed();
			//方法执行完记录日志
			saveLog(joinPoint, true,result);
		} catch (Throwable e) {
			//方法执行报错记录日志
			saveLog(joinPoint, false,result);
			throw new RuntimeException(e);
		}
		return result;
	}

	private void saveLog(ProceedingJoinPoint joinPoint, boolean isSuccess,Object excuteResult){
		Object[] getArgs=joinPoint.getArgs();
		MethodSignature ms = (MethodSignature) joinPoint.getSignature();
		Method method = ms.getMethod();

		if (method.isAnnotationPresent(Mylog.class))
		{
			//获取注解信息
			Mylog mylog = method.getAnnotation(Mylog.class);
			
			if (mylog != null){
				Object thisObj = joinPoint.getThis();
				Log log=new Log();
				log.setId(UUID.randomUUID().toString().trim().replaceAll("-", ""));
				log.setLogDate(Utils.getCurrentTime());
				String moduleName = mylog.moduleName();
				if(StringUtils.isEmpty(moduleName)){
					moduleName=joinPoint.getTarget().getClass().getName();
				}
				log.setModuleName(moduleName);
				
				String operate = mylog.operate();
				if(StringUtils.isEmpty(operate)){
					operate=joinPoint.getSignature().getName();
				}
				log.setOperate(operate);
				String detail=processELExpression(mylog.detail());
				log.setDetail(detail);
				String result="unknown";
				
				try{
					if((Boolean) excuteResult){
						result="Operation success";
					}else{
						result="Operation fail";
					}
				}catch(Exception e){
				}
				log.setResult(result);
				
				if(mylog.isLogin()){
					log.setUserId("未登陆");
					String username=request.getParameter("username");
					String password=request.getParameter("password");
					String loginIp=request.getRemoteAddr();
					if (request.getHeader("x-forwarded-for") != null) {
						loginIp= request.getHeader("x-forwarded-for");
					}
					try{
						if((Boolean) session.getAttribute("loginResult")){
							log.setResult("login success");
						}else{
							log.setResult("login fail");
						}
					}catch(Exception e){
					}
					log.setUsername(username);
					log.setDetail("username:"+username+";password="+password+";loginIp="+loginIp);
				}else{
					User currentUser=getCurrentUser();
					log.setUserId(currentUser.getId());
					log.setUsername(currentUser.getUsername());
				}
				template.insert("account_huang.dao.CommonDao.saveLog", log);
				
			}
		}
	}
	public User getCurrentUser(){
		HttpSession session=request.getSession();
		User currentUser=(User) session.getAttribute("loginUser");
		return currentUser;
	}
	
	private String processELExpression(String str) {
		String[] result = Utils.split(str, ELEXPRESSION_PRE, ELEXPRESSION_SUF);
		
		if (result == null) return null;
		
		if (!"".equals(result[1])) {
			String test=result[1];
			String value = request.getParameter(result[1]);
			if(value == null){
				value = "[]";
			}

			result[1] = value;
		}
		
		if (!"".equals(result[2])) {
			result[2] = processELExpression(result[2]);
		}
		
		return result[0]+result[1]+result[2];
	}
}
