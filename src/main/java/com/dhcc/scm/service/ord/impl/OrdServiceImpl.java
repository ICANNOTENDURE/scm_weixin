/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ord.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.ord.OrdDao;
import com.dhcc.scm.dto.ord.OrdDto;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.service.ord.OrdService;

@Service("ordService")
public class OrdServiceImpl implements OrdService {

	@Resource
	private OrdDao ordDao;
	@Resource
	private CommonService commonService;

	public void list(OrdDto dto){
	
		PagerModel pagerModel = dto.getPageModel();
		//调用DAO 拼接查询条件
		ordDao.buildPagerModelQuery(pagerModel, dto);
		//调用分页查询方法
		commonService.fillPagerModelData(pagerModel);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrdService#listOrdr(com.dhcc.pms.dto.ord.OrdDto)
	 */
	@Override
	public void listOrdr(OrdDto dto) {
		// TODO Auto-generated method stub
		ordDao.listOrd(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrdService#deleteItm(com.dhcc.pms.dto.ord.OrdDto)
	 */
	@Override
	public void deleteItm(OrdDto dto) {
		// TODO Auto-generated method stub
		ordDao.deleteItm(dto);
		
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrdService#listDelv(com.dhcc.pms.dto.ord.OrdDto)
	 */
	@Override
	public void listDelv(OrdDto dto) {
		//调用DAO 拼接查询条件
			ordDao.listDelv(dto);
			commonService.fillPagerModelData(dto.getPageModel());
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrdService#listDeliverItm(com.dhcc.pms.dto.ord.OrdDto)
	 */
	@Override
	public void listDeliverItm(OrdDto dto) {
		// TODO Auto-generated method stub
		ordDao.listDeliverItm(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrdService#deleteDelvItm(com.dhcc.pms.dto.ord.OrdDto)
	 */
	@Override
	public void deleteDelvItm(OrdDto dto) {
		// TODO Auto-generated method stub
		ordDao.deleteDelvItm(dto);
	}

	@Override
	public void impOrd(Map<String, List<OrderDetail>> venMap) {
		// TODO Auto-generated method stub
		ordDao.impOrd(venMap);
	}

	@Override
	public boolean checkHisNo(String hisno, Long hospId) {
		String[] incPropertyNames = { "hopHopId", "orderHisNo" };
		Object[] incValues = {hospId, hisno};
		List<OrderDetail> details = commonService.findByProperties(OrderDetail.class, incPropertyNames, incValues);
		if(details.size()>0){
			return true;
		}
		return false;
	}
	
	
}
