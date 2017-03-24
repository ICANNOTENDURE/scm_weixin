/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ord;

import java.io.UnsupportedEncodingException;

import com.dhcc.scm.dto.ord.PutShippSumDto;

public interface PutShippSumService {

	public void list(PutShippSumDto dto);
	
	public void listDeliverItm(PutShippSumDto dto) throws UnsupportedEncodingException;
}
