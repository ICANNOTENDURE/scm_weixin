package com.dhcc.framework.web.struts2;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.web.ActionHelper;


/**
 * 校验调用代理
 * @author liuyg
 *
 */
public class ValidateProxy {

	private static Log loger = LogFactory.getLog(ValidateProxy.class);
	private static Map<String, Method> validateCacheMap = new HashMap<String, Method>();
	
	
	public static ValidateResult validateExe(Class<?> refClass,Object invokeActionObjRef,String invokeMethodName){
		String cacheKey = refClass.getName()+"_"+invokeMethodName;
		if(validateCacheMap.get(cacheKey)!=null){
			Method validateMethod = validateCacheMap.get(cacheKey);
			try {
				ValidateResult returnObj = (ValidateResult)validateMethod.invoke(invokeActionObjRef);
				return returnObj;
			} catch (IllegalArgumentException e) {
				loger.error(e.getMessage(),e);
				return ActionHelper.validatePassResult;
			} catch (IllegalAccessException e) {
				loger.error(e.getMessage(),e);
				return ActionHelper.validatePassResult;
			} catch (InvocationTargetException e) {
				loger.error(e.getMessage(),e);
				return ActionHelper.validatePassResult;
			}	
		}else if(validateCacheMap.containsKey(cacheKey)){
			return ActionHelper.validatePassResult;
		}else{
			Method validateMethod = null;
			try {
				validateMethod = refClass.getMethod(invokeMethodName+"Validate");
				validateCacheMap.put(cacheKey, validateMethod);
				ValidateResult returnObj = (ValidateResult)validateMethod.invoke(invokeActionObjRef);
				return returnObj;
			} catch (SecurityException e) {
				loger.error(e.getMessage(),e);
				return ActionHelper.validatePassResult;
			} catch (NoSuchMethodException e) {
				//这时要缓存，不过是设置为NULL，表明该方法没实现校验，下次就不会再试图去取得他的对应的校验方法了
				validateCacheMap.put(cacheKey, null);
				return ActionHelper.validatePassResult;
			}catch (IllegalArgumentException e) {
				loger.error(e.getMessage(),e);
				return ActionHelper.validatePassResult;
			} catch (IllegalAccessException e) {
				loger.error(e.getMessage(),e);
				return ActionHelper.validatePassResult;
			} catch (InvocationTargetException e) {
				loger.error(e.getMessage(),e);
				return ActionHelper.validatePassResult;
			}	
		}
	}
	
}
