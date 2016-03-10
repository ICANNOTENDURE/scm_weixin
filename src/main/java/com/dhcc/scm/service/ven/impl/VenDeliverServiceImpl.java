/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ven.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.scm.dao.ven.VenDeliverDao;
import com.dhcc.scm.dto.ven.VenDeliverDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.State;
import com.dhcc.scm.entity.ven.VenDeliveritm;
import com.dhcc.scm.entity.vo.ven.DeliverVo;
import com.dhcc.scm.entity.vo.ws.HisInvInfoItmWeb;
import com.dhcc.scm.service.ven.VenDeliverService;

@Service("venDeliverService")
public class VenDeliverServiceImpl implements VenDeliverService {

	@Resource
	private VenDeliverDao venDeliverDao;

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#AccectOrder(java.lang.Long)
	 */
	@Override
	public void AccectOrder(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.AccectOrder(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#listDeliver(com.dhcc.pms.dto.ven.VenDeliverDto)
	 */
	@Override
	public void listDeliver(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.listDeliver(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#listDeliverItm(com.dhcc.pms.dto.ven.VenDeliverDto)
	 */
	@Override
	public void listDeliverItm(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.listDeliverItm(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#saveDeliverItm(com.dhcc.pms.dto.ven.VenDeliverDto)
	 */
	@Override
	public void saveDeliverItm(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.saveDeliverItm(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#impInv(com.dhcc.pms.dto.ven.VenDeliverDto)
	 */
	@Override
	public void impInv(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.impInv(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#impByOrder(com.dhcc.pms.dto.ven.VenDeliverDto)
	 */
	@Override
	public void impByOrder(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.impByOrder(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#deliver(com.dhcc.pms.dto.ven.VenDeliverDto)
	 */
	@Override
	public void deliver(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.deliver(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#delete(com.dhcc.pms.dto.ven.VenDeliverDto)
	 */
	@Override
	public void delete(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.delete(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#cancelComplete(com.dhcc.pms.dto.ven.VenDeliverDto)
	 */
	@Override
	public void cancelComplete(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.cancelComplete(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#getDeliveritms(com.dhcc.pms.dto.ven.VenDeliverDto)
	 */
	@Override
	public List<VenDeliveritm> getDeliveritms(Long deliverId) {
		// TODO Auto-generated method stub
		return venDeliverDao.getDeliveritms(deliverId);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#deliver(java.util.Map)
	 */
	@Override
	public void deliver(Map<String, List<VenDeliveritm>> map) {
		// TODO Auto-generated method stub
		venDeliverDao.Deliver(map);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#checkInvExist(java.lang.String, java.lang.Long)
	 */
	@Override
	public boolean checkInvExist(String inv, Long orditmId) {
		// TODO Auto-generated method stub
		return venDeliverDao.checkInvExist(inv, orditmId);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#getFac(java.lang.Long, java.lang.Long)
	 */
	@Override
	public Float getFac(Long hopId, Long venId) {
		// TODO Auto-generated method stub
		return venDeliverDao.getFac(hopId, venId);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#impByOrderItm(com.dhcc.pms.dto.ven.VenDeliverDto)
	 */
	@Override
	public void impByOrderItm(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.impByOrderItm(dto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.ven.VenDeliverService#getRecItmByInv(java.lang.Long, java.lang.Long, java.lang.String)
	 */
	@Override
	public List<HisInvInfoItmWeb> getRecItmByInv(Long hopId, Long vendorId,
			String inv) {
		// TODO Auto-generated method stub
		return venDeliverDao.getRecItmByInv(hopId, vendorId, inv);
	}

	@Override
	public void listDeliverNew(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.listDeliverNew(dto);
		String servicePassword=PropertiesBean.getInstance().getProperty("confg.serviceKey");
		for(Object o:dto.getPageModel().getPageData()){
			DeliverVo deliverVo=(DeliverVo)o;
			if(StringUtils.isNotBlank(deliverVo.getHisno())){
				List<OrderDetail> details=venDeliverDao.findByProperty(OrderDetail.class, "orderNo", deliverVo.getHisno());
				OrderDetail orderDetail=details.get(0);
				Hospital hospital=venDeliverDao.get(Hospital.class, orderDetail.getOrderHopId());
				HopCtloc ctloc=venDeliverDao.get(HopCtloc.class, orderDetail.getOrderRecLoc());
				if(orderDetail.getOrderRecDestination()!=null){
					HopCtlocDestination hopCtlocDestination=venDeliverDao.get(HopCtlocDestination.class, orderDetail.getOrderRecDestination());
					deliverVo.setDestination(hopCtlocDestination.getDestination());
				}
				List<State> states=venDeliverDao.findByProperty(State.class, "stateSeq",Long.valueOf(orderDetail.getOrderState()));
				deliverVo.setSerialno(orderDetail.getOrderId().toString()); //AESCoder.aesCbcEncrypt(orderDetail.getOrderId().toString(), servicePassword));
				deliverVo.setHopname(hospital.getHospitalName());
				deliverVo.setRecloc(ctloc.getName());
				if(states.size()>0){
					deliverVo.setStatedesc(states.get(0).getStateName());
				}
			}
		}
	}

	@Override
	public void listDeliverItmNew(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.listDeliverItmNew(dto);
	}

	@Override
	public void impInvByOrd(VenDeliverDto dto) {
		// TODO Auto-generated method stub
		venDeliverDao.impInvByOrd(dto);
	}
	

}
