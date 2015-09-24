/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.sys;

import javax.annotation.Resource;

import com.dhcc.framework.app.service.CommonService;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.sys.SysAppParamDto;
import com.dhcc.scm.entity.sys.SysAppParam;
import com.dhcc.scm.service.sys.SysAppParamService;


@Component
public class SysAppParamBlh extends AbstractBaseBlh {


	@Resource
	private SysAppParamService sysAppParamService;
	
	@Resource
	private CommonService commonService;
	
	public SysAppParamBlh() {
		
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
	
		SysAppParamDto dto = super.getDto(SysAppParamDto.class, res);
		
		//调用对应的service方法
		sysAppParamService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		SysAppParamDto dto = super.getDto(SysAppParamDto.class, res);
		
		//调用对应的service方法
		//sysAppParamService.save(dto);
		commonService.saveOrUpdate(dto.getSysAppParam());
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		SysAppParamDto dto = super.getDto(SysAppParamDto.class, res);
		
		//调用对应的service方法
		sysAppParamService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		SysAppParamDto dto = super.getDto(SysAppParamDto.class, res);
		
		//调用对应的service方法
		sysAppParamService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		SysAppParamDto dto = super.getDto(SysAppParamDto.class, res);
		dto.setSysAppParam(commonService.get(SysAppParam.class, dto.getSysAppParam().getAppId()));
		
	}
	
}
