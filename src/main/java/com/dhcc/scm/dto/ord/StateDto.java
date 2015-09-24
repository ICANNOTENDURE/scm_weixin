/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ord;

import com.dhcc.scm.entity.ord.State;
import com.dhcc.framework.transmission.dto.BaseDto;

public class StateDto extends BaseDto {

	private State state;

	
	public State getState() {
		return state;
	}

	
	public void setState(State state) {
		this.state = state;
	}
	
}
