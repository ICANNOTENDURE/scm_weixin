package com.dhcc.framework.web.struts2;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.web.BaseAction;
import com.dhcc.framework.web.BaseActionModelDriven;
import com.opensymphony.xwork2.DefaultActionInvocation;
import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.config.entities.ActionConfig;
import com.opensymphony.xwork2.util.profiling.UtilTimerStack;

/**
 * 自定义的ActionInvocation类，继承自xwork的DefaultActionInvocation，
 * 在调用StrutsAction前处理自定义的业务类
 * 
 * @author liuyg
 * 
 */
public class DhccActionInvocation extends DefaultActionInvocation {

	private static final long serialVersionUID = -7601118948561795017L;
	private static Log logger = LogFactory.getLog(DhccActionInvocation.class);

	public DhccActionInvocation(Map<String, Object> extraContext,
			boolean pushAction) {
		super(extraContext, pushAction);
	}

	@Override
	protected String invokeAction(Object action, ActionConfig actionConfig)
			throws Exception {
		String methodName = proxy.getMethod();

		Method methodHandlerFlow = null;
		boolean isBaseAction = false;
		boolean isModelDrivenAction = false;
		if (logger.isDebugEnabled()) {
			logger.debug("Executing action method = "
					+ actionConfig.getMethodName());
		}

		String timerKey = "invokeAction: " + proxy.getActionName();
		if (!"execute".equals(methodName)) {
			if (getAction().getClass().getSuperclass() == BaseAction.class) {
				isBaseAction = true;
			}

			if (isBaseAction) {
				Class<?> clazz[] = new Class[1];
				clazz[0] = String.class;
				methodHandlerFlow = getAction().getClass().getMethod(
						"setBusinessFlow", clazz);
			}

			if (methodHandlerFlow == null) {
				if (getAction().getClass().getSuperclass() == BaseActionModelDriven.class) {
					isModelDrivenAction = true;
				}
			}

			if (isModelDrivenAction) {
				Class<?> clazz[] = new Class[1];
				clazz[0] = String.class;
				methodHandlerFlow = getAction().getClass().getMethod(
						"setBusinessFlow", clazz);
			}
		}

		if (methodHandlerFlow != null) {
			Object object[] = new Object[1];
			object[0] = methodName;
			methodHandlerFlow.invoke(action, new Object[] { object[0] });

			if (isModelDrivenAction || isBaseAction)
				methodName = "execute";
		}

		try {
			UtilTimerStack.push(timerKey);
			boolean methodCalled = false;
			Object methodResult = null;
			Method method = null;

			try {
				method = getAction().getClass().getMethod(methodName,
						new Class[0]);
			} catch (NoSuchMethodException e) {
				// hmm -- OK, try doXxx instead
				try {
					String altMethodName = "do"
							+ methodName.substring(0, 1).toUpperCase()
							+ methodName.substring(1);
					method = getAction().getClass().getMethod(altMethodName,
							new Class[0]);
				} catch (NoSuchMethodException e1) {
					// well, give the unknown handler a shot
					if (unknownHandlerManager.hasUnknownHandlers()) {
						try {
							methodResult = unknownHandlerManager
									.handleUnknownMethod(action, methodName);
							methodCalled = true;
						} catch (NoSuchMethodException e2) {
							// throw the original one
							throw e;
						}
					} else {
						throw e;
					}
				}
			}

			if (!methodCalled) {
				methodResult = method.invoke(action, new Object[0]);
			}

			if (methodResult instanceof Result) {
				this.explicitResult = (Result) methodResult;

				// Wire the result automatically
				container.inject(explicitResult);
				return null;
			} else {
				return (String) methodResult;
			}
		} catch (NoSuchMethodException e) {
			throw new IllegalArgumentException("The " + methodName
					+ "() is not defined in action " + getAction().getClass()
					+ "");
		} catch (InvocationTargetException e) {
			// We try to return the source exception.
			Throwable t = e.getTargetException();

			if (actionEventListener != null) {
				String result = actionEventListener.handleException(t,
						getStack());
				if (result != null) {
					return result;
				}
			}
			if (t instanceof Exception) {
				throw (Exception) t;
			} else {
				throw e;
			}
		} finally {
			UtilTimerStack.pop(timerKey);
		}
	}
}
