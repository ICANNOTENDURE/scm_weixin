/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.weixin.MpUserDto;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.weixin.MpUser;
import com.dhcc.scm.service.weixin.MpUserService;

@Component
public class MpUserBlh extends AbstractBaseBlh {

	@Resource
	private MpUserService mpUserService;

	@Resource
	private CommonService commonService;

	@Resource
	private WxMpService wxMpService;

	@Resource
	private WxMpMessageRouter wxMpMessageRouter;

	@Resource
	private WxMpConfigStorage wxMpConfigStorage;

	public MpUserBlh() {

	}

	/**
	 * 进入某个列表的入口方法 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list 框架
	 * 在不调Ctrl时，不指定方法，就默认为它list，在action中通过 json注解，所dto中的pageModel to json
	 * 
	 * @param: res
	 * 
	 */
	public void list(BusinessRequest res) {

		MpUserDto dto = super.getDto(MpUserDto.class, res);

		// 调用对应的service方法
		mpUserService.list(dto);
	}

	// 保存
	public void save(BusinessRequest res) {

		MpUserDto dto = super.getDto(MpUserDto.class, res);
		commonService.saveOrUpdate(dto.getMpUser());
	}

	// 删除
	public void delete(BusinessRequest res) {

	}

	/**
	 * 修改初始化方法 也是根据iD查询实体的方法 在action加能过注解把这个实体to json
	 * 
	 * @param: res
	 * 
	 */
	public void findById(BusinessRequest res) {

		MpUserDto dto = super.getDto(MpUserDto.class, res);
		// 调用对应的service方法
		mpUserService.findById(dto);
	}

	/**
	 * 
	 * @Title: oauth2buildUrl
	 * @Description: TODO(构造网页授权url,并且重定向到微信，让微信再回调)
	 * @param @throws IOException 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2016年2月24日 下午5:00:45
	 */
	public void oauth2Build(BusinessRequest res) throws IOException {

		String host = PropertiesBean.getInstance().getProperty("config.sci.dns");
		String redirectUrl = host + "weixin/mpUserCtrl!getAccessToken.htm";
		// 微信回调我们方法的url，后面会加上code参数
		String weixinUrl = wxMpService.oauth2buildAuthorizationUrl(redirectUrl, null);
		// 先调用微信的方法然后用户确认授权后会回调上面的redirectUrl
		WebContextHolder.getContext().getResponse().sendRedirect(weixinUrl);
	}

	/**
	 * 
	 * @Title: getAccessToken
	 * @Description: TODO(当用户同意授权后，会回调所设置的url并把authorization
	 *               code传过来，然后用这个code获得access token)
	 * @param 设定文件
	 * @return void 返回类型
	 * @throws WxErrorException
	 * @throws
	 * @author zhouxin
	 * @date 2016年2月24日 下午5:12:02
	 */
	public String getAccessToken(BusinessRequest res){
		MpUserDto dto = super.getDto(MpUserDto.class, res);
		OperateResult operateResult=new OperateResult();
		dto.setOperateResult(operateResult);
		if(StringUtils.isBlank(getParameter("code"))){
			operateResult.setResultContent("微信返回code为空");
			return "MpSubscribe";
		}
		WxMpOAuth2AccessToken wxMpOAuth2AccessToken = null;
		try {
			wxMpOAuth2AccessToken = wxMpService.oauth2getAccessToken(getParameter("code"));
		} catch (WxErrorException e) {
			e.printStackTrace();
			operateResult.setResultContent(e.getMessage());
			return "MpSubscribe";
		}
		String openId = wxMpOAuth2AccessToken.getOpenId();
		List<MpUser> mpUsers = commonService.findByProperty(MpUser.class, "wxMpOpenId", openId);
		if (mpUsers.size() > 0) {
			operateResult.setResultCode("0");
			dto.setMpUser(mpUsers.get(0));
		} else {
			operateResult.setResultCode("1");
			MpUser mpUser=new MpUser();
			mpUser.setWxMpOpenId(openId);
			dto.setMpUser(mpUser);
		}
		return "MpSubscribe";

	}
}
