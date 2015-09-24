package com.dhcc.framework.common;

import javax.servlet.http.HttpSession;

import com.dhcc.framework.web.context.VisitUser;
import com.dhcc.framework.web.context.WebContext;
import com.dhcc.framework.web.context.WebContextHolder;

public abstract class WebContextHolderHelp {


	public static HttpSession getSession() {
		return WebContextHolder.getContext().getRequest().getSession();
	}

	public static Integer getUserId(Integer... defaultId) {
		WebContext sc = WebContextHolder.getContext();
		Object userId = sc.getRequest().getSession().getAttribute(BaseConstants.SESSION_KEY_USER_ID);
		return new Integer(userId.toString());
	}

	public static String getLoginName() {
		WebContext sc = WebContextHolder.getContext();
		if (sc == null || sc.getUserInfo() == null) {
			return null;
		}
		return sc.getUserInfo().getLoginName();
	}



	public static VisitUser getMyUserInfo() {
		WebContext sc = WebContextHolder.getContext();
		return sc.getVisit().getUserInfo(VisitUser.class);
	}



	public static void setAttrribute(String key, Object obj) {
		WebContext sc = WebContextHolder.getContext();
		sc.setAttr(key, obj);
	}

	
	/**
	 * 在request中存放消息，以便于页面对话框展示
	 * 
	 * @param message
	 *            消息
	 * @param dialogType
	 *            对话框类型，参见MessageTag常量DIALOG_TYPE
	 */
	public static void saveMessage(String message, String dialogType) {
		setFlashVar(BaseConstants.REQUEST_MESSAGE_KEY, message);
		setFlashVar(BaseConstants.REQUEST_MESSAGE_DIALOG_TYPE_KEY, dialogType);
	}

	/**
	 * 在request中存放消息，以便于页面展示提示信息
	 * 
	 * @param message
	 */
	public static void saveTip(String message) {
		setFlashVar(BaseConstants.PAGE_TIP_KEY, message);
	}



	/**
	 * 设置flash变量
	 * 
	 * @param key
	 * @param value
	 */
	public static void setFlashVar(String key, Object value) {
		getSession().setAttribute(key, value);
	}

	/**
	 * 取出flash变量（flash变量将在取出后被移除）
	 * 
	 * @param key
	 * @return
	 */
	public static Object getFlashVar(String key) {
		HttpSession session = getSession();
		Object result = session.getAttribute(key);
		session.removeAttribute(key);
		return result;
	}
}
