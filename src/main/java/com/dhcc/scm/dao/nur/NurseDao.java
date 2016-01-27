/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.nur;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.blh.weixin.WxMessageBlh;
import com.dhcc.scm.dto.nur.NurseIncDto;
import com.dhcc.scm.entity.hop.Evalute;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.OrdShopping;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.ord.State;
import com.dhcc.scm.entity.sys.SysAppParam;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.ven.VenIncPic;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.cat.QueryIncPropertyVO;
import com.dhcc.scm.entity.vo.cat.SubCatGroupVO;
import com.dhcc.scm.entity.vo.nur.NurseIncVo;
import com.dhcc.scm.entity.vo.nur.OrderDetailGroupByVenVo;
import com.dhcc.scm.entity.vo.nur.OrderGrpByNo;
import com.dhcc.scm.ws.his.dhcclient.ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt;
import com.dhcc.scm.ws.his.dhcclient.GetSCIInPoImInfoRt;
import com.dhcc.scm.ws.his.dhcclient.SCI;
import com.dhcc.scm.ws.his.dhcclient.SCIInpoUmInfoRtMain;

@Repository
public class NurseDao extends HibernatePersistentObjectDAO<VenInc> {
	
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	@Resource
	private WxMessageBlh wxMessageBlh;
	
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

	}
	
	
	@SuppressWarnings("unchecked")
	public List<QueryIncPropertyVO> listNurseIncProperty(NurseIncDto dto) {

		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("distinct "); 
		hqlBuffer.append("t.INC_PRO_CATPRO_ID as incprocatproid, ");            
		hqlBuffer.append("t4.GRP_PRO_DESC as grpprodesc, "); 
		hqlBuffer.append("t5.PRO_CODE as procode, "); 
		hqlBuffer.append("t5.PRO_NAME as proname "); 
		hqlBuffer.append("from T_VEN_INC_PROPERTY t ");
		hqlBuffer.append("left join t_ven_inc t1 on t1.VEN_INC_ROWID=t.INCPRO_INC_ID ");
		hqlBuffer.append("left join t_ven_hop_inc t2 on t1.VEN_INC_ROWID=t2.VEN_INC_ID ");
		hqlBuffer.append("left join t_hop_inc t3 on t2.HOP_INC_ID=t3.INC_ID ");
		hqlBuffer.append("left join T_CAT_GROUPPROPERTY t4 on t4.GRP_PRO_ID=t.INC_PRO_CATPRO_ID ");
		hqlBuffer.append("left join T_CAT_PROPERTY t5 on t5.PRO_ID=t4.GRP_PRO_PARREFID ");
		hqlBuffer.append("left join t_hop_vendor t10 on t10.H_VENDORID=t1.ven_inc_venid ");

		int properttIdNum=0;
		//按商品属性查询
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getPropertyIdStr())){
			properttIdNum=(dto.getPropertyIdStr().split(BaseConstants.COMMA)).length;
		}
		if(properttIdNum>0){
			hqlBuffer.append("left join (SELECT incPro_inc_id from T_VEN_INC_PROPERTY where INC_PRO_CATPRO_ID in ("+dto.getPropertyIdStr()+") GROUP BY incPro_inc_id HAVING count(*)="+properttIdNum+" ) t9 on t9.INCPRO_INC_ID=t1.VEN_INC_ROWID ");
		}

		//医院只能看到自己的，并且供应商资质和商品资质都审批通过的
		hqlBuffer.append(" where  t2.VEN_HOP_INC_ID is not null  and t2.VEN_HOP_AUDITFLAG='Y' and t10.H_AUDITFLAG='Y' ");
		hqlBuffer.append(" AND t3.inc_hospid ="+WebContextHolder.getContext().getVisit().getUserInfo().getHopId()+" ");
		hqlBuffer.append(" AND t4.GRP_PRO_DESC is not null ");
		//商品属性查询字符串
		if(properttIdNum>0){
			hqlBuffer.append(" AND t9.INCPRO_INC_ID  is not null ");
		}
		//商品分类
		if (null != dto.getIncCatId()) {
			hqlBuffer.append(" AND t1.VEN_INC_CATID =:inccatids ");
			hqlParamMap.put("inccatids", dto.getIncCatId());
		}
		// 模糊查询
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getQueryStr())) {
			hqlBuffer.append("AND (upper(t1.VEN_INC_NAME) like upper(:querystrname) or upper(t1.VEN_INC_CODE) like upper(:querystrcode)  or upper(t1.VEN_INC_ALIAS) like upper(:querystralias) ) ");
			hqlParamMap.put("querystrname", "%" + dto.getQueryStr() + "%");
			hqlParamMap.put("querystrcode", "%" + dto.getQueryStr() + "%");
			hqlParamMap.put("querystralias", "%" + dto.getQueryStr() + "%");
		}
		return jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), QueryIncPropertyVO.class, hqlParamMap);


	}
	/**
	 * 
	 * @Title: listNurseInc
	 * @Description: TODO(查询供应商药品，供应商资质已审核，)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月18日 上午10:34:29
	 */
	public void listNurseInc(NurseIncDto dto) {

		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.VEN_INC_ROWID as venincid, ");          //供应商商品ID   
		hqlBuffer.append("t3.INC_ID as incid, ");                    //医院商品ID  
		hqlBuffer.append("t3.INC_CODE as inccode, ");                //供应商商品代码
		hqlBuffer.append("t1.VEN_INC_NAME as incname, ");            //供应商商品名称
		hqlBuffer.append("t1.VEN_INC_UOMNAME as incuom, ");          //供应商单位
		hqlBuffer.append("t1.VEN_INC_PRICE as rp, ");                //供应商单位进价  
		hqlBuffer.append("t1.VEN_INC_QTY as qty, ");                 //库存数
		hqlBuffer.append("t1.VEN_INC_COMMENT_NUM as commentnum, ");  //评价数
		hqlBuffer.append("t1.VEN_INC_ORDER_QTY as orderqty, ");      //订单数
		hqlBuffer.append("t3.INC_SPEC as spec, ");                     
		hqlBuffer.append("t8.VEN_INC_PIC_PATH as picpath, ");
		hqlBuffer.append("t6.name as manf, ");
		hqlBuffer.append("t6.ID as manfid, ");
		hqlBuffer.append("t1.VEN_INC_CATID as inccatid, ");
		hqlBuffer.append("t5.name as venname ");

		hqlBuffer.append("from t_ven_inc t1 ");
		hqlBuffer.append("left join t_ven_hop_inc t2 on t1.VEN_INC_ROWID=t2.VEN_INC_ID ");
		hqlBuffer.append("left join t_hop_inc t3 on t2.HOP_INC_ID=t3.INC_ID ");
		hqlBuffer.append("left join t_ven_inc_pic t8 on t2.ven_inc_id=t8.VEN_INC_PIC_VENINCID and t8.VEN_INC_PIC_SEQ=1 ");
		hqlBuffer.append("left join t_ven_vendor t5 on t5.ven_id=t1.ven_inc_venid ");
		hqlBuffer.append("left join t_hop_vendor t10 on t10.H_VENDORID=t1.ven_inc_venid ");
		hqlBuffer.append("left join t_hop_manf t6 on t1.VEN_INC_MANFID=t6.id ");

		
		// 模糊查询
		if (!StringUtils.isNullOrEmpty(dto.getQueryStr())) {
			hqlBuffer.append("left join (select distinct INCALIAS_TEXT,INCALIAS_INCID from T_HOP_INCALIAS) t7 on t3.INC_ID=t7.INCALIAS_INCID ");
		}
		int properttIdNum=0;
		//按商品属性查询
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getPropertyIdStr())){
			properttIdNum=(dto.getPropertyIdStr().split(BaseConstants.COMMA)).length;
		}
		if(properttIdNum>0){
			hqlBuffer.append("left join (SELECT incPro_inc_id from T_VEN_INC_PROPERTY where INC_PRO_CATPRO_ID in ("+dto.getPropertyIdStr()+") GROUP BY incPro_inc_id HAVING count(*)="+properttIdNum+" ) t9 on t9.INCPRO_INC_ID=t1.VEN_INC_ROWID ");
		}
		
		//医院只能看到自己的，并且供应商资质和商品资质都审批通过的
		hqlBuffer.append(" where  t2.VEN_HOP_INC_ID is not null  and t2.VEN_HOP_AUDITFLAG='Y' and t10.H_AUDITFLAG='Y' ");
		hqlBuffer.append(" AND t3.inc_hospid ="+WebContextHolder.getContext().getVisit().getUserInfo().getHopId()+" ");
		//商品属性查询字符串
		if(properttIdNum>0){
			hqlBuffer.append(" AND t9.INCPRO_INC_ID  is not null ");
		}
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getIncName())) {
			hqlBuffer.append(" AND t3.inc_name  like :hopincname11 ");
			hqlParamMap.put("hopincname11", "%" + dto.getIncName() + "%");
		}
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getIncCode())) {
			hqlBuffer.append(" AND t3.inc_code  like :hopincode11 ");
			hqlParamMap.put("hopincode11", "%" + dto.getIncCode() + "%");
		}
        if(dto.getHopIncId()!=null){
        	hqlBuffer.append(" AND t3.INC_ID =:hopincid ");
			hqlParamMap.put("hopincid", dto.getHopIncId());
        }
		//商品分类
		if (null != dto.getIncCatId()) {
			hqlBuffer.append(" AND t1.VEN_INC_CATID =:inccatids ");
			hqlParamMap.put("inccatids", dto.getIncCatId());
		}
		// 模糊查询
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getQueryStr())) {
			hqlBuffer.append("AND (upper(t1.VEN_INC_NAME) like upper(:querystrname) or upper(t1.VEN_INC_CODE) like upper(:querystrcode)  or upper(t1.VEN_INC_ALIAS) like upper(:querystralias) ) ");
			hqlParamMap.put("querystrname", "%" + dto.getQueryStr() + "%");
			hqlParamMap.put("querystrcode", "%" + dto.getQueryStr() + "%");
			hqlParamMap.put("querystralias", "%" + dto.getQueryStr() + "%");
		}
		// 排序
		if (org.apache.commons.lang.StringUtils.isNotEmpty(dto.getSortOrder())) {
			if (dto.getSortOrder().equals("orderByPrice")) {
				hqlBuffer.append(" order by t1.VEN_INC_PRICE ");
				hqlBuffer.append(dto.getSort());
			}
			if (dto.getSortOrder().equals("orderByComment")) {
				hqlBuffer.append(" order by t1.VEN_INC_COMMENT_NUM ");
				hqlBuffer.append(dto.getSort());
			}
			if (dto.getSortOrder().equals("orderByDate")) {
				hqlBuffer.append(" order by t1.VEN_INC_ADDDATE ");
				hqlBuffer.append(dto.getSort());
			}
			if (dto.getSortOrder().equals("orderByQty")) {
				hqlBuffer.append(" order by t1.VEN_INC_ORDER_QTY ");
				hqlBuffer.append(dto.getSort());
			}
		}else{
			hqlBuffer.append(" order by t1.VEN_INC_ORDER_QTY desc ");
		}
		dto.getPageModel().setPageSize(15);
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), NurseIncVo.class, "VEN_INC_ROWID");
		
		int page = dto.getPageModel().getTotals() % dto.getPageModel().getPageSize();
		if (page == 0) {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize());
		} else {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize() + 1);
		}

	}

	/**
	 * 
	 * @Title: addShopCart
	 * @Description: TODO(保存到购物车)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月19日 下午5:04:00
	 */
	public void addShopCart(NurseIncDto dto) {
		if (dto.getOrdShopping() != null) {
			// List<VenHopInc> venHopIncs =
			// super.findByProperty(VenHopInc.class,"venIncId",
			// dto.getOrdShopping().getShopVenIncid());
			// if (venHopIncs.size() == 0) {
			// dto.getOperateResult().setResultCode("-1");
			// dto.getOperateResult().setResultContent("药品或材料基本信息没有对照");
			// return;
			// }
			// float fac = venHopIncs.get(0).getHopFac().floatValue()/
			// venHopIncs.get(0).getVenFac().floatValue();
			VenInc venInc = super.get(VenInc.class, dto.getOrdShopping().getShopVenIncid());
			dto.getOrdShopping().setShopRp(venInc.getVenIncPrice());
			dto.getOrdShopping().setShopVendorId(venInc.getVenIncVenid());
			HopInc hopInc = super.get(HopInc.class, dto.getOrdShopping().getShopIncid());
			dto.getOrdShopping().setShopUom(venInc.getVenIncUomname());
			dto.getOrdShopping().setShopIncName(hopInc.getIncName());

			super.saveOrUpdate(dto.getOrdShopping());
		}
	}

	/**
	 * 
	 * @Title: saveOrderDetail
	 * @Description: TODO(批次保存订单)
	 * @param @param orderDetails 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月23日 下午12:04:19
	 */
	public void saveOrderDetail(NurseIncDto dto) {

		for (Map.Entry<String, OrderDetailGroupByVenVo> entry : dto.getVenMap().entrySet()) {
			OrderDetailGroupByVenVo detailGroupByVenVo = entry.getValue();
			Long state=0l;
			for (OrderDetail orderDetail : detailGroupByVenVo.getOrderDetails()) {
				super.save(orderDetail);
				//更新供应商商品的销量
				VenInc inc=super.get(VenInc.class, orderDetail.getOrderVenIncId());
				if(inc.getVenIncOrderQty()==null){
					inc.setVenIncOrderQty(0f);
				}
				inc.setVenIncOrderQty(inc.getVenIncOrderQty().floatValue()+orderDetail.getOrderVenQty().floatValue());
				super.saveOrUpdate(inc);
				//插入订单执行记录表
				ExeState exeState = new ExeState();
				exeState.setStateId(orderDetail.getOrderState());
				exeState.setUserid(orderDetail.getOrderUserId());
				exeState.setOrdId(orderDetail.getOrderId());
				exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
				super.save(exeState);
				super.delete(detailGroupByVenVo.getOrdShoppings());
				state=orderDetail.getOrderState();
			}
			if(state.longValue()==1){
				wxMessageBlh.sendMessByOrd(detailGroupByVenVo.getOrderDetails().get(0));
			}
		}
	}

	/**
	 * 拼接查询条件的方法
	 * 
	 * @param hql
	 * @return
	 */
	public void listCatGroup(NurseIncDto dto) {
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.sdg_id as subparrefgroupid, ");
		hqlBuffer.append("t1.sdg_desc as subparrefgroupname ");
		hqlBuffer.append("from t_cat_druggroup t1 ");
		hqlBuffer.append("where 1=1 ");
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), SubCatGroupVO.class, "sdg_id");
	}

	/**
	 * 根据大类的ID获取小类
	 * 
	 * @param dto
	 */
	public void getSubGroupByID(NurseIncDto dto) {
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.sdgi_id as subcatgroupid, ");
		hqlBuffer.append("t1.sdgi_desc as subcatgroupname ");
		hqlBuffer.append("from t_cat_druggroupitm t1 ");
		hqlBuffer.append("where 1=1 ");

		if (((dto.getCatGroup().getGroupID() != null)) || (dto.getCatGroup().getGroupID() != 0)) {
			hqlBuffer.append(" and sdgi_parref_id=:catgroupid");
			hqlParamMap.put("catgroupid", dto.getCatGroup().getGroupID());
		}

		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), SubCatGroupVO.class, "sdgi_id");
	}

	/**
	 * 
	 * @Title: listNurseOrd
	 * @Description: TODO(我的订单查询，供应商待确认，护士待接收)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月23日 下午8:02:45
	 */
	public void listNurseOrd(NurseIncDto dto) {

		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		if (dto.getSmPageSize() != null) {
			dto.getPageModel().setPageSize(dto.getSmPageSize());
		} else {
			dto.getPageModel().setPageSize(10);
		}
		dto.setOrderDetails(new ArrayList<OrderDetail>());
		DetachedCriteria criteria = createDetachedCriteria(OrderDetail.class);
		if (dto.getOrdState() != null) {
			if (dto.getOrdState().floatValue() != 0l) {
				criteria.add(Restrictions.eq("orderState", dto.getOrdState()));
			}
		}
		if (dto.getStarDate() != null) {
			criteria.add(Restrictions.ge("orderDate", dto.getStarDate()));
		}
		if (dto.getEndDate() != null) {
			criteria.add(Restrictions.le("orderDate", dto.getStarDate()));
		}
		if (dto.getVendorId() != null) {
			criteria.add(Restrictions.eq("orderVenId", dto.getVendorId()));
		}
		criteria.addOrder(Order.desc("orderId"));
		criteria.add(Restrictions.eq("orderUserId", Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId())));
		dto.getPageModel().setTotals(super.findByCriteria(criteria).size());
		@SuppressWarnings("unchecked")
		List<OrderDetail> orderDetails = super.findByWithStart(criteria, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize());
		if (orderDetails.size() == 0) {
			return;
		}

		int page = dto.getPageModel().getTotals() % dto.getPageModel().getPageSize();
		if (page == 0) {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize());
		} else {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize() + 1);
		}

		for (OrderDetail orderDetail : orderDetails) {
			String[] propertyNames = { "venIncPicVenincid", "venIncPicSeq" };
			Object[] values = { orderDetail.getOrderVenIncId(), 1l };
			List<VenIncPic> venIncPics = super.findByProperties(VenIncPic.class, propertyNames, values);
			if (venIncPics.size() > 0) {
				orderDetail.setPicPath(venIncPics.get(0).getVenIncPicPath());
			}
			HopInc hopInc = super.get(HopInc.class, orderDetail.getOrderHopIncId());
			orderDetail.setIncName(hopInc.getIncName());
			dto.getOrderDetails().add(orderDetail);
			String[] propertyNames1 = { "ordSubDetailId", "ordSubStatus" };
			String detailSub = "Y";
			if (orderDetail.getOrderState().floatValue() > 3) {
				detailSub = "T";
			}
			Object[] values1 = { orderDetail.getOrderId(), detailSub };
			List<OrderDetailSub> orderDetailSubs = super.findByProperties(OrderDetailSub.class, propertyNames1, values1);
			float devQty = 0;
			for (OrderDetailSub orderDetailSub : orderDetailSubs) {
				devQty = devQty + orderDetailSub.getOrderSubQty().floatValue();
			}
			orderDetail.setDevQty(devQty * orderDetail.getOrderFac().floatValue());
		}

	}
	public void CaluDevQty(List<OrderDetail> orderDetails) {
		for (OrderDetail orderDetail : orderDetails) {
			String[] propertyNames = { "venIncPicVenincid", "venIncPicSeq" };
			Object[] values = { orderDetail.getOrderVenIncId(), 1l };
			List<VenIncPic> venIncPics = super.findByProperties(VenIncPic.class, propertyNames, values);
			if (venIncPics.size() > 0) {
				orderDetail.setPicPath(venIncPics.get(0).getVenIncPicPath());
			}
			HopInc hopInc = super.get(HopInc.class, orderDetail.getOrderHopIncId());
			orderDetail.setIncName(hopInc.getIncName());
			String[] propertyNames1 = { "ordSubDetailId", "ordSubStatus" };
			String detailSub = "Y";
			if(orderDetail.getOrderState()!=null){
				if (orderDetail.getOrderState().floatValue() > 3) {
					detailSub = "T";
				}
			}
			Object[] values1 = { orderDetail.getOrderId(), detailSub };
			List<OrderDetailSub> orderDetailSubs = super.findByProperties(OrderDetailSub.class, propertyNames1, values1);
			float devQty = 0;
			for (OrderDetailSub orderDetailSub : orderDetailSubs) {
				devQty = devQty + orderDetailSub.getOrderSubQty().floatValue();
			}
			orderDetail.setDevQty(devQty * orderDetail.getOrderFac().floatValue());
			if(orderDetail.getOrderState()!=null){
				List<State> states=super.findByProperty(State.class, "stateSeq", orderDetail.getOrderState());
				if(states.size()>0){
					orderDetail.setStateDesc(states.get(0).getStateName());
				}
			}
			
		}
	}

	/**
	 * 
	* @Title: listxOrdGrpByNo 
	* @Description: TODO(查询订单按单号) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月13日 下午5:44:50
	 */
	@SuppressWarnings("unchecked")
	public void listOrdGrpByNo(NurseIncDto dto) {
		
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		hqlBuffer.append("select ");
		hqlBuffer.append("ORDER_NO as orderno ");
		hqlBuffer.append("from T_ORD_ORDERDETAIL  ");
		hqlBuffer.append("where 1=1 ");

		if (dto.getOrdState() != null) {
			if (dto.getOrdState().floatValue() != 0l) {
				hqlBuffer.append(" and ORDER_STATE=:ordstate");
				hqlParamMap.put("ordstate", dto.getOrdState());
			}
		}
		if (dto.getStarDate() != null) {
			hqlBuffer.append(" and ORDER_ODATE>=:startdate");
			hqlParamMap.put("startdate", dto.getStarDate());
		}
		if (dto.getEndDate() != null) {
			hqlBuffer.append(" and ORDER_ODATE-1<=:enddate");
			hqlParamMap.put("enddate", dto.getEndDate());
		}
		HopVendor hopVendor=null;
		if (dto.getVendorId()!= null) {
			if(dto.getVendorId()!=0){
				hopVendor=super.get(HopVendor.class, dto.getVendorId());
				hqlBuffer.append(" and ORDER_VEN_ID=:venid");
				hqlParamMap.put("venid", hopVendor.getHopVenId());
			}
		}
		hqlBuffer.append(" and ORDER_USER_ID=:userid");
		hqlParamMap.put("userid", Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		hqlBuffer.append(" group by ORDER_NO order by ORDER_NO desc ");
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		
		dto.getPageModel().setTotals(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), OrderGrpByNo.class, hqlParamMap).size());
		List<OrderGrpByNo> orderGrpByNos=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), OrderGrpByNo.class, hqlParamMap, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "ORDER_NO");


		for(OrderGrpByNo orderGrpByNo:orderGrpByNos){
			
			DetachedCriteria criteria = createDetachedCriteria(OrderDetail.class);
			criteria.add(Restrictions.eq("orderNo",orderGrpByNo.getOrderno()));
			if (dto.getOrdState() != null) {
				if (dto.getOrdState().floatValue() != 0l) {
					criteria.add(Restrictions.eq("orderState", dto.getOrdState()));
				}
			}
			if (dto.getStarDate() != null) {
				criteria.add(Restrictions.ge("orderDate", dto.getStarDate()));
			}
			if (dto.getEndDate() != null) {
				criteria.add(Restrictions.le("orderDate", dto.getStarDate()));
			}
			if (hopVendor != null) {
				if (hopVendor.getHopVenId() !=0) {
					criteria.add(Restrictions.eq("orderVenId", hopVendor.getHopVenId()));
				}
			}
			criteria.addOrder(Order.desc("orderId"));
			criteria.add(Restrictions.eq("orderUserId", Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId())));
			List<OrderDetail> orderDetails=super.findByCriteria(criteria);
			
			this.CaluDevQty(orderDetails);
			orderGrpByNo.setOrderDetails(orderDetails);
			if(orderDetails.size()>0){
				Vendor vendor=super.get(Vendor.class, orderDetails.get(0).getOrderVenId());
				orderGrpByNo.setVendorName(vendor.getName());
				orderGrpByNo.setOrderTime(orderDetails.get(0).getOrderDate());
			}
		}
		Collections.sort(orderGrpByNos, new Comparator<OrderGrpByNo>() {
            public int compare(OrderGrpByNo arg0, OrderGrpByNo arg1) {
                return arg1.getOrderTime().compareTo(arg0.getOrderTime());
            }
        });
		dto.setOrderGrpByNos(orderGrpByNos);
		int page = dto.getPageModel().getTotals() % dto.getPageModel().getPageSize();
		if (page == 0) {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize());
		} else {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize() + 1);
		}
	}
	/**
	 * 
	 * @Title: listNurseShop
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月24日 下午9:25:52
	 */
	public void listNurseShop(NurseIncDto dto) {

		dto.setOrdShoppings(new ArrayList<OrdShopping>());
		DetachedCriteria criteria = createDetachedCriteria(OrdShopping.class);

		criteria.addOrder(Order.desc("shopId"));
		criteria.add(Restrictions.eq("shopUserid", Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId())));
		@SuppressWarnings("unchecked")
		List<OrdShopping> ordShoppings = super.findByCriteria(criteria);
		if (ordShoppings.size() == 0) {
			return;
		}

		for (OrdShopping ordShopping : ordShoppings) {
			String[] propertyNames = { "venIncPicVenincid", "venIncPicSeq" };
			Object[] values = { ordShopping.getShopVenIncid(), 1l };
			List<VenIncPic> venIncPics = super.findByProperties(VenIncPic.class, propertyNames, values);
			if (venIncPics.size() > 0) {
				ordShopping.setPicpath(venIncPics.get(0).getVenIncPicPath());
			}

			dto.getOrdShoppings().add(ordShopping);
		}
	}

	/**
	 * 保存收货地址
	 */
	public void saveDest(NurseIncDto dto) {
		HopCtlocDestination hop = dto.getHopCtlocDestinationDto().getHopCtlocDestination();
		HopCtlocDestination ctlocDestination = null;
		dto.getHopCtlocDestinationDto().getHopCtlocDestination().setCtlocDr(WebContextHolder.getContext().getVisit().getUserInfo().getLocId());
		if (hop.getHopCtlocDestinationId() != null) {
			ctlocDestination = super.get(HopCtlocDestination.class, hop.getHopCtlocDestinationId());
			ctlocDestination.setDestination(hop.getDestination());
			super.update(ctlocDestination);
		} else {
			super.save(dto.getHopCtlocDestinationDto().getHopCtlocDestination());
		}
	}

	/**
	 * 删除收货地址
	 */
	public void deleteDest(NurseIncDto dto) {
		HopCtlocDestination ctlocDestination = dto.getHopCtlocDestinationDto().getHopCtlocDestination();
		if (ctlocDestination.getHopCtlocDestinationId() != null) {
			super.delete(ctlocDestination);
		}
	}

	/**
	 * 
	 * @Title: listVenIncComment
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月27日 上午10:28:09
	 */
	public void listVenIncComment(NurseIncDto dto) {

		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		DetachedCriteria criteria = createDetachedCriteria(Evalute.class);
		criteria.addOrder(Order.desc("eleDate"));
		criteria.add(Restrictions.eq("eleVenIncId", dto.getOrdShopping().getShopVenIncid()));
		dto.getPageModel().setTotals(super.findByCriteria(criteria).size());
		@SuppressWarnings("unchecked")
		List<Evalute> evalutes = super.findByCriteria(criteria, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize());
		for (Evalute evalute : evalutes) {
			NormalAccount normalAccount = super.get(NormalAccount.class, evalute.getEleUserId());
			evalute.setUserName(normalAccount.getAccountAlias());
		}
		dto.setEvalutes(evalutes);

		int page = dto.getPageModel().getTotals() % dto.getPageModel().getPageSize();
		if (page == 0) {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize());
		} else {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize() + 1);
		}
	}

	/**
	 * 
	 * @Title: updateOrderDetail
	 * @Description: TODO(护士确认收货)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月28日 下午4:26:54
	 */
	public void cmpOrderDetail(NurseIncDto dto) {

		com.dhcc.scm.ws.his.dhcclient.OperateResult operateResult = new com.dhcc.scm.ws.his.dhcclient.OperateResult();
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrderIdStr())){
			String[] appPropertyNames = { "appCode", "appValue" };
			Object[] appValues = {"INSERTHIS", "3"};
			List<SysAppParam> appParams=super.findByProperties(SysAppParam.class, appPropertyNames, appValues);
			boolean insertFlag=false;
			if(appParams.size()>=1){
				insertFlag=true;
			}
			String[] orderIds = dto.getOrderIdStr().split(",");
			for (String orderId : orderIds) {
				OrderDetail orderDetail = super.get(OrderDetail.class, Long.valueOf(orderId.trim()));
				if(!orderDetail.getOrderState().toString().equals("3")){
					continue;
				}
				// 存执行记录
				ExeState exeState = new ExeState();
				exeState.setStateId(Long.valueOf(4));
				exeState.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
				exeState.setOrdId(orderDetail.getOrderId());
				exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
				super.saveOrUpdate(exeState);

				float fac = orderDetail.getOrderFac();
				String[] propertyNames = { "ordSubDetailId", "ordSubStatus" };
				Object[] values = {Long.valueOf(orderId.trim()), "Y" };
				List<OrderDetailSub> detailSubs = super.findByProperties(OrderDetailSub.class, propertyNames, values);

				// 此次发货医院单位数量
				float devHopQty = 0;

				SimpleDateFormat sdFormat = new SimpleDateFormat("yyy-MM-dd");
				SCIInpoUmInfoRtMain infoRtMain = new SCIInpoUmInfoRtMain();
				ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt arrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt = new ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt();
				infoRtMain.setInPoImInfos(arrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt);
				for (OrderDetailSub orderDetailSub : detailSubs) {
					GetSCIInPoImInfoRt sciInPoImInfoRt = new GetSCIInPoImInfoRt();
					// 批号
					sciInPoImInfoRt.setBatNo(orderDetailSub.getOrdSubBatNo());
					if (orderDetailSub.getOrdSubExpDate() != null) {
						sciInPoImInfoRt.setExpDate(sdFormat.format(orderDetailSub.getOrdSubExpDate()));
						sciInPoImInfoRt.setInvNo(orderDetailSub.getOrdSubInvNo());
					}
					HopCtloc hopCtloc = super.get(HopCtloc.class, orderDetail.getOrderRecLoc());
					sciInPoImInfoRt.setReCTLOCDR(hopCtloc.getCode());
					List<HopVendor> hopVendors = super.findByProperty(HopVendor.class, "hopVenId", orderDetail.getOrderVenId());
					sciInPoImInfoRt.setVendorDR(hopVendors.get(0).getHopCode());
					HopInc hopInc = super.get(HopInc.class, orderDetail.getOrderHopIncId());
					sciInPoImInfoRt.setCTUOMDR(hopInc.getIncUomcode());
					sciInPoImInfoRt.setInciDr(hopInc.getIncCode());
					VenInc venInc=super.get(VenInc.class, orderDetail.getOrderVenIncId());
					if (hopInc.getIncManfid() != null) {
						HopManf hopManf = super.get(HopManf.class, venInc.getVenIncManfid());
						sciInPoImInfoRt.setPhmnfDR(hopManf.getManfCode());
					}
					float hopQty = orderDetailSub.getOrderSubQty() * fac;
					sciInPoImInfoRt.setOrderQty(String.valueOf(orderDetail.getOrderHopQty()));
					sciInPoImInfoRt.setRealqty(String.valueOf(hopQty));
					if (orderDetailSub.getOrderSubRp() == null) {
						orderDetailSub.setOrderSubRp(0f);
					}
					float hopRp = orderDetailSub.getOrderSubRp().floatValue() / fac;
					sciInPoImInfoRt.setRealPrice(String.valueOf(hopRp));
					sciInPoImInfoRt.setPmsInPoID(orderDetailSub.getOrdSubId());
					arrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt.getGetSCIInPoImInfo().add(sciInPoImInfoRt);
					devHopQty = devHopQty + hopQty;
					// 更新订单子表发货状态
					orderDetailSub.setOrdSubStatus("T");
					super.saveOrUpdate(orderDetailSub);
				}
				// 更新订单表
				orderDetail.setOrderState(4l);
				if (orderDetail.getOrderRecQty() == null) {
					orderDetail.setOrderRecQty(0f);
				}
				orderDetail.setOrderRecQty(orderDetail.getOrderRecQty().floatValue() + devHopQty);
				super.saveOrUpdate(orderDetail);
				if(insertFlag){
					// 调his接口
					SCI sci = new SCI();
					operateResult = sci.getSCISoap().inpohhImport(infoRtMain);
					dto.setOperateResultWs(operateResult);
					if (!operateResult.getResultCode().equals("1")) {
						throw new RuntimeException();
					}
				}
			}
		}

		

	}
	
	
	/**
	 * 
	* @Title: updateOrdDetail 
	* @Description: TODO(更新订单表状态和增加订单执行日志) 
	* @param @param orderId
	* @param @param state    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月14日 下午4:04:52
	 */
	public void updateOrdDetail(Long orderId,Long state,String remark) {
		
		OrderDetail orderDetail = super.get(OrderDetail.class,orderId);
		orderDetail.setOrderState(state);
		super.saveOrUpdate(orderDetail);
		
		ExeState exeState = new ExeState();
		exeState.setStateId(state);
		exeState.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		exeState.setOrdId(orderDetail.getOrderId());
		exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
		exeState.setRemark(remark);
		super.saveOrUpdate(exeState);
	}
}
