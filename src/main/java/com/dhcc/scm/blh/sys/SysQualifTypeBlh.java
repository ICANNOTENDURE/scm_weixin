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
import com.dhcc.scm.dto.sys.SysQualifTypeDto;
import com.dhcc.scm.entity.sys.SysQualifType;
import com.dhcc.scm.service.cat.CatGroupService;
import com.dhcc.scm.service.sys.SysQualifTypeService;

@Component
public class SysQualifTypeBlh extends AbstractBaseBlh {


	@Resource
	private SysQualifTypeService sysQualifTypeService;
	
	@Resource
	private CommonService commonService;
	// add hxy
	@Resource
	private CatGroupService catGroupService;
	
	public SysQualifTypeBlh() {
		
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
	
		SysQualifTypeDto dto = super.getDto(SysQualifTypeDto.class, res);
		
		//调用对应的service方法
		sysQualifTypeService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		SysQualifTypeDto dto = super.getDto(SysQualifTypeDto.class, res);
		
		//调用对应的service方法
//		if(StringUtils.isEmpty(dto.getSysQualifType().getQualifTypeId())){
//			dto.getSysQualifType().setQualifTypeId(null);
//		}
		commonService.saveOrUpdate(dto.getSysQualifType());
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		SysQualifTypeDto dto = super.getDto(SysQualifTypeDto.class, res);
		
		//调用对应的service方法
//		commonService.Delete(SysQualifType.class, dto.getSysQualifType().getQualifTypeId());
//		sysQualifTypeService.delete(dto);
		commonService.delete(commonService.get(SysQualifType.class, dto.getSysQualifType().getQualifTypeId()));
	}
	
	//更新
		public void update(BusinessRequest res) {
		
			SysQualifTypeDto dto = super.getDto(SysQualifTypeDto.class, res);
			
			//调用对应的service方法
			sysQualifTypeService.update(dto);
		}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		SysQualifTypeDto dto = super.getDto(SysQualifTypeDto.class, res);
		
		//调用对应的service方法
		sysQualifTypeService.findById(dto);
		
	}
	
	/**
	 * 
	* @Title: getCatInfo 
	* @Description: TODO(查询所有商品类组) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @author hxy  
	* @date 2016/3/4 14:37
	 */
	public void getCatInfo(BusinessRequest res) {
		SysQualifTypeDto dto = super.getDto(SysQualifTypeDto.class, res);
		super.writeJSON(sysQualifTypeService.getCatInfo(dto));
	}
}
