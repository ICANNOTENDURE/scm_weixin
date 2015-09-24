package com.dhcc.framework.web.struts2;

import java.util.Map;

import org.apache.struts2.impl.StrutsActionProxyFactory;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;


/**
 * 扩展struts的ActionProxyFactory，用来在创建ActionProxy中创建DhccActionInvocation实例
 * 
 * @author liuyg
 * 
 */
public class DhccActionProxyFactory extends StrutsActionProxyFactory {

	@Override
	 public ActionProxy createActionProxy(String namespace, String actionName, String methodName, Map<String, Object> extraContext, boolean executeResult, boolean cleanupContext) {
	       
	        ActionInvocation inv = new DhccActionInvocation(extraContext, true);
	        container.inject(inv);
	        return createActionProxy(inv, namespace, actionName, methodName, executeResult, cleanupContext);
	    }
}
