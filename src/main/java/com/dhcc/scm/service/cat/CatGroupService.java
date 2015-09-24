/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.cat;


import com.dhcc.scm.dto.cat.CatGroupDto;
import com.dhcc.scm.entity.cat.CatGroup;

public interface CatGroupService {

	public void list(CatGroupDto dto);
	
	public void save(CatGroupDto dto);
	
	public void delete(CatGroupDto dto);
	
	public void update(CatGroupDto dto);
	
	public CatGroup findById(CatGroupDto dto);
	
	public void listGroup(CatGroupDto dto);
	
	public void listCatGroup(CatGroupDto dto);
	
	public void listGroupComb(CatGroupDto dto);
}
