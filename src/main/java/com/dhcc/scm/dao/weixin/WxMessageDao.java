/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.weixin;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.weixin.WxMessageDto;
import com.dhcc.scm.entity.vo.weixin.OrderInfo;
import com.dhcc.scm.entity.weixin.WxMessage;

@Repository
public class WxMessageDao extends HibernatePersistentObjectDAO<WxMessage> {

	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;

	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

		WxMessageDto wxMessageDto = (WxMessageDto) dto;
		WxMessage wxMessage = wxMessageDto.getWxMessage();

		pagerModel.setCountProName(super.getIdName(WxMessage.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		buildQuery(hqlParamMap, wxMessage, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/**
	 * 拼接查询条件的方法
	 * 
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	private void buildQuery(Map hqlParamMap, WxMessage wxMessage, StringBuilder hqlStr) {
		// 拼接查询条件
		hqlStr.append(" from WxMessage where 1=1 ");
		// 接下来拼接其他查询条件 如下示例代码所示
		// hqlStr.append("WHERE YEAR=:year ");
		// hqlParamMap.put("year", year);
		// hqlStr.append("AND MONTH=:month ");
		// hqlParamMap.put("month", month);
		// hqlStr.append("AND DAY=:day ");
		// hqlParamMap.put("day", day);
	}

	public void save(WxMessage wxMessage) {

		super.save(wxMessage);
	}

	public void delete(WxMessage wxMessage) {

		super.delete(wxMessage);
	}

	public void update(WxMessage wxMessage) {

		super.update(wxMessage);
	}

	public WxMessage findById(WxMessage wxMessage) {

		return super.findById(wxMessage.getWxMessageId());

	}

	@SuppressWarnings("unchecked")
	public void listToDoTask(WxMessageDto dto) {

		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		hqlBuffer.append("select ");
		hqlBuffer.append("ORDER_NO as orderno, ");
		hqlBuffer.append("ORDER_ODATE as orddate, ");
		hqlBuffer.append("T2.HOSPITAL_name as hopname, ");
		hqlBuffer.append("t3.CTLOCDES_DESTINATION as recdesction, ");
		hqlBuffer.append("t4.STATE_NAME as state ");
		hqlBuffer.append("from T_ORD_ORDERDETAIL t1 ");
		hqlBuffer.append("LEFT JOIN T_SYS_HOSPITAL t2 ON t1.order_hop_Id=T2.HOSPITAL_id  ");
		hqlBuffer.append("left join T_SYS_CTLOC_DESTINATION t3 on t3.CTLOCDES_ID=t1.ORDER_RECDESTINATION  ");
		hqlBuffer.append("left join T_ORD_STATE t4 on t4.STATE_SEQ = t1.ORDER_STATE  ");
		hqlBuffer.append("where 1=1 ");

		if (dto.getState() != null) {
			hqlBuffer.append(" and ORDER_STATE=:ordstate");
			hqlParamMap.put("ordstate", dto.getState());
		}
		if (dto.getStart() != null) {
			hqlBuffer.append(" and ORDER_ODATE>=:startdate");
			hqlParamMap.put("startdate", dto.getStart());
		}
		if (dto.getEnd() != null) {
			hqlBuffer.append(" and ORDER_ODATE-1<=:enddate");
			hqlParamMap.put("enddate", dto.getStart());
		}

		if (dto.getVenid() != null) {
			hqlBuffer.append(" and ORDER_VEN_ID=:venid");
			hqlParamMap.put("venid", dto.getVenid());
		}
		hqlBuffer.append(" group by ORDER_NO,ORDER_ODATE,T2.HOSPITAL_name,t3.CTLOCDES_DESTINATION,t4.STATE_NAME  ORDER BY ORDER_ODATE desc");
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		
		dto.getPageModel().setTotals(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), OrderInfo.class, hqlParamMap).size());
		List<OrderInfo> orderInfos=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), OrderInfo.class, hqlParamMap, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "ORDER_NO");
		
		
		Collections.sort(orderInfos, new Comparator<OrderInfo>() {
            public int compare(OrderInfo arg0, OrderInfo arg1) {
                return arg1.getOrddate().compareTo(arg0.getOrddate());
            }
        });
		dto.setOrderInfos(orderInfos);
		int page = dto.getPageModel().getTotals() % dto.getPageModel().getPageSize();
		if (page == 0) {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize());
		} else {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize() + 1);
		}
	}
}
