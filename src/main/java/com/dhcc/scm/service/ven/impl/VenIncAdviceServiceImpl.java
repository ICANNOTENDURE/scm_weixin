/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ven.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.ven.VenIncAdviceDao;
import com.dhcc.scm.dto.ven.VenIncAdviceDto;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.ven.VenIncAdvice;
import com.dhcc.scm.entity.vo.ven.ReplayVenIncVo;
import com.dhcc.scm.service.ven.VenIncAdviceService;

@Service("venIncAdviceService")
public class VenIncAdviceServiceImpl implements VenIncAdviceService {

	@Resource
	private VenIncAdviceDao venIncAdviceDao;
	@Resource
	private CommonService commonService;

	public void list(VenIncAdviceDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		venIncAdviceDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(VenIncAdviceDto dto){
	
		venIncAdviceDao.save(dto.getVenIncAdvice());
	}
	
	public void delete(VenIncAdviceDto dto){
	
		venIncAdviceDao.delete(dto.getVenIncAdvice());
	}
	
	public void update(VenIncAdviceDto dto){
	
		venIncAdviceDao.update(dto.getVenIncAdvice());
	}
	
	public VenIncAdvice findById(VenIncAdviceDto dto){
	
		dto.setVenIncAdvice(venIncAdviceDao.findById(dto.getVenIncAdvice()));
		return dto.getVenIncAdvice();
	}

	@Override
	public void listVenIncAdvice(VenIncAdviceDto dto) {
		// TODO Auto-generated method stub
		venIncAdviceDao.listVenIncAdvice(dto);
	}

	@Override
	public int getVenIncAdviceNum(Date date) {
		// TODO Auto-generated method stub
		return venIncAdviceDao.getVenIncAdviceNum(date);
	}

	@Override
	public void getVenIncAdviceList(VenIncAdviceDto dto) {
		// TODO Auto-generated method stub
		venIncAdviceDao.getVenIncAdviceList(dto);
		for(ReplayVenIncVo replayVenIncVo:dto.getReplayVenIncVos()){
			VenInc venInc=commonService.get(VenInc.class, replayVenIncVo.getInc());
			replayVenIncVo.setIncname(venInc.getVenIncName());
			replayVenIncVo.setSpec(venInc.getVenIncSpec());
			replayVenIncVo.setUom(venInc.getVenIncUomname());
			replayVenIncVo.setPrice(venInc.getVenIncPrice());
		}
		dto.getPageModel().setPageData(dto.getReplayVenIncVos());
	}

	@Override
	public int getNurIncAdviceNum(VenIncAdviceDto dto) {
		// TODO Auto-generated method stub
		return venIncAdviceDao.getNurIncAdviceNum(dto);
	}

}
