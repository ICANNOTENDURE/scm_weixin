/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.sys;

import java.util.List;

import com.dhcc.scm.dto.sys.SysImpModelDto;
import com.dhcc.scm.entity.sys.ImpModel;

public interface SysImpModelService {

	public void list(SysImpModelDto dto);
	
	public void save(SysImpModelDto dto);
	
	public void delete(SysImpModelDto dto);
	
	public void update(SysImpModelDto dto);
	
	public ImpModel findById(SysImpModelDto dto);
	
	public List<ImpModel> getModelList(SysImpModelDto dto);
	
	/**
	 * 
	* @Title: SysImpModelService.java
	* @Description: TODO(保存excel顺序)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月3日 上午10:07:18
	* @version V1.0
	 */
	public void saveModel(SysImpModelDto dto);
}
