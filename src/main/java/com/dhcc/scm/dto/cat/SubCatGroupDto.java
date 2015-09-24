/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.cat;

import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.entity.vo.cat.SubCatGroupVO;

public class SubCatGroupDto extends BaseDto {

	private SubCatGroup subCatGroup;
	
	/**
	 * @param subCatGroup the subCatGroup to set
	 */
	public void setSubCatGroup(SubCatGroup subCatGroup) {
		this.subCatGroup = subCatGroup;
	}

	private List<SubCatGroupVO> SubCatGroupVos;

	
	/**
	 * @return the subCatGroupVos
	 */
	public List<SubCatGroupVO> getSubCatGroupVos() {
		return SubCatGroupVos;
	}


	/**
	 * @param subCatGroupVos the subCatGroupVos to set
	 */
	public void setSubCatGroupVos(List<SubCatGroupVO> subCatGroupVos) {
		SubCatGroupVos = subCatGroupVos;
	}


	/**
	 * @return the subCatGroup
	 */
	public SubCatGroup getSubCatGroup() {
		return subCatGroup;
	}
	
}
