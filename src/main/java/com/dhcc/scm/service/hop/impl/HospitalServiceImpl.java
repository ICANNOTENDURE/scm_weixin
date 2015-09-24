/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.hop.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;

import javax.annotation.Resource;

import com.dhcc.scm.dao.hop.HospitalDao;
import com.dhcc.scm.dto.hop.HospitalDto;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.service.hop.HospitalService;

@Service("hospitalService")
public class HospitalServiceImpl implements HospitalService {

	@Resource
	private HospitalDao hospitalDao;
	@Resource
	private CommonService commonService;

	public void list(HospitalDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		hospitalDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(HospitalDto dto){
	
		hospitalDao.save(dto.getHospital());
	}
	
	public void delete(HospitalDto dto){
	
		hospitalDao.delete(dto.getHospital());
	}
	
	public void update(HospitalDto dto){
	
		hospitalDao.update(dto.getHospital());
	}
	
	public Hospital findById(HospitalDto dto){
	
		dto.setHospital(hospitalDao.findById(dto.getHospital()));
		return dto.getHospital();
	}


	public List<Hospital> getHospInfo(HospitalDto dto) {
		return hospitalDao.getHospInfo(dto.getHospital());		
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HospitalService#getHospitalByName(java.lang.String)
	 */
	@Override
	public Hospital getHospitalByName(String name) {
		// TODO Auto-generated method stub
		return hospitalDao.getHospitalByName(name);
	}

}
