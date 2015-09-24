/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.hop;

import com.dhcc.scm.dto.hop.HopIncLocDto;

public interface HopIncLocService {

	public void list(HopIncLocDto dto);
	
	public void save(HopIncLocDto dto);
	
	public void delete(HopIncLocDto dto);
	
	public void update(HopIncLocDto dto);

	

}
