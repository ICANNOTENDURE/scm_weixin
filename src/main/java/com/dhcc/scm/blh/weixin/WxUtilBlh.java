/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import java.io.IOException;

import javax.annotation.Resource;

import me.chanjar.weixin.cp.api.WxCpService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.web.context.WebContextHolder;

@Component
public class WxUtilBlh {

	private static Log logger = LogFactory.getLog(WxUtilBlh.class);

	@Resource
	private CommonService commonService;
	
	@Resource
	private WxCpService wxCpService;
	
	public WxUtilBlh() {
		
	}
	
	
	/**
	 * 
	* @Title: Oauth2API 
	* @Description: TODO(获取微信登录用户id) 
	* @param @param url    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年9月18日 上午11:46:26
	 */
	public void Oauth2API(String url){
		
		try {
			WebContextHolder.getContext().getResponse().sendRedirect(wxCpService.oauth2buildAuthorizationUrl(url,""));
		} catch (IOException e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
	}
	
	
}
