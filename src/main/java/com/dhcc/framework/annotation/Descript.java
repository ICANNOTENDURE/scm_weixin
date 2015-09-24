package com.dhcc.framework.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/**
 * 该标签打在blh类(或ws类)上，则用于描述webservice服务，如：日志配置管理<br>
 * 该标签打在blh方法(或ws方法)上，则用于描述该方法作为ws服务的什么功能，如：日志配置查询
 */
@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Descript { 
	String value() default "";
}