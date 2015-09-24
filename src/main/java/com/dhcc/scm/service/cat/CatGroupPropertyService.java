/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.cat;

import com.dhcc.scm.dto.cat.CatGroupPropertyDto;
import com.dhcc.scm.entity.cat.CatGroupProperty;

public interface CatGroupPropertyService {

	public void list(CatGroupPropertyDto dto);
	
	public void save(CatGroupPropertyDto dto);
	
	public void delete(CatGroupPropertyDto dto);
	
	public void update(CatGroupPropertyDto dto);
	
	public CatGroupProperty findById(CatGroupPropertyDto dto);
	

}
