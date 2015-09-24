/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.cat;

import com.dhcc.scm.dto.cat.CatPropertyDto;
import com.dhcc.scm.entity.cat.CatProperty;

public interface CatPropertyService {

	public void list(CatPropertyDto dto);
	
	public void save(CatPropertyDto dto);
	
	public void delete(CatPropertyDto dto);
	
	public void update(CatPropertyDto dto);
	
	public CatProperty findById(CatPropertyDto dto);
	

}
