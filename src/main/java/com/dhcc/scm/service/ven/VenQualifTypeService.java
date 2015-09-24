/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ven;

import com.dhcc.scm.dto.ven.VenQualifTypeDto;
import com.dhcc.scm.entity.ven.VenQualifType;

public interface VenQualifTypeService {

	public void list(VenQualifTypeDto dto);
	
	public void save(VenQualifTypeDto dto);
	
	public void delete(VenQualifTypeDto dto);
	
	public void update(VenQualifTypeDto dto);
	
	public VenQualifType findById(VenQualifTypeDto dto);
	

}
