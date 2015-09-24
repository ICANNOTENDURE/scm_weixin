/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.hop.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.dao.hop.HopIncNewsDao;
import com.dhcc.scm.dto.hop.HopIncNewsDto;
import com.dhcc.scm.entity.hop.HopIncNews;
import com.dhcc.scm.service.hop.HopIncNewsService;

@Service("hopIncNewsService")
public class HopIncNewsServiceImpl implements HopIncNewsService {

	@Resource
	private HopIncNewsDao hopIncNewsDao;
	@Resource
	private CommonService commonService;

	public void list(HopIncNewsDto dto){
		hopIncNewsDao.list(dto);
	}
	
	public void save(HopIncNewsDto dto){
	
		hopIncNewsDao.save(dto.getHopIncNews());
	}
	
	public void delete(HopIncNewsDto dto){
	
		hopIncNewsDao.delete(dto.getHopIncNews());
	}
	
	public void update(HopIncNewsDto dto){
	
		hopIncNewsDao.update(dto.getHopIncNews());
	}
	
	public HopIncNews findById(HopIncNewsDto dto){
	
		dto.setHopIncNews(hopIncNewsDao.findById(dto.getHopIncNews()));
		return dto.getHopIncNews();
	}

}
