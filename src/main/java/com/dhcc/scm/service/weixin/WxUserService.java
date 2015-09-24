/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.weixin;

import me.chanjar.weixin.common.exception.WxErrorException;

import com.dhcc.scm.dto.weixin.WxUserDto;
import com.dhcc.scm.entity.weixin.WxUser;

public interface WxUserService {

	public void list(WxUserDto dto);
	
	public void save(WxUserDto dto)throws WxErrorException;
	
	public void delete(WxUserDto dto)throws WxErrorException;
	
	public void update(WxUserDto dto)throws WxErrorException;
	
	public WxUser findById(WxUserDto dto);
	

}
