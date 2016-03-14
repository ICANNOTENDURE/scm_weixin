/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ord.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.blh.sys.LockAppUtil;
import com.dhcc.scm.blh.sys.SendMailBlh;
import com.dhcc.scm.blh.weixin.MpMessageBlh;
import com.dhcc.scm.dao.ord.OrdDao;
import com.dhcc.scm.dto.ord.OrdDto;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.Ord;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.ord.OrdService;

@Service("ordService")
public class OrdServiceImpl implements OrdService {

	@Resource
	private OrdDao ordDao;
	@Resource
	private CommonService commonService;
	@Resource
	private MpMessageBlh mpMessageBlh;
	@Resource
	private LockAppUtil lockAppUtil;
	@Resource
	private SendMailBlh sendMailBlh;
	
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

	@Override
	public void impHisOrder(OperateResult operateResult,
			Map<String, List<OrderDetail>> map,Long hospId,Long ctlocId) {
		if(map.size()==0){
			operateResult.setResultCode("-13");		
			return;
		}
		Ord ord = new Ord();
		ord.setOrdDate(new Date());
		ord.setOrdHopId(hospId);
		ord.setOrdLocId(ctlocId);
		ord.setOrdCmpFlag("1");
		ord.setOrdNo(lockAppUtil.GetAppNo("WSIMPORDER"));
		StringBuffer msg = new StringBuffer();
		commonService.saveOrUpdate(ord);
		
		
		for (String o : map.keySet()) {
			String orderNo = lockAppUtil.GetAppNo("ORD");
			for (OrderDetail orderDetail : map.get(o)) {
				orderDetail.setOrderImpId(ord.getOrdId());
				orderDetail.setOrderNo(orderNo);
				commonService.saveOrUpdate(orderDetail);
				//更新供应商商品的销量
				VenInc inc=commonService.get(VenInc.class, orderDetail.getOrderVenIncId());
				if(inc.getVenIncOrderQty()==null){
					inc.setVenIncOrderQty(0f);
				}
				inc.setVenIncOrderQty(inc.getVenIncOrderQty().floatValue()+orderDetail.getOrderVenQty().floatValue());
				commonService.saveOrUpdate(inc);
				//插入订单执行记录表
				ExeState exeState = new ExeState();
				exeState.setStateId(orderDetail.getOrderState());
				exeState.setUserid(orderDetail.getOrderUserId());
				exeState.setOrdId(orderDetail.getOrderId());
				exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
				exeState.setRemark("webservice 导入");
				commonService.saveOrUpdate(exeState);
				msg.append(orderDetail.getOrderHisNo()+",");
			}
			mpMessageBlh.sendMessByOrd(map.get(o).get(0));
			sendMailBlh.sendEMailByOrd(map.get(o).get(0));
		}
		operateResult.setResultCode("0");
		operateResult.setResultContent(operateResult.getResultContent()+"^"+msg.toString());
		
	}
	
	
}
