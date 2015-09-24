/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.cat;

import com.dhcc.scm.entity.cat.CatProperty;
import com.dhcc.framework.transmission.dto.BaseDto;

public class CatPropertyDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CatProperty catProperty;

	
	public CatProperty getCatProperty() {
		return catProperty;
	}

	
	public void setCatProperty(CatProperty catProperty) {
		this.catProperty = catProperty;
	}
	
}
