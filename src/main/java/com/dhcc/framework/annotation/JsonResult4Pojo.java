package com.dhcc.framework.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
*
* @deprecated As of dhcc framework  1.6.0.1, this annotation has been replaced
*    by {@link com.dhcc.framework.annotation.JsonResults4Pojo}
*/
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface JsonResult4Pojo {

	String value() default "";
}
