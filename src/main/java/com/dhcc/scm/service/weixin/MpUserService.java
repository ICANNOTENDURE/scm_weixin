/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.weixin;

import com.dhcc.scm.dto.weixin.MpUserDto;
import com.dhcc.scm.entity.weixin.MpUser;

public interface MpUserService {

	public void list(MpUserDto dto);
	
	public void save(MpUserDto dto);
	
	public void delete(MpUserDto dto);
	
	public void update(MpUserDto dto);
	
	public MpUser findById(MpUserDto dto);
	

}
