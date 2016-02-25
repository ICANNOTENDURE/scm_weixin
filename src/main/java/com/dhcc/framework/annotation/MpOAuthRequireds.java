package com.dhcc.framework.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/**
 * 
* @ClassName: OAuthRequired 
* @Description: TODO(需要微信验证) 
* @author zhouxin
* @date 2016年2月25日 下午2:25:59 
*
 */
@Retention(RetentionPolicy.RUNTIME)  
@Target(ElementType.TYPE)  
public @interface MpOAuthRequireds {

	MpOAuthRequired[] value();
}
