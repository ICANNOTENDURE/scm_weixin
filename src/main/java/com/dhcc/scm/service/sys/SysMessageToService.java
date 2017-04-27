/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.sys;

import com.dhcc.scm.dto.sys.SysMessageDto;
import com.dhcc.scm.dto.sys.SysMessageToDto;
import com.dhcc.scm.entity.sys.SysMessageTo;

public interface SysMessageToService {

	public void list(SysMessageToDto dto);
	
	public void save(SysMessageToDto dto);
	
	public void delete(SysMessageToDto dto);
	
	public void update(SysMessageToDto dto);
	
	public void listId(SysMessageToDto dto);
	
	public SysMessageTo findById(SysMessageToDto dto);
	

}
