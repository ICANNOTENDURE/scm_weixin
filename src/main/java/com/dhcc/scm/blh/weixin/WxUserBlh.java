/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import javax.annotation.Resource;

import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.cp.bean.WxCpUser;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.weixin.WxUserDto;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.weixin.WxUserService;

@Component
public class WxUserBlh extends AbstractBaseBlh {


	@Resource
	private WxUserService wxUserService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private WxCpService wxCpService;
	
	public WxUserBlh() {
		
	}
	
	/**
	 * 进入某个列表的入口方法
	 * 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list
	 * 框架 在不调Ctrl时，不指定方法，就默认为它list，在action中通过
	 * json注解，所dto中的pageModel to json
	 * @param: res
	 *  
	 */
	public void list(BusinessRequest res) {
	
		WxUserDto dto = super.getDto(WxUserDto.class, res);
		
		//调用对应的service方法
		wxUserService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		WxUserDto dto = super.getDto(WxUserDto.class, res);
		OperateResult operateResult=new OperateResult();
		
		try {

			WxCpUser wxCpUser = new WxCpUser();
			wxCpUser.setEmail(dto.getWxUser().getWxUserEmail());
			wxCpUser.setWeiXinId(dto.getWxUser().getWxUserWeixinId());
			wxCpUser.setName(dto.getWxUser().getWxUserName());
			wxCpUser.setMobile(dto.getWxUser().getWxUserTel());
			Integer[] depart = new Integer[1];
			depart[0]=dto.getWxUser().getWxUserDepartId();
			wxCpUser.setDepartIds(depart);
			dto.setWxCpUser(wxCpUser);
			//调用对应的service方法
			if(StringUtils.isBlank(dto.getWxUser().getWxUserId())){
				dto.getWxUser().setWxUserId(null);
				wxUserService.save(dto);
			}else{
				wxUserService.update(dto);
			}
			operateResult.setResultCode("0");
		} catch (Exception e) {
			e.printStackTrace();
			operateResult.setResultCode("-1");
			operateResult.setResultContent(e.getMessage());
		}finally{
			super.writeJSON(operateResult);
		}
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		WxUserDto dto = super.getDto(WxUserDto.class, res);
		
		//调用对应的service方法
		if(org.apache.commons.lang3.StringUtils.isNotBlank(dto.getWxUser().getWxUserId())){
			try {
				wxUserService.delete(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		WxUserDto dto = super.getDto(WxUserDto.class, res);
		
		//调用对应的service方法
		wxUserService.findById(dto);
		
	}
	
}
