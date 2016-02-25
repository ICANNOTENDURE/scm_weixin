/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.weixin.MpUserDto;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.weixin.MpUser;
import com.dhcc.scm.service.weixin.MpUserService;

@Component
public class MpUserBlh extends AbstractBaseBlh {
	
	private static Log logger = LogFactory.getLog(MpUserBlh.class);
	
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
	public String oauth2Build(BusinessRequest res) throws IOException {

		String host = PropertiesBean.getInstance().getProperty("config.sci.dns");
		String redirectUrl = host + "weixin/mpUserCtrl!getAccessToken.htm";
		logger.debug("redirectUrl:"+redirectUrl);
		// 微信回调我们方法的url，后面会加上code参数
		String weixinUrl = wxMpService.oauth2buildAuthorizationUrl(redirectUrl,WxConsts.OAUTH2_SCOPE_USER_INFO, null);
		// 先调用微信的方法然后用户确认授权后会回调上面的redirectUrl
		logger.debug(weixinUrl);
		WebContextHolder.getContext().getResponse().sendRedirect(weixinUrl);
		return "null";
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
			NormalAccount normalAccount=commonService.get(NormalAccount.class, mpUsers.get(0).getWxMpSciPointer());
			if(normalAccount.getNormalUser().getType().intValue()==2){
				Vendor vendor=commonService.get(Vendor.class, normalAccount.getNormalUser().getVendorId());
				dto.setDepart(vendor.getName());
			}
			dto.setUsername(normalAccount.getAccountAlias());
			operateResult.setResultCode("0");
			dto.setMpUser(mpUsers.get(0));
		} else {
			operateResult.setResultCode("1");
			MpUser mpUser=new MpUser();
			try {
				WxMpUser wxMpUser = wxMpService.oauth2getUserInfo(wxMpOAuth2AccessToken, null);
				mpUser.setWxMpHeadimgurl(wxMpUser.getHeadImgUrl());
				mpUser.setWxMpNickname(wxMpUser.getNickname());
				mpUser.setWxMpUnionid(wxMpUser.getUnionId());
			} catch (WxErrorException e) {
				e.printStackTrace();
			}
			mpUser.setWxMpOpenId(openId);
			dto.setMpUser(mpUser);
		}
		return "MpSubscribe";
	}
	
	
	public void saveWeiXinOpenId(BusinessRequest res) throws UnsupportedEncodingException {
		
		MpUserDto dto = super.getDto(MpUserDto.class, res);
		OperateResult operateResult=new OperateResult();
		dto.setOperateResult(operateResult);
		List<MpUser> mpUsers = commonService.findByProperty(MpUser.class, "wxMpOpenId", dto.getMpUser().getWxMpOpenId());
		if (mpUsers.size() > 0) {
			operateResult.setResultContent("改微信已关联");
			super.writeJSON(dto.getOperateResult());
			return;
		}
		String[] propertyNames={"accountAlias","password"};
		Object[] values={dto.getUsername(),dto.getPasswd()};
		List<NormalAccount> normalAccounts=commonService.findByProperties(NormalAccount.class, propertyNames, values);
		if(normalAccounts.size()>0){
			dto.getMpUser().setWxMpSciPointer(normalAccounts.get(0).getAccountId());
			dto.getMpUser().setWxMpSubscribeSciTime(new Date());
			dto.getMpUser().setWxMpNickname("");
			try {
				commonService.saveOrUpdate(dto.getMpUser());
			} catch (Exception e) {
				e.printStackTrace();
				operateResult.setResultContent(e.getMessage());
				super.writeJSON(dto.getOperateResult());
			}
			operateResult.setResultCode("0");
		}else{
			operateResult.setResultContent("用户名或密码错误");
		}
		super.writeJSON(dto.getOperateResult());
	}
}
