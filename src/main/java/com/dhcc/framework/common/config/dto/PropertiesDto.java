package com.dhcc.framework.common.config.dto;

import com.dhcc.framework.common.config.vo.ConfItem;
import com.dhcc.framework.transmission.dto.BaseDto;

/**
 * @author daichao
 *
 */
public class PropertiesDto extends BaseDto {

	private String actionName;
	private ConfItem confItem;

	public ConfItem getConfItem() {
		return confItem;
	}

	public void setConfItem(ConfItem confItem) {
		this.confItem = confItem;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}
	
}
