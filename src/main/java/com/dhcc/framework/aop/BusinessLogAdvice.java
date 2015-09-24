package com.dhcc.framework.aop;

import java.util.Date;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

import com.dhcc.framework.common.log.BusinessLogUtil;
import com.dhcc.framework.web.context.Visit;
import com.dhcc.framework.web.context.WebContextHolder;

public class BusinessLogAdvice implements MethodInterceptor {

	
	@Override
	public Object invoke(MethodInvocation invoke) throws Throwable {
		Date startDate = new Date();
		beforeAdvice(invoke);
		Object result = invoke.proceed();
		Date endDate = new Date();
		afterAdvice(invoke,startDate,endDate);
		
		return result;
	}

	
	private void beforeAdvice(MethodInvocation invoke){
		
	}
	
	private void afterAdvice(MethodInvocation invoke,Date startDate,Date endDate){
		String loginName = null;
		String tradeAccount = null;
		if(WebContextHolder.getContext()!=null){
			tradeAccount = WebContextHolder.getContext().getTradeAccount();
			Visit vist = WebContextHolder.getContext().getVisit();
			if(vist!=null&&vist.getUserInfo()!=null){
				loginName = vist.getUserInfo().getLoginName();
			}
		}
		//BusinessLogUtil.writeLog(invoke, loginName, tradeAccount,startDate,endDate);
	}
}
