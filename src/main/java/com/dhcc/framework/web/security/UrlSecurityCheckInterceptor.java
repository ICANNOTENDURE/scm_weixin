package com.dhcc.framework.web.security;

import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.ServletContextAware;

import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.common.config.SpringSetupContextHolder;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.service.AuthorityInterface;
import com.dhcc.framework.web.context.Visit;
import com.dhcc.framework.web.context.WebContextHolder;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class UrlSecurityCheckInterceptor implements Interceptor,
		ServletContextAware {

	private static Log logger = LogFactory.getLog(UrlSecurityCheckInterceptor.class);
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static ServletContext sc;
	private static boolean loadCheckUrl = false;
	protected  static Set<String> needCheckUrls = new HashSet<String>();
	private static boolean  isAuthentication = true;
	private static final long serialVersionUID = 1L;
	private static String pubUrlExpress = "";
	public static Pattern pt;
	

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.sc = servletContext;
		if ("false".equalsIgnoreCase(sc.getInitParameter("isAuthentication"))) {
			this.isAuthentication = false;
		}
		pubUrlExpress = servletContext.getInitParameter("pubUrl");
		pt = Pattern.compile(pubUrlExpress);
	}

	@Override
	public void destroy() {
		

	}

	@Override
	public void init() {
		

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String currSecUrl = getUrl(invocation);
		if (!urlCheck(currSecUrl)) {
			HttpServletRequest request = ServletActionContext.getRequest();
			if(isAjaxRequest()){
				ServletResponse response = ServletActionContext.getResponse();
				return this.goAjaxDenyPage((ServletRequest)request, response); 
			}else{
				BaseException exc = new BaseException("您没有当前操作权限");
				request.setAttribute("EXP_INFO", exc);
				return "globalException";	
			}
		}
		return invocation.invoke();
		
	}
	private String  goAjaxDenyPage(ServletRequest request, ServletResponse response) throws Exception {
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		httpResponse.setContentType(CONTENT_TYPE);
		PrintWriter writer = response.getWriter();
		writer.write("deny");
		writer.flush();
		httpResponse.sendError(401, "UNAUTHORIZED");
		return "null";
	}
	protected static boolean isAjaxRequest() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String requestType = request.getHeader("X-Requested-With");
		if (requestType != null && "XMLHttpRequest".equals(requestType)) {
			return true;
		}
		return false;
	}
	
	private  boolean urlCheck(String currSecUrl) {
		if (!isAuthentication) {
			return true;
		}
		Set<String> allCheckUrl = getNeedCheckUrls();
		if(allCheckUrl.isEmpty()){
			return true;
		}
		if(!pt.matcher(currSecUrl).matches()){
			return true;
		}
		if(allCheckUrl.contains(currSecUrl)){
			Visit visit = WebContextHolder.getContext().getVisit();
			if(visit!=null&&visit.getUserInfo().getPrivilege().contains(currSecUrl)){
				return true;
			}else if(visit!=null&&!visit.getUserInfo().getPrivilege().contains(currSecUrl)){
				return false;
			}
		}
		return true;
	}
	private static Set<String> getNeedCheckUrls() {

		if (needCheckUrls.size() == 0&&!loadCheckUrl) {
			initNeedCheckUrls();
			loadCheckUrl = true;
		} 
		return needCheckUrls;
	}
	
	private static void initNeedCheckUrls() {
		AuthorityInterface authorityInterface = null;;
		try {
			authorityInterface = SpringSetupContextHolder.getBean("authorityInterface");
			Set<String> set =authorityInterface.getNeedCheckUrls(PropertiesBean.getInstance().getProperty("conf.system.shortName"));
			if(set!=null){
				needCheckUrls = set;
			}
		} catch (Exception e) {
			logger.error("pms client no authorityInterface implements "+e.getMessage(),e);
		}

	}
	private String getUrl(ActionInvocation invocation) {
		String np = invocation.getProxy().getNamespace();
		StringBuffer url = new StringBuffer();
		if(np!=null&&!np.equals("/")){
			url.append(np).append("/").append(invocation.getProxy().getActionName());
		}else{
			url.append(invocation.getProxy().getActionName());
		}
		url.append("!");
		String method = invocation.getProxy().getMethod();
		if(method==null||"".equals(method)){
			method="list";
		}
		url.append(method);
		return url.toString();
	}
}
