/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.chart.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.dao.chart.ChartDao;
import com.dhcc.scm.dto.chart.OrdVenDistributionDto;
import com.dhcc.scm.service.chart.ChartService;

@Service("chartService")
public class ChartServiceImpl implements ChartService {

	@Resource
	private ChartDao chartDao;
	@Resource
	private CommonService commonService;
	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.chart.ChartService#listOrdVenDistribution(com.dhcc.pms.dto.chart.OrdVenDistributionDto)
	 */
	@Override
	public void listOrdVenDistribution(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.listOrdVenDistribution(dto);
	}
	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.chart.ChartService#listOrdReqQty(com.dhcc.pms.dto.chart.OrdVenDistributionDto)
	 */
	@Override
	public void listOrdReqQty(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.listOrdReqQty(dto);
	}
	@Override
	public void listEvalute(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.listEvalute(dto);
	}
	@Override
	public void listLocAmt(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.listLocAmt(dto);
	}
	@Override
	public void listLocIncPrice(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.listLocIncPrice(dto);
	}
	@Override
	public void listLocIncPriceByMon(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.listLocIncPriceByMon(dto);
	}
	@Override
	public void venSevenDayAmt(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.venSevenDayAmt(dto);
	}
	@Override
	public void venOneMonthHotSale(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.venOneMonthHotSale(dto);
	}
	@Override
	public void listLocAmtGrpByDate(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.listLocAmtGrpByDate(dto);
	}
	@Override
	public void listLocIncAmt(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.listLocIncAmt(dto);
	}
	@Override
	public void listLocGroupAmt(OrdVenDistributionDto dto) {
		// TODO Auto-generated method stub
		chartDao.listLocGroupAmt(dto);
		
	}

	
}
