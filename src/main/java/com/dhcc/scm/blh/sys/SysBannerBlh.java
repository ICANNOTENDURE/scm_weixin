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
import com.dhcc.scm.dto.sys.SysBannerDto;
import com.dhcc.scm.service.sys.SysBannerService;
import com.dhcc.scm.entity.sys.SysBanner;

@Component
public class SysBannerBlh extends AbstractBaseBlh {


	@Resource
	private SysBannerService sysBannerService;
	
	@Resource
	private CommonService commonService;
	
	public SysBannerBlh() {
		
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
	
		SysBannerDto dto = super.getDto(SysBannerDto.class, res);
		
		//调用对应的service方法
		sysBannerService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		SysBannerDto dto = super.getDto(SysBannerDto.class, res);
		
		commonService.saveOrUpdate(dto.getSysBanner());
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		SysBannerDto dto = super.getDto(SysBannerDto.class, res);
		
		//调用对应的service方法
		commonService.delete(commonService.get(SysBanner.class,dto.getSysBanner().getBannerId()));
	}

	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		SysBannerDto dto = super.getDto(SysBannerDto.class, res);
		
		//调用对应的service方法
		dto.setSysBanner(commonService.get(SysBanner.class,dto.getSysBanner().getBannerId()));
		
		
	}
	
}
