/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.cat;



import com.dhcc.scm.dto.cat.SubCatGroupDto;
import com.dhcc.scm.entity.cat.SubCatGroup;

public interface SubCatGroupService {

	public void list(SubCatGroupDto dto);
	
	public void getListSubInfo(SubCatGroupDto dto);
	
	public SubCatGroup findById(SubCatGroupDto dto);
	
	public void save(SubCatGroupDto dto);
	
	public void delete(SubCatGroupDto dto);
	
	public void update(SubCatGroupDto dto);
	
}
