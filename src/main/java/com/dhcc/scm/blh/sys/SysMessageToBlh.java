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
import com.dhcc.scm.dto.sys.SysMessageToDto;
import com.dhcc.scm.service.sys.SysMessageToService;
import com.dhcc.scm.entity.sys.SysMessageTo;

@Component
public class SysMessageToBlh extends AbstractBaseBlh {


	@Resource
	private SysMessageToService sysMessageToService;
	
	@Resource
	private CommonService commonService;
	
	public SysMessageToBlh() {
		
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
	
		SysMessageToDto dto = super.getDto(SysMessageToDto.class, res);
		
		//调用对应的service方法
		sysMessageToService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		SysMessageToDto dto = super.getDto(SysMessageToDto.class, res);
		
		commonService.saveOrUpdate(dto.getSysMessageTo());
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		SysMessageToDto dto = super.getDto(SysMessageToDto.class, res);
		
		//调用对应的service方法
		commonService.delete(commonService.get(SysMessageTo.class,dto.getSysMessageTo().getToId()));
	}
	public void listId(BusinessRequest res){
	    SysMessageToDto dto = super.getDto(SysMessageToDto.class, res);
			
			//调用对应的service方法
			sysMessageToService.listId(dto);
			
		}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		SysMessageToDto dto = super.getDto(SysMessageToDto.class, res);
		
		//调用对应的service方法
		dto.setSysMessageTo(commonService.get(SysMessageTo.class,dto.getSysMessageTo().getToId()));
		
		
	}
	
}
