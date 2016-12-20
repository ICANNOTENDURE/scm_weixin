/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ven.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.dao.ven.VenStatisticsDao;
import com.dhcc.scm.dto.ven.VenStatisticsDto;
import com.dhcc.scm.service.ven.VenStatisticsService;

@Service("VenStatisticsService")
public class VenStatisticsServiceImpl implements VenStatisticsService {

	@Resource
	private VenStatisticsDao venStatisticsDao;
	@Resource
	private CommonService commonService;

	public void list(VenStatisticsDto dto){

		venStatisticsDao.listvenStatistics(dto);
	}


}
