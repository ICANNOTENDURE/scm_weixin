/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.weixin;

import com.dhcc.scm.dto.weixin.WxMessageDto;
import com.dhcc.scm.entity.weixin.WxMessage;

public interface WxMessageService {

	public void list(WxMessageDto dto);
	
	public void save(WxMessageDto dto);
	
	public void delete(WxMessageDto dto);
	
	public void update(WxMessageDto dto);
	
	public WxMessage findById(WxMessageDto dto);
	
	public void listToDoTask(WxMessageDto dto);
}
