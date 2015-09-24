package com.dhcc.framework.app.blh;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.UndeclaredThrowableException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.transmission.event.BusinessResponse;
import com.dhcc.framework.transmission.event.ResponseEvent;



public abstract class BlhInvoker {

	private static Log loger = LogFactory.getLog(BlhInvoker.class);
	/**
	 * 无反回ResponseEvent时，用这个静态的返回，实际用什么用外，主要是让接口统一
	 */
	private static BusinessResponse defaultResponse = new BusinessResponse();
	
	public static ResponseEvent invokeBlh(BusinessRequest request, Object refBusinessHander,
			Class<?> refClass) throws BaseException {
		Class<?>[] paramClass = new Class[1];
		paramClass[0] = BusinessRequest.class;
		Method methodBlh = null;
		Object[] paramObjs = new Object[1];
		paramObjs[0] = request;
		BusinessResponse result = null;
		try {
			methodBlh = refClass.getMethod(request.getDealMethod(), paramClass);
			if (!"void".equals(methodBlh.getReturnType().getSimpleName())) {
				Object returnObj = methodBlh.invoke(refBusinessHander, paramObjs);
				if (returnObj.getClass() == BusinessResponse.class) {
					result = (BusinessResponse) returnObj;
				}else if(returnObj.getClass() == String.class){
					result =  new BusinessResponse();
					result.displayData("forward", returnObj);
				}else {
					result = new BusinessResponse();
					result.displayData(request.getDealMethod(), returnObj);
				}
			} else {
				methodBlh.invoke(refBusinessHander, paramObjs);
				result = defaultResponse;
			}
		} catch (SecurityException e) {
			throw new BaseException(e.getMessage(), e);
		} catch (NoSuchMethodException e) {
			loger.error(refClass.getSimpleName() + "不含" + request.getDealMethod()
					+ "方法");
			throw new BaseException(refClass.getSimpleName() + "不含"
					+ request.getDealMethod() + "方法", e);
		} catch (IllegalArgumentException e) {
			loger.error("调用" 
					+ request.getDealMethod() + "时所传参数不是BusiRequestEvent类型", e);
			throw new BaseException("调用" 
					+ request.getDealMethod() + "时所传参数不是BusiRequestEvent类型", e);
		} catch (IllegalAccessException e) {
			loger.error("调用" 
					+ methodBlh.getName() + "发生IllegalAccessException 异常",e);
			throw new BaseException("调用" 
					+ methodBlh.getName() + "发生IllegalAccessException 导常", e);
		} catch (InvocationTargetException e) {
			Throwable t = e.getTargetException();
			loger.error("调用" 
					+ methodBlh.getName() + "发生InvocationTargetException 异常"
					,t);
			if (t instanceof Error) {
				throw new BaseException("调用" 
						+ methodBlh.getName() + "发生异常:" + t.getMessage());
			} else {
				throw new BaseException("调用" 
						+ methodBlh.getName() + "发生异常", (Exception) t);
			}
		} catch (ClassCastException e) {
			loger.error("返回类型不是View", e);
			throw new BaseException( "返回类型不是ResponseEvent", e);
		} catch (UndeclaredThrowableException e) {
			loger.error(e.getMessage(),e);
			throw new BaseException( "返回类型不是ResponseEvent");
		}
		return result;

	}

}
