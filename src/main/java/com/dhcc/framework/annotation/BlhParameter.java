package com.dhcc.framework.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface BlhParameter {

	String parameterExpress();
	
	/**
	 * 标识该参数是否必填，默认为必填项
	 */
	boolean required() default true;
	
	String[] testvalues() default "";
	
	String desc() default "";
	
}
