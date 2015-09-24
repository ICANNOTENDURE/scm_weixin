/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.hop;

import com.dhcc.scm.dto.hop.HopIncNewsDto;
import com.dhcc.scm.entity.hop.HopIncNews;

public interface HopIncNewsService {

	public void list(HopIncNewsDto dto);
	
	public void save(HopIncNewsDto dto);
	
	public void delete(HopIncNewsDto dto);
	
	public void update(HopIncNewsDto dto);
	
	public HopIncNews findById(HopIncNewsDto dto);
	

}
