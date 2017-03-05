/**
 * 
 */
package com.dhcc.scm.dao.ord;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ord.PutShippSumDto;
import com.dhcc.scm.dto.ord.StateDto;
import com.dhcc.scm.entity.ord.State;
import com.dhcc.scm.entity.vo.ord.DevPropertyGridVo;
import com.dhcc.scm.entity.vo.ord.OrderInfoVo;
import com.dhcc.scm.entity.vo.ord.PutShippSumVo;
import com.dhcc.scm.entity.vo.ven.DeliverItmVo;
import com.dhcc.scm.entity.vo.ven.VenStatisticsVo;


/**
 * @author Administrator
 * 
 */
@Repository
public class PutShippSumDao extends HibernatePersistentObjectDAO<PutShippSumVo>{

	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
	
	}
	@SuppressWarnings("unchecked")
	public void listPutShippSum(PutShippSumDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append("select t1.ORDSUB_INVNO as invno, ");
		hqlBuffer.append(" t1.ORDSUB_USERID as userid,t1.ORDSUB_DATE as date,");
		hqlBuffer.append(" sum(round(t1.ORDSUB_RP*t1.ORDSUB_QTY,2)) as rpamt, ");
		hqlBuffer.append(" t3.`NAME` as venname");
		hqlBuffer.append(" from t_ord_orderdetailsub as t1 ");
		hqlBuffer.append(" LEFT JOIN T_ORD_ORDERDETAIL t2 on t1.ORDSUB_DETAIL_ID=t2.ORDER_ID ");
		hqlBuffer.append(" LEFT JOIN t_ven_vendor as t3 on t2.ORDER_VEN_ID=t3.VEN_ID ");
		hqlBuffer.append(" where 1=1 ");
		
		if(dto.getStdate()!=null){
			hqlBuffer.append("  and  t1.ORDSUB_DATE>=:start ");
			hqlParamMap.put("start", dto.getStdate());
		}
		if(dto.getEddate()!=null){
			hqlBuffer.append("  and  t1.ORDSUB_DATE<=:end ");
			hqlParamMap.put("end", dto.getEddate());
		}
		if(StringUtils.isNotBlank(dto.getVenname())){
			hqlBuffer.append("  and  t3.`NAME` like :venincname");
			hqlParamMap.put("venincname", "%"+dto.getVenname()+"%");
		}
		
//		if("venname".equals(dto.getSort())){
//			hqlBuffer.append(" group by t3.`NAME` "+dto.getSortOrder());	
//		}
//		if("invno".equals(dto.getSort())){
//			hqlBuffer.append(" group by t1.ORDSUB_INVNO "+dto.getSortOrder());
//		}
		
		hqlBuffer.append(" group by t3.`NAME`, t1.ORDSUB_INVNO");
		
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		
		Integer total=jdbcTemplateWrapper.getResultCount(hqlBuffer.toString(), hqlParamMap);
		dto.getPageModel().setTotals(total);
		List<PutShippSumVo> dataList=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), PutShippSumVo.class, hqlParamMap, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "t1.ORDSUB_ID");
		dto.getPageModel().setPageData(dataList);
	}
	/**
	 * 
	* @Title: listVenOrd 
	* @Description: TODO(入库发票明细使用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author lvpeng   
	* @date 2017年1月5日 下午2:10:10
	 */
	public void listDeliverItm(PutShippSumDto dto) {

		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.ORDSUB_ID as deliveritmid,  "); //发货表id
		hqlBuffer.append("t3.VEN_INC_ROWID as venincrowid,  "); //主键id
		hqlBuffer.append("t3.VEN_INC_CODE as venincncode,  "); // 代码
		hqlBuffer.append("t3.VEN_INC_NAME as venincname,  "); //描述
		hqlBuffer.append("t3.VEN_INC_UOMNAME as uom,  "); //
		hqlBuffer.append("t3.VEN_INC_SPEC as spec,  "); 
		hqlBuffer.append("t1.ORDSUB_QTY as deliverqty,  ");
		hqlBuffer.append("t2.ORDER_VEN_QTY as orderqty,  ");
		hqlBuffer.append("t1.ORDSUB_QTY as sendedqty,  "); //数量
		hqlBuffer.append("t1.ORDSUB_BATNO as batno,  "); //批号
		hqlBuffer.append("t1.ORDSUB_INVNO as invno,  "); //发票号
		hqlBuffer.append("t1.ORDSUB_EXPDATE as expdate,  "); //效期
		hqlBuffer.append("t1.ORDSUB_RP as rp,  "); //进价
		hqlBuffer.append(" round(t1.ORDSUB_RP*t1.ORDSUB_QTY,2) as rpamt,  ");
		hqlBuffer.append("t2.ORDER_ID as orderitmid,  "); // 订单表主键	id
		hqlBuffer.append("t5.HOSPITAL_NAME as hopname,  "); 
		hqlBuffer.append("t4.NAME as manf  ");
		hqlBuffer.append("from T_ORD_ORDERDETAILSUB t1 ");
		hqlBuffer.append("LEFT JOIN T_ORD_ORDERDETAIL t2 ON T1.ORDSUB_DETAIL_ID = t2.ORDER_ID ");
		hqlBuffer.append("LEFT JOIN T_VEN_INC t3 ON t3.VEN_INC_ROWID = t2.ORDER_VEN_INC_ID ");
		hqlBuffer.append("left join t_hop_manf t4 on t4.id=t3.VEN_INC_MANFID ");
		hqlBuffer.append("left join T_SYS_HOSPITAL t5 on t5.HOSPITAL_ID=t2.ORDER_HOP_ID ");
		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
        

		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getInvno())){
			hqlBuffer.append("and t1.ORDSUB_INVNO=:invno ");
			hqlParamMap.put("invno", dto.getInvno());
		}
		
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), DeliverItmVo.class, "t1.ORDSUB_ID");
}
}
