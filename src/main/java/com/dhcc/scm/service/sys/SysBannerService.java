/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.sys;

import com.dhcc.scm.dto.sys.SysBannerDto;
import com.dhcc.scm.entity.sys.SysBanner;

public interface SysBannerService {

	public void list(SysBannerDto dto);
	
	public void save(SysBannerDto dto);
	
	public void delete(SysBannerDto dto);
	
	public void update(SysBannerDto dto);
	
	public SysBanner findById(SysBannerDto dto);
	

}
