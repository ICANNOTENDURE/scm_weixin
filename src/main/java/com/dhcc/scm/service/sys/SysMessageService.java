/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.sys;

import com.dhcc.scm.dto.sys.SysMessageDto;
import com.dhcc.scm.entity.sys.SysMessage;

public interface SysMessageService {

	public void list(SysMessageDto dto);
	
	public void save(SysMessageDto dto);
	
	public Long saveOrUpdate(SysMessageDto dto); //ggm

	/*public void delete(SysMessageDto dto);*/
	
	public void update(SysMessageDto dto);
	
	public void listId(SysMessageDto dto);
	
	public SysMessage findById(SysMessageDto dto);
	

}
