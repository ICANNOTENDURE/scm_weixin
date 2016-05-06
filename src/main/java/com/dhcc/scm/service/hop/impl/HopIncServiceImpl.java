/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.hop.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.hop.HopIncDao;
import com.dhcc.scm.dto.hop.HopIncDto;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.vo.combo.ComboxVo;
import com.dhcc.scm.entity.vo.hop.HopIncVo;
import com.dhcc.scm.service.hop.HopIncService;

@Service("hopIncService")
public class HopIncServiceImpl implements HopIncService {

	@Resource
	private HopIncDao hopIncDao;
	@Resource
	private CommonService commonService;

	public void list(HopIncDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		hopIncDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(HopIncDto dto){
	
		hopIncDao.save(dto.getHopInc());
	}
	
	public void delete(HopIncDto dto){
	
		hopIncDao.delete(dto.getHopInc());
	}
	
	public void update(HopIncDto dto){
	
		hopIncDao.update(dto.getHopInc());
	}
	
	public HopInc findById(HopIncDto dto){
	
		dto.setHopInc(hopIncDao.findById(dto.getHopInc()));
		return dto.getHopInc();
	}

	
	public List<HopIncVo> getIncInfo(HopIncDto dto) {
		return hopIncDao.getIncInfo(dto.getHopIncVos());
	}

	
	public void getListInfo(HopIncDto dto) {
		// 
		hopIncDao.getListInfo(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopIncService#saveInc(com.dhcc.pms.dto.hop.HopIncDto)
	 */
	@Override
	public void saveInc(HopIncDto dto) {
		// TODO Auto-generated method stub
		hopIncDao.saveInc(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopIncService#getIncIdByName(java.lang.String)
	 */
	@Override
	public HopInc getIncIdByName(String name) {
		// TODO Auto-generated method stub
		return hopIncDao.getIncIdByName(name);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.hop.HopIncService#getHopIncByCode(java.lang.String, java.lang.Long)
	 */
	@Override
	public Long getHopIncByCode(String code, Long hopId) {
		// TODO Auto-generated method stub
		return hopIncDao.getHopIncByCode(code, hopId);
	}
	@Override
	public List<SubCatGroup> getSubCatInfo(HopIncDto dto) {
		return hopIncDao.getSubCatInfo(dto);

	}

	@Override
	public List<ComboxVo> findHopIncComboxVos(HopIncDto dto) {
		// TODO Auto-generated method stub
		return hopIncDao.findHopIncComboxVos(dto);
	}

	@Override
	public HopInc getHopIncByBarCode(String code, Long hospid) {
		// TODO Auto-generated method stub
		String[] propertyNames={"incHospid","incBarCode"};
		Object[] values={hospid,code};
		List<HopInc> hopIncs=hopIncDao.findByProperties(HopInc.class, propertyNames, values);
		if(hopIncs.size()==0){
			return null;
		}
		return hopIncs.get(0);
	}

	@Override
	public void listHopIncAudit(HopIncDto dto) {
		// TODO Auto-generated method stub
		hopIncDao.listHopIncAudit(dto);
	}

}
