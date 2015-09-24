/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ven.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.hop.HopIncDao;
import com.dhcc.scm.dao.ven.VenIncDao;
import com.dhcc.scm.dto.ven.VenIncDto;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.service.ven.VenIncService;

@Service("venIncService")
public class VenIncServiceImpl implements VenIncService {

	@Resource
	private VenIncDao venIncDao;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private HopIncDao hopIncDao;
	
	public void list(VenIncDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		venIncDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}
	
	public void save(VenIncDto dto){
	
		venIncDao.save(dto.getVenInc());
	}
	
	public void delete(VenIncDto dto){
	
		venIncDao.delete(dto.getVenInc());
	}
	
	public void update(VenIncDto dto){
	
		venIncDao.update(dto.getVenInc());
	}
	
	public VenInc findById(VenIncDto dto){
	
		dto.setVenInc(venIncDao.findById(dto.getVenInc()));
		return dto.getVenInc();
	}


	public List<VenInc> getIncInfo(VenIncDto dto) {
		
		return venIncDao.getIncInfo(dto.getVenInc());
	}

	
	public void getListInfo(VenIncDto dto) {
		//
		PagerModel pagerModel = dto.getPageModel();
		venIncDao.getListInfo(pagerModel,dto.getShowVenIncVos(),dto.getVenInc());
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenIncService#listContrantInc(com.dhcc.pms.dto.ven.VenIncContranstDto)
	 */
	@Override
	public void listContrantInc(VenIncDto dto) {
		// TODO Auto-generated method stub
		venIncDao.listContrantInc(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenIncService#saveContranst(com.dhcc.pms.dto.ven.VenIncDto)
	 */
	@Override
	public void saveContranst(VenIncDto dto) {
		// TODO Auto-generated method stub
		venIncDao.saveContranst(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenIncService#listVenContranst(com.dhcc.pms.dto.ven.VenIncDto)
	 */
	@Override
	public void listVenContranst(VenIncDto dto) {
		// TODO Auto-generated method stub
		venIncDao.listVenContranst(dto);
		
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenIncService#exportVenInc(com.dhcc.pms.dto.ven.VenIncDto)
	 */
	@Override
	public void exportVenInc(VenIncDto dto) {
		// TODO Auto-generated method stub
		venIncDao.exportVenInc(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenIncService#getVenIncByCode(java.lang.String, java.lang.Long)
	 */
	@Override
	public Long getVenIncByCode(String code, Long venId) {
		// TODO Auto-generated method stub
		return venIncDao.getVenIncByCode(code,venId);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenIncService#getHopIncByVenIncCode(java.lang.String)
	 */
	@Override
	public Long getHopIncByVenIncCode(String code) {
		// TODO Auto-generated method stub
		return hopIncDao.getVenIncByCode(code);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenIncService#saveVenHopIncList(java.util.List)
	 */
	@Override
	public void saveVenHopIncList(List<VenHopInc> hopIncs) {
		// TODO Auto-generated method stub
		venIncDao.saveVenHopIncList(hopIncs);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenIncService#getFacByhopInc(long, java.lang.Long)
	 */
	@Override
	public float getFacByhopInc(long hopInc, Long vendorId) {
		// TODO Auto-generated method stub
		return venIncDao.getFacByhopInc(hopInc, vendorId);
	}

}
