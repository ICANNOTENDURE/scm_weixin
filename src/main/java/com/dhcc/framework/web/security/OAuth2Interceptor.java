package com.dhcc.framework.web.security;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.cp.api.WxCpService;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.dhcc.framework.annotation.OAuthRequired;
import com.dhcc.framework.annotation.OAuthRequireds;
import com.dhcc.framework.common.BaseConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class OAuth2Interceptor implements Interceptor {

	private static final long serialVersionUID = 1L;
	private static Log logger = LogFactory.getLog(OAuth2Interceptor.class);

	@Resource
	private WxCpService wxCpService;

	@Override
	public void destroy() {

	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		OAuthRequireds oas =(OAuthRequireds) invocation.getProxy().getAction().getClass().getAnnotation(OAuthRequireds.class);
		if (oas != null) {
			OAuthRequired[] oa = oas.value();
			if (oa != null) {
				for (OAuthRequired jr : oa) {
					if (jr.BlhMethod().equals(invocation.getProxy().getMethod())) {
						ActionContext ctx = invocation.getInvocationContext();
						HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
						HttpServletResponse response = (HttpServletResponse) ctx.get(ServletActionContext.HTTP_RESPONSE);
						String userIdString = "";
						//HttpServletRequest request =ServletActionContext.getRequest();
						Object object=ctx.getSession().get(BaseConstants.WEIXIN_SESSION_ID);
						if(object!=null){
							userIdString=object.toString();
						}

						if (StringUtils.isBlank(userIdString)) {
							String code = request.getParameter("code");
							if (StringUtils.isNotBlank(code)) {
								try {
									String[] ret = wxCpService.oauth2getUserInfo(code);
									logger.info("get id from weixin :"+ret[0]);
									userIdString = ret[0];
									ctx.getSession().put(BaseConstants.WEIXIN_SESSION_ID, userIdString);
									return invocation.invoke();
								} catch (WxErrorException e) {
									e.printStackTrace();
								}
							} else {
								String resultUrl = request.getRequestURL().toString();
								String param = request.getQueryString();
								if (param != null) {
									resultUrl += "?" + param;
								}
								String url = wxCpService.oauth2buildAuthorizationUrl(resultUrl, null);
								response.sendRedirect(url);
								return null;
							}
						}else{
							return invocation.invoke();
						}
					}
				}
			}
		}

		return invocation.invoke();
	}

}
