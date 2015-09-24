package com.dhcc.framework.app.blh;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.common.SpringContextHolder;
import com.dhcc.framework.common.config.SpringSetupContextHolder;
import com.dhcc.framework.exception.BaseException;


/**
 * 
 * Description:
 * action 和blh mapping处理类
 * 通过action Class 自动获得blh 
 * 并缓存到map 中
 * @author liuyg
 * @version 0.5
 * Company:dhcc
 * Copyright:dhcc
 */

public abstract class BlhFactory {

	private static Log logger = LogFactory.getLog(BlhFactory.class);
	private static Map<String, BusinessLogicHandler> businessHanderManagerMap = new HashMap<String, BusinessLogicHandler>();

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static BusinessLogicHandler getBusinessHandler(Class actionClass)
			throws BaseException {
		
		BusinessLogicHandler handler = null;
		handler = businessHanderManagerMap.get(actionClass.getSimpleName());
		if(handler==null){
			Blh blhAnno = (Blh)actionClass.getAnnotation(Blh.class);
			String blhBeanId = null;
			if(blhAnno!=null){
				blhBeanId = blhAnno.value();
			}
			if("".equals(blhBeanId)||blhBeanId==null){
				try {
					blhBeanId = getDefaultHandlerIdByAction(actionClass.getSimpleName());
				} catch (StringIndexOutOfBoundsException e) {
					logger.error("action name isn't a standard name",e);
				}
			}
			
			try {
				handler = (BusinessLogicHandler) SpringContextHolder.getBean(blhBeanId);
			} catch (NoSuchBeanDefinitionException e) {
				logger.error(e.getMessage(), e);
			}catch (IllegalStateException e){
				handler = SpringSetupContextHolder.getBean(blhBeanId);
			}
		}
		if (handler == null) {
			throw new BaseException("no  blh  configuratin  for action :"+ actionClass.getName());
		}
		businessHanderManagerMap.put(actionClass.getSimpleName(), handler);
		return handler;
	}

	private static String lowerFirstChar(String string) {
		if (string == null) {
			return null;
		}
		if (string.length() <= 1) {
			return string.toLowerCase();
		}
		StringBuffer sb = new StringBuffer(string);
		sb.setCharAt(0, Character.toLowerCase(sb.charAt(0)));
		return sb.toString();
	}



	public static String getDefaultHandlerIdByAction(
			String actionClassSimpleName)
			throws StringIndexOutOfBoundsException {

		return lowerFirstChar(actionClassSimpleName.substring(0,
				actionClassSimpleName.lastIndexOf("Action"))) + "Blh";
	}

	public static void clean (){
		businessHanderManagerMap.clear();
	}
}