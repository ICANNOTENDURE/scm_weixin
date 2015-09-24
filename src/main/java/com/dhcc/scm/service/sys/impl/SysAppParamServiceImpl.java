/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.sys.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.sys.SysAppParamDao;
import com.dhcc.scm.dto.sys.SysAppParamDto;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.sys.SysAppParam;
import com.dhcc.scm.service.sys.SysAppParamService;

@Service("sysAppParamService")
public class SysAppParamServiceImpl implements SysAppParamService {

	@Resource
	private SysAppParamDao sysAppParamDao;
	@Resource
	private CommonService commonService;

	public void list(SysAppParamDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		sysAppParamDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
		for(Object o:dto.getPageModel().getPageData()){
			SysAppParam sysAppParam=(SysAppParam) o;
			if(sysAppParam.getAppHopId()!=null){
				Hospital hop=commonService.get(Hospital.class, sysAppParam.getAppHopId());
				if(hop!=null){
					sysAppParam.setHopName(hop.getHospitalName());
				}
			}
			
		}
	}
	
	public void save(SysAppParamDto dto){
	
		sysAppParamDao.save(dto.getSysAppParam());
	}
	
	public void delete(SysAppParamDto dto){
	
		sysAppParamDao.delete(dto.getSysAppParam());
	}
	
	public void update(SysAppParamDto dto){
	
		sysAppParamDao.update(dto.getSysAppParam());
	}
	
	public SysAppParam findById(SysAppParamDto dto){
	
		dto.setSysAppParam(sysAppParamDao.findById(dto.getSysAppParam()));
		return dto.getSysAppParam();
	}

	@Override
	public Long getOrderAudit(Long par) {
		// TODO Auto-generated method stub
		return sysAppParamDao.getOrderAudit(par);
	}

}
