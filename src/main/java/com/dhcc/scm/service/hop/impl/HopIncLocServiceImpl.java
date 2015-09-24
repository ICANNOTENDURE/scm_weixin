/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.hop.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.dao.hop.HopIncLocDao;
import com.dhcc.scm.dto.hop.HopIncLocDto;
import com.dhcc.scm.service.hop.HopIncLocService;

@Service("hopIncLocService")
public class HopIncLocServiceImpl implements HopIncLocService {

	@Resource
	private HopIncLocDao hopIncLocDao;
	@Resource
	private CommonService commonService;

	public void list(HopIncLocDto dto){
	
		hopIncLocDao.list(dto);
		
	}
	
	public void save(HopIncLocDto dto){
	
		hopIncLocDao.save(dto.getHopIncLoc());
	}
	
	public void delete(HopIncLocDto dto){
	
		hopIncLocDao.delete(dto.getHopIncLoc());
	}
	
	public void update(HopIncLocDto dto){
	
		hopIncLocDao.update(dto.getHopIncLoc());
	}

}
