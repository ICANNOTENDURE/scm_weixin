package com.dhcc.framework.aop;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.aop.ClassFilter;
import org.springframework.aop.support.StaticMethodMatcherPointcut;

public class BusinessLogPointcut extends StaticMethodMatcherPointcut {

	Map<String ,String> methodHolder = new HashMap<String ,String>();
	private static String serverNameMathExpress = "^com\\.dhcc.*service.*\\.*Service.*$";
	//"^com\\.dhcc.*service.*\\.*Service$";
	private static Pattern pt = null;
	static{
		pt  = Pattern.compile(serverNameMathExpress);
	}
	
	@Override
	public boolean matches(Method method, Class<?> targetClass) {
		
		return true;
	}
	
	public ClassFilter getClassFilter() {
		return new ClassFilter() {
			public boolean matches(Class<?> clasz) {
				return (pt.matcher(clasz.getName()).matches());
			}
		};
	}

	public static void main(String[] args) {
		String name = "com.dhcc.pms.service.rolemanager.impl.UserService";
		String serverNameMathExpress = "^com\\.dhcc.*service.*\\.*Service.*$";
		Pattern pt  = Pattern.compile(serverNameMathExpress);
		System.out.println(pt.matcher(name).matches());
		
	}
}
