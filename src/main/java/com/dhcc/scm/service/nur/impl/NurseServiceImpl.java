/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.nur.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.dao.nur.NurseDao;
import com.dhcc.scm.dao.ord.OrderDao;
import com.dhcc.scm.dao.ord.OrderStateDao;
import com.dhcc.scm.dao.userManage.NormalAccountDao;
import com.dhcc.scm.dao.ven.VendorDao;
import com.dhcc.scm.dto.nur.NurseIncDto;
import com.dhcc.scm.dto.ord.OrderDto;
import com.dhcc.scm.dto.ord.OrderStateDto;
import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.vo.cat.QueryIncPropertyVO;
import com.dhcc.scm.entity.vo.ord.OrderExeStateVo;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;
import com.dhcc.scm.service.nur.NurseService;

@Service("nurseService")
public class NurseServiceImpl implements NurseService {

	@Resource
	private NurseDao nurseDao;
	@Resource
	private OrderStateDao orderStateDao;
	@Resource
	private CommonService commonService;
	@Resource
	private OrderDao orderDao;
	@Resource
	private VendorDao vendorDao;
	@Resource
	private NormalAccountDao normalAccountDao;

	/**
	 * @return the orderDao
	 */
	public OrderDao getOrderDao() {
		return orderDao;
	}

	/**
	 * @param orderDao the orderDao to set
	 */
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public void listNurseInc(NurseIncDto dto) {
		nurseDao.listNurseInc(dto);
	}

	@Override
	public void addShopCart(NurseIncDto dto) {
		nurseDao.addShopCart(dto);
		
	}
	
	@Override
	public void listCatGroup(NurseIncDto dto) {
		nurseDao.listCatGroup(dto);
	}
	
	@Override
	public void getSubGroupByID(NurseIncDto dto) {
		nurseDao.getSubGroupByID(dto);
	}

	@Override
	public void saveOrderDetail(NurseIncDto dto) {
		// TODO Auto-generated method stub
		nurseDao.saveOrderDetail(dto);
	}

	@Override
	public void listNurseOrd(NurseIncDto dto) {
		// TODO Auto-generated method stub
		nurseDao.listNurseOrd(dto);
	}

	@Override
	public void listNurseShop(NurseIncDto dto) {
		// TODO Auto-generated method stub
		nurseDao.listNurseShop(dto);
	}
	@Override
	public List<OrderExeStateVo> getOrderStateById(OrderStateDto dto) {
		return orderStateDao.listOrderExeState(dto);
	}
	
	public List<HopCtlocDestination> findLocDesctionComboList(OrderDto dto){
		return orderDao.findLocDesctionComboList(dto);
	}
	
	public void saveDest(NurseIncDto dto){
		nurseDao.saveDest(dto);
	}
	public void deleteDest(NurseIncDto dto){
		nurseDao.deleteDest(dto);
	}

	@Override
	public void listVenIncComment(NurseIncDto dto) {
		// TODO Auto-generated method stub
		nurseDao.listVenIncComment(dto);
	}

	@Override
	public void cmpOrderDetail(NurseIncDto dto) {
		// TODO Auto-generated method stub
		nurseDao.cmpOrderDetail(dto);
	}
	
	@Override
	public void saveOrUpdate(VendorDto dto) {
		vendorDao.saveOrUpdate(dto);
		
	}
	@Override
	public void saveNormalAccount(NormalAccount normalAccount) throws Exception {
		normalAccountDao.save(normalAccount.getNormalUser());
		normalAccountDao.save(normalAccount);
	}


	@Override
	public void listOrdGrpByNo(NurseIncDto dto) {
		// TODO Auto-generated method stub
		nurseDao.listOrdGrpByNo(dto);
	}

	@Override
	public void saveOrUpdatePic(VendorDto dto) {
		vendorDao.saveOrUpdatePic(dto);
	}
	@Override
	public List<VenQualifTypeVO> queryQualifyType(VendorDto dto) {
		return vendorDao.queryQualifyType(dto);
	}

	@Override
	public void updateOrdDetail(Long orderId, Long state,String remark) {
		// TODO Auto-generated method stub
		nurseDao.updateOrdDetail(orderId, state,remark);
	}

	@Override
	public List<QueryIncPropertyVO> listNurseIncProperty(NurseIncDto dto) {
		// TODO Auto-generated method stub
		return nurseDao.listNurseIncProperty(dto);
	}		
}
