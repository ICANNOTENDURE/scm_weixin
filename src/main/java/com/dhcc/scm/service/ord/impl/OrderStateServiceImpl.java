/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ord.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.dao.ord.OrderStateDao;
import com.dhcc.scm.dto.ord.OrderStateDto;
import com.dhcc.scm.entity.ord.State;
import com.dhcc.scm.entity.vo.ord.OrderExeStateVo;
import com.dhcc.scm.entity.vo.ws.OrderWebVo;
import com.dhcc.scm.service.ord.OrderStateService;

@Service("orderStateService")
public class OrderStateServiceImpl implements OrderStateService {

	@Resource
	private OrderStateDao orderStateDao;
	@Resource
	private CommonService commonService;



	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderStateService#listOrderState(com.dhcc.pms.dto.ord.OrderStateDto)
	 */
	@Override
	public void listOrderState(OrderStateDto dto) {
		// TODO Auto-generated method stub
		orderStateDao.listOrderState(dto);
	}



	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderStateService#listOrderExeState(com.dhcc.pms.dto.ord.OrderStateDto)
	 */
	@Override
	public List<OrderExeStateVo> listOrderExeState(OrderStateDto dto) {
		// TODO Auto-generated method stub
		return orderStateDao.listOrderExeState(dto);
	}



	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderStateService#listOrderItm(com.dhcc.pms.dto.ord.OrderStateDto)
	 */
	@Override
	public void listOrderItm(OrderStateDto dto) {
		// TODO Auto-generated method stub
		orderStateDao.listOrderItm(dto);
	}



	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderStateService#getComboList()
	 */
	@Override
	public List<State> getComboList() {
		// TODO Auto-generated method stub
		return orderStateDao.getComboList();
	}



	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ord.OrderStateService#listOrderWS(com.dhcc.pms.dto.ord.OrderStateDto)
	 */
	@Override
	public void listOrderWS(OrderStateDto dto) {
		// TODO Auto-generated method stub
		orderStateDao.listOrdWS(dto);
		for(OrderWebVo orderWSVo:(List<OrderWebVo>)dto.getOrdWebVo().getOrderWebVos()){
			if(orderWSVo.getRecloc().contains("西院")){
				orderWSVo.setHopname(orderWSVo.getHopname()+"(西院)");
			}
		}
	}	
	/*	
	 * @see com.dhcc.pms.service.ord.OrderStateService#listOrderStateAndroid(com.dhcc.pms.dto.ord.OrderStateDto)
	 */
//	@Override
//	public List<OrderStateAndroidVo> listOrderStateAndroid(OrderStateDto dto) {
//		
//		return orderStateDao.listOrderStateAndroid(dto);
//	}



	@Override
	public void listVenOrd(OrderStateDto dto) {
		// TODO Auto-generated method stub
		orderStateDao.listVenOrd(dto);
	}



	@Override
	public void accpOrder(OrderStateDto dto) {
		// TODO Auto-generated method stub
		orderStateDao.accpOrder(dto);
	}



	@Override
	public void listVenSend(OrderStateDto dto) {
		// TODO Auto-generated method stub
		orderStateDao.listVenSend(dto);
	}



	@Override
	public void saveOrderSubCmp(OrderStateDto dto) {
		// TODO Auto-generated method stub
		orderStateDao.saveOrderSubCmp(dto);
	}


}
