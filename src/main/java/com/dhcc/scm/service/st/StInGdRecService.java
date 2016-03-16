/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.st;

import com.dhcc.scm.dto.st.StInGdRecDto;
import com.dhcc.scm.dto.weixin.MpInGdRecDto;

public interface StInGdRecService {


	
	public void mpInGdRec(StInGdRecDto dto);
	
	
	public void listInGdRec(MpInGdRecDto dto);

}
