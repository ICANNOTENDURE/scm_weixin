/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.sys;

import java.util.List;

import com.dhcc.scm.dto.sys.SysQualifTypeDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.sys.SysQualifType;

public interface SysQualifTypeService {

	public void list(SysQualifTypeDto dto);
	
	public void save(SysQualifTypeDto dto);
	
	public void delete(SysQualifTypeDto dto);
	
	public void update(SysQualifTypeDto dto);
	
	public SysQualifType findById(SysQualifTypeDto dto);
	/**
	 * 查询药品类组 add hxy
	 */
	public List<CatGroup> getCatInfo(SysQualifTypeDto dto); 

	

}
