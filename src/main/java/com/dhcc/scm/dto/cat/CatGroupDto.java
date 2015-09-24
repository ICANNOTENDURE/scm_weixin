/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.cat;

import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.cat.CatProperty;
import com.dhcc.scm.entity.cat.Group;

public class CatGroupDto extends BaseDto {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7706201279988769738L;

	private Group group;
	
	private CatGroup catGroup;
	
	private List<Group> groups;
	
	private CatProperty catProperty;
	
	private Long parrefId;
	
	
	


	public Long getParrefId() {
		return parrefId;
	}


	public void setParrefId(Long parrefId) {
		this.parrefId = parrefId;
	}


	public CatProperty getCatProperty() {
		return catProperty;
	}


	public void setCatProperty(CatProperty catProperty) {
		this.catProperty = catProperty;
	}


	public List<Group> getGroups() {
		return groups;
	}


	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}


	public Group getGroup() {
		return group;
	}


	public void setGroup(Group group) {
		this.group = group;
	}


	public CatGroup getCatGroup() {
		return catGroup;
	}

	
	public void setCatGroup(CatGroup catGroup) {
		this.catGroup = catGroup;
	}
	
}
