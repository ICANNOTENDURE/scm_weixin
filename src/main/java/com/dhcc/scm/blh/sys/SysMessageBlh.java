/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.sys;

import javax.annotation.Resource;

import com.dhcc.framework.app.service.CommonService;
import org.springframework.stereotype.Component;
import org.apache.commons.lang.StringUtils;
import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.sys.SysMessageDto;
import com.dhcc.scm.service.sys.SysMessageService;
import com.dhcc.scm.entity.sys.SysMessage;

@Component
public class SysMessageBlh extends AbstractBaseBlh {


	@Resource
	private SysMessageService sysMessageService;
	
	@Resource
	private CommonService commonService;
	
	public SysMessageBlh() {
		
	}
	
	public void listId(BusinessRequest res){
    SysMessageDto dto = super.getDto(SysMessageDto.class, res);
		
		//调用对应的service方法
		sysMessageService.listId(dto);
		
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
	
		SysMessageDto dto = super.getDto(SysMessageDto.class, res);
		
		//调用对应的service方法
		sysMessageService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		SysMessageDto dto = super.getDto(SysMessageDto.class, res);
		
		/*commonService.saveOrUpdate(dto.getSysMessage());*/
		Long id = sysMessageService.saveOrUpdate(dto);
		
		dto.setSysMessageId(id);
	
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		SysMessageDto dto = super.getDto(SysMessageDto.class, res);
		
		//调用对应的service方法
		commonService.delete(commonService.get(SysMessage.class,dto.getSysMessage().getMessageId()));
	}

	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		SysMessageDto dto = super.getDto(SysMessageDto.class, res);
		
		//调用对应的service方法
		dto.setSysMessage(commonService.get(SysMessage.class,dto.getSysMessage().getMessageId()));
		
		
	}
	
}
