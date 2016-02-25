package com.dhcc.framework.web.security;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.dhcc.framework.annotation.MpOAuthRequired;
import com.dhcc.framework.annotation.MpOAuthRequireds;
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
	
	
	@Resource
	private WxMpService wxMpService;
	
	@Override
	public void destroy() {

	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		OAuthRequireds oas =(OAuthRequireds) invocation.getProxy().getAction().getClass().getAnnotation(OAuthRequireds.class);
		MpOAuthRequireds mpoas =(MpOAuthRequireds) invocation.getProxy().getAction().getClass().getAnnotation(MpOAuthRequireds.class);
		
		ActionContext ctx = invocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ctx.get(ServletActionContext.HTTP_RESPONSE);
		String code = request.getParameter("code");
		//微信企业号
		if (oas != null) {
			OAuthRequired[] oa = oas.value();
			if (oa != null) {
				for (OAuthRequired jr : oa) {
					if (jr.BlhMethod().equals(invocation.getProxy().getMethod())) {
						
						String userIdString = "";
						//HttpServletRequest request =ServletActionContext.getRequest();
						Object object=ctx.getSession().get(BaseConstants.WEIXIN_SESSION_ID);
						if(object!=null){
							userIdString=object.toString();
						}
						if (StringUtils.isBlank(userIdString)) {
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
       
		//微信公众号取openid
		if(mpoas != null){
			MpOAuthRequired[] mpoa = mpoas.value();
			if (mpoa != null) {
				for (MpOAuthRequired mp : mpoa) {
					if (mp.BlhMethod().equals(invocation.getProxy().getMethod())) {
						WxMpUser wxMpUser=(WxMpUser)ctx.getSession().get(BaseConstants.WEIXIN_MP_USER);
						if (wxMpUser==null) {
							if (StringUtils.isNotBlank(code)) {
								try {
									WxMpOAuth2AccessToken wxMpOAuth2AccessToken=wxMpService .oauth2getAccessToken(code);
									WxMpUser wxMpUser1 = wxMpService.oauth2getUserInfo(wxMpOAuth2AccessToken, null);
									ctx.getSession().put(BaseConstants.WEIXIN_MP_USER, wxMpUser1);
									return invocation.invoke();
								} catch (WxErrorException e) {
									e.printStackTrace();
								}
							} else {
								String redirectUrl = request.getRequestURL().toString();
								String param = request.getQueryString();
								if (param != null) {
									redirectUrl += "?" + param;
								}
								// 微信回调我们方法的url，后面会加上code参数
								String weixinUrl = wxMpService.oauth2buildAuthorizationUrl(redirectUrl,WxConsts.OAUTH2_SCOPE_USER_INFO, null);
								response.sendRedirect(weixinUrl);
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
