/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.weixin;

import me.chanjar.weixin.common.exception.WxErrorException;

import com.dhcc.scm.dto.weixin.WxDepartDto;
import com.dhcc.scm.entity.weixin.WxDepart;

public interface WxDepartService {

	public void list(WxDepartDto dto);
	
	public void save(WxDepartDto dto)throws WxErrorException;
	
	public void delete(WxDepartDto dto)throws WxErrorException;
	
	public void update(WxDepartDto dto)throws WxErrorException;
	
	public WxDepart findById(WxDepartDto dto);
}
