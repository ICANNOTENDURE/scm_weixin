/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.st;

import com.dhcc.scm.dto.st.StInGdRecDto;
import com.dhcc.scm.entity.st.StInGdRec;
import com.dhcc.scm.entity.vo.ws.OperateResult;

public interface StInGdRecService {

	public void list(StInGdRecDto dto);
	
	public void save(StInGdRecDto dto);
	
	public void delete(StInGdRecDto dto);
	
	public void update(StInGdRecDto dto);
	
	public StInGdRec findById(StInGdRecDto dto);
	
	public void mpInGdRec(StInGdRecDto dto);

}
