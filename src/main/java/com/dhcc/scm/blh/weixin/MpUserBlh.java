/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import javax.annotation.Resource;

import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.api.WxMpService;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.weixin.MpUserDto;
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
	private  WxMpConfigStorage wxMpConfigStorage;
	
	public MpUserBlh() {
		
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
	
		MpUserDto dto = super.getDto(MpUserDto.class, res);
		
		//调用对应的service方法
		mpUserService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		MpUserDto dto = super.getDto(MpUserDto.class, res);
		commonService.saveOrUpdate(dto.getMpUser());
	}
	
	//删除
	public void delete(BusinessRequest res) {
		
	}

	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		MpUserDto dto = super.getDto(MpUserDto.class, res);
		//调用对应的service方法
		mpUserService.findById(dto);
	}
	
}
