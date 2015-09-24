package com.dhcc.framework.common;

import java.sql.SQLException;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.DependsOn;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.BlhFactory;


/**
 * 虽然有注解，但在OD分析中，有时要动态取出相关接口的实现来处理 以静态变量保存Spring
 * ApplicationContext,可在任意代码中取出ApplicaitonContext.
 * 
 * @author liuyg
 * 
 */
@Component
@DependsOn("commonDao")
public class SpringContextHolder implements ApplicationContextAware {

	protected static Log logger = LogFactory.getLog(SpringContextHolder.class);
	private static ApplicationContext applicationContext;
	
	/**
	 * 实现ApplicationContextAware接口的context注入函数, 将其存入静态变量.
	 */
	public void setApplicationContext(ApplicationContext applicationContext) {
		SpringContextHolder.applicationContext = applicationContext;

	}
	

	/**
	 * 取得存储在静态变量中的ApplicationContext.
	 */
	public static ApplicationContext getApplicationContext() {
		checkApplicationContext();
		return applicationContext;
	}

	/**
	 * 从静态变量ApplicationContext中取得Bean, 自动转型为所赋值对象的类型.
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getBean(String name) {
		checkApplicationContext();
		return (T) applicationContext.getBean(name);
	}

	/**
	 * 从静态变量ApplicationContext中取得Bean, 自动转型为所赋值对象的类型.
	 */
	public static <T> T getBean(Class<T> clazz) {
		checkApplicationContext();
		return (T) applicationContext.getBeansOfType(clazz);
	}

	private static void checkApplicationContext() {
		if (applicationContext == null)
			throw new IllegalStateException("applicaitonContext未注入");
	}

	public static void  refressh() {
		AbstractApplicationContext act = ((AbstractApplicationContext)applicationContext);
		BasicDataSource ds = (BasicDataSource)act.getBean("dataSource");
		try {
			ds.close();
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
		}
		act.stop();
		BlhFactory.clean();
		act.refresh(); 
	}
}
