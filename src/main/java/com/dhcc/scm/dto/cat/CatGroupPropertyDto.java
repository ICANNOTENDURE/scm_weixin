/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.cat;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.cat.CatGroupProperty;
import com.dhcc.scm.entity.cat.Group;

public class CatGroupPropertyDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CatGroupProperty catGroupProperty;
	
	private CatGroup catGroupObj;
	
	private Group groupObj;
	
	
	private Long subcatgroup;
	
	private Long catgroup;
	
	private Long group;
	
	private Long veninc;
	
	
	
	


	public CatGroup getCatGroupObj() {
		return catGroupObj;
	}


	public void setCatGroupObj(CatGroup catGroupObj) {
		this.catGroupObj = catGroupObj;
	}


	public Group getGroupObj() {
		return groupObj;
	}


	public void setGroupObj(Group groupObj) {
		this.groupObj = groupObj;
	}


	public Long getVeninc() {
		return veninc;
	}


	public void setVeninc(Long veninc) {
		this.veninc = veninc;
	}


	public Long getSubcatgroup() {
		return subcatgroup;
	}


	public void setSubcatgroup(Long subcatgroup) {
		this.subcatgroup = subcatgroup;
	}


	public Long getCatgroup() {
		return catgroup;
	}


	public void setCatgroup(Long catgroup) {
		this.catgroup = catgroup;
	}


	public Long getGroup() {
		return group;
	}


	public void setGroup(Long group) {
		this.group = group;
	}


	public CatGroupProperty getCatGroupProperty() {
		return catGroupProperty;
	}

	
	public void setCatGroupProperty(CatGroupProperty catGroupProperty) {
		this.catGroupProperty = catGroupProperty;
	}
	
}
