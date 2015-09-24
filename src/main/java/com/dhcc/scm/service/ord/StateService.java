/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ord;

import com.dhcc.scm.dto.ord.StateDto;
import com.dhcc.scm.entity.ord.State;

public interface StateService {

	public void list(StateDto dto);
	
	public void save(StateDto dto);
	
	public void delete(StateDto dto);
	
	public void update(StateDto dto);
	
	public State findById(StateDto dto);
	

}
