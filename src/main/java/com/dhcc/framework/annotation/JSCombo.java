package com.dhcc.framework.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface JSCombo {
	
	String url() default "";
	
	String valueField() default "";
	
	String textField() default "";
	
	public enum Type{local,remote};
	
	Type mode() default Type.local;
	
}
