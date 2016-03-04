/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.weixin.MpUserDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.Vendor;
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
		
		MpUserDto dto = super.getDto(MpUserDto.class, res);
		MpUser mpUser=commonService.get(MpUser.class, dto.getMpUser().getWxMpUserId());
		commonService.delete(mpUser);

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
     * 微信openid和sci用户id关联
     * @param res
     * @return
     */
	public String MpSci(BusinessRequest res){
		
		MpUserDto dto = super.getDto(MpUserDto.class, res);
		OperateResult operateResult = new OperateResult();
		dto.setOperateResult(operateResult);
		//获取session微信用户信息
		WxMpUser wxMpUser=getWxMpUser();
		List<MpUser> mpUsers=commonService.findByProperty(MpUser.class, "wxMpOpenId", wxMpUser.getOpenId());
		if(mpUsers.size()>0){
			NormalAccount normalAccount = commonService.get(NormalAccount.class, mpUsers.get(0).getWxMpSciPointer());
			if (normalAccount.getNormalUser().getType().intValue() == 2) {
				Vendor vendor = commonService.get(Vendor.class, normalAccount.getNormalUser().getVendorId());
				dto.setDepart(vendor.getName());
			}
			if (normalAccount.getNormalUser().getType().intValue() == 1) {
				HopCtloc hopCtloc = commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());
				dto.setDepart(hopCtloc.getName());
			}
			dto.setUsername(normalAccount.getAccountAlias());
			operateResult.setResultCode("0");
			dto.setMpUser(mpUsers.get(0));
		}else{
			operateResult.setResultCode("1");
			MpUser mpUser = new MpUser();
			mpUser.setWxMpOpenId(wxMpUser.getOpenId());
			dto.setMpUser(mpUser);
		}
		return "MpSubscribe";
	}
   

	/**
	 * 
	* @Title: saveWeiXinOpenId 
	* @Description: TODO(验证,保存微信openid和sci用户) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2016年2月26日 上午8:50:55
	 */
	public void saveWeiXinOpenId(BusinessRequest res) {

		MpUserDto dto = super.getDto(MpUserDto.class, res);
		OperateResult operateResult = new OperateResult();
		dto.setOperateResult(operateResult);
		//获取session微信用户信息
		WxMpUser wxMpUser=getWxMpUser();
				
		List<MpUser> mpUsers = commonService.findByProperty(MpUser.class, "wxMpOpenId", dto.getMpUser().getWxMpOpenId());
		if (mpUsers.size() > 0) {
			operateResult.setResultContent("该微信已关联");
			super.writeJSON(dto.getOperateResult());
			return;
		}
		String[] propertyNames = { "accountAlias", "password" };
		Object[] values = { dto.getUsername(), dto.getPasswd() };
		List<NormalAccount> normalAccounts = commonService.findByProperties( NormalAccount.class, propertyNames, values);
		if (normalAccounts.size() > 0) {
			dto.getMpUser().setWxMpSciPointer(normalAccounts.get(0).getAccountId());
			dto.getMpUser().setWxMpSubscribeSciTime(new Date());
			dto.getMpUser().setWxMpNickname(wxMpUser.getNickname());
			dto.getMpUser().setWxMpHeadimgurl(wxMpUser.getHeadImgUrl());
			dto.getMpUser().setWxMpSend("1");
			commonService.saveOrUpdate(dto.getMpUser());
			operateResult.setResultCode("0");
		} else {
			operateResult.setResultContent("用户名或密码错误");
		}
		super.writeJSON(dto.getOperateResult());
	}
	
	
	/**
	 * 
	* @Title: deleteWeiXinOpenId 
	* @Description: TODO(删除sci和微信关联) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2016年2月26日 上午8:51:06
	 */
	public void deleteWeiXinOpenId(BusinessRequest res) {

		MpUserDto dto = super.getDto(MpUserDto.class, res);
		OperateResult operateResult = new OperateResult();
		dto.setOperateResult(operateResult);
		try {
			Map<String,Object> praAndValueMap=new HashMap<String, Object>();
			praAndValueMap.put("wxMpOpenId", dto.getMpUser().getWxMpOpenId());
			commonService.comonDelete(MpUser.class, praAndValueMap);
			operateResult.setResultCode("0");
		} catch (Exception e) {
			e.printStackTrace();
			operateResult.setResultContent(e.getMessage());
		}finally{
			super.writeJSON(operateResult);
		}
	}
}
