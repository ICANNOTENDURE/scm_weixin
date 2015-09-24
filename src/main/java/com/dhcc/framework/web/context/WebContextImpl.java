package com.dhcc.framework.web.context;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.util.IpUtil;



/**
 * web上下文实现 
 * @author liuyg
 * 
 */
public class WebContextImpl implements WebContext {

	private static final Log log = LogFactory.getLog(WebContextImpl.class);
	private HttpServletRequest request;
	private HttpServletResponse response;
	private boolean authentication = false;
	private String msg;
	private String toUrl;
	private String tradeAccount;
	public WebContextImpl() {

	}

	private void init() {
		if (request == null) {
			return;
		}
		Object obj = request.getSession().getAttribute(BaseConstants.VISITOR);
		if (obj != null) {
			((Visit) obj).clearErrors();
		}
	}

	public VisitUser getUserInfo() {

		if (request == null) {
			return null;
		}
		Object obj = request.getSession().getAttribute(BaseConstants.VISITOR);

		if (obj != null) {
			return ((Visit) obj).getUserInfo();
		}
		return null;
	}

	public void setError(String error) {
		if (request == null) {
			return;
		}
		Object obj = request.getSession().getAttribute(BaseConstants.VISITOR);
		if (obj != null) {
			((Visit) obj).addError(error);
		}

	}

	public Set<String> getErrors() {
		if (request == null) {
			return null;
		}
		Object obj = request.getSession().getAttribute(BaseConstants.VISITOR);
		if (obj != null) {
			return ((Visit) obj).getErrors();
		}

		return null;

	}

	public void setVisit(Visit visit) {

		request.getSession().setAttribute(BaseConstants.VISITOR, visit);
		request.getSession().setAttribute("logined", "");
	}

	public Visit getVisit() {
		if (request == null) {
			return null;
		}
		Object obj = request.getSession().getAttribute(BaseConstants.VISITOR);
		if (obj != null) {
			return (Visit) obj;
		}
		return null;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
		init();
	}

	public void setAttr(String attrName, Object obj) {

		request.setAttribute(attrName, obj);
	}

	public Object getAttr(String attrName) {
		return request.getAttribute(attrName);
	}
	public void setSessionAttr(String attrName, Object obj){
		request.getSession().setAttribute(attrName, obj);
	}

	public Object getSessionAttr(String attrName){
		return request.getSession().getAttribute(attrName);
	}
	public boolean isAuthenticated() {
		return authentication;
	}

	public void setAuthenticated(boolean authentication) {

		this.authentication = authentication;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void writeResponse(String str) {
		if (response == null) {
			log.warn("=====response is null ======");
		} else {
			try {
				response.setContentType("text/plain");
				PrintWriter writer = response.getWriter();
				writer.write(str);
				writer.flush();
			} catch (IOException e) {
				log.error(e);
				e.printStackTrace();
			}
		}

	}

	public void appendToResponse(String str) {
		try {
			PrintWriter writer = response.getWriter();
			writer.append(str);
			writer.flush();
		} catch (IOException e) {
			log.error(e.getMessage(),e);
			
		}
	}


	public HttpServletResponse getResponse() {
		return response;
	}

	public String getTradeAccount() {
		return tradeAccount;
	}

	public void setTradeAccount(String tradeAccount) {
		this.tradeAccount = tradeAccount;
	}
	
	public String getIp(){
		String ip = null ;
		if(request!=null){
			ip = IpUtil.getIpAddrByRequest(request);
		}
		return ip;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getToUrl() {
		return toUrl;
	}

	public void setToUrl(String toUrl) {
		this.toUrl = toUrl;
	}
}