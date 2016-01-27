package com.dhcc.scm.dao.chart;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.common.entity.vo.fusioncharts.Chart;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.chart.OrdVenDistributionDto;
import com.dhcc.scm.entity.vo.chart.BarVO;
import com.dhcc.scm.entity.vo.chart.ChartVO;
import com.dhcc.scm.entity.vo.chart.ChartVenHotSaleVO;
import com.dhcc.scm.entity.vo.chart.EvaluteChartVO;

/**
 * 
 * @author Administrator
 *
 */
@Repository
public class ChartDao extends HibernatePersistentObjectDAO<Chart> {
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

	}

	
	/**
	 * 
	* @Title: ChartDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年9月1日 下午1:32:43
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public void listOrdVenDistribution(OrdVenDistributionDto dto){
		

		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append("select count(*) as value , ");
		hqlBuffer.append("t.ORDER_VEN_ID,t1.NAME as name ");
		hqlBuffer.append(" from T_ORD_ORDERDETAIL t,t_ven_vendor t1   ");
		hqlBuffer.append(" where  t1.VEN_ID=t.ORDER_VEN_ID  group by t.ORDER_VEN_ID,t1.NAME   ");		
		dto.setChartVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ChartVO.class, hqlParamMap, 1, 5, "name"));
	}
	
	/**
	 * 
	* @Title: ChartDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @return:void 
	* @author zhouxin  
	* @date 2014年9月1日 下午3:27:29
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public void listOrdReqQty(OrdVenDistributionDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		//hqlBuffer.append("select to_char(t1.ORDER_ODATE,'yyyy-MM')as  name , ");
		hqlBuffer.append("select date_format(t1.ORDER_ODATE,'%Y-%c')as  name , ");
		hqlBuffer.append(" sum(t1.ORDER_VEN_QTY) as value, ");
		hqlBuffer.append(" sum(t2.devqty)  as value1 ");
		hqlBuffer.append(" from T_ORD_ORDERDETAIL t1  ");
		hqlBuffer.append(" left join (SELECT ORDSUB_DETAIL_ID,sum(ORDSUB_QTY) as devqty from T_ORD_ORDERDETAILSUB GROUP BY ORDSUB_DETAIL_ID) t2 on t2.ORDSUB_DETAIL_ID=t1.ORDER_ID ");
		hqlBuffer.append(" where  t1.ORDER_ODATE>=curdate()-365 ");
		hqlBuffer.append(" group by date_format(t1.ORDER_ODATE,'%Y-%c')    ");
		dto.setChartVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ChartVO.class, hqlParamMap, 1, 6, "name"));
	
	}
	
	/**
	 * 
	* @Title: listEvalute 
	* @Description: TODO(获取评价结果) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年2月5日 下午7:42:22
	 */
	@SuppressWarnings("unchecked")
	public void listEvalute(OrdVenDistributionDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append("select t2.name as name,  ");
		hqlBuffer.append(" count(case ele_result when '5' then 1 else null end) value, ");
		hqlBuffer.append(" count(case ele_result when '4' then 1 else null end) value1, ");
		hqlBuffer.append(" count(case ele_result when '3' then 1 else null end) value2, ");
		hqlBuffer.append(" count(case ele_result when '2' then 1 else null end) value3, ");
		hqlBuffer.append(" count(case ele_result when '1' then 1 else null end) value4 ");
		hqlBuffer.append(" from t_hop_evalute t1 left join t_ven_vendor t2 on t2.ven_id=t1.ele_vendorid   ");
		hqlBuffer.append(" group by t2.name ");
		dto.setEvaluteChartVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), EvaluteChartVO.class, hqlParamMap, 1, 6, "value"));
		
		
	}
	
	@SuppressWarnings("unchecked")
	public void listLocAmt(OrdVenDistributionDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append(" select  ");
		hqlBuffer.append(" T2.CTLOC_NAME as name , ");
		hqlBuffer.append(" SUM (T1.ORDER_RP * T1.ORDER_VEN_QTY) as value ");
		hqlBuffer.append(" FROM ");
		hqlBuffer.append(" T_ORD_ORDERDETAIL t1, ");
		hqlBuffer.append(" T_SYS_CTLOC t2 ");
		hqlBuffer.append(" WHERE T1.ORDER_RECLOC = t2.CTLOC_ID ");
		if(dto.getStartDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE+1>=:startdate");
			hqlParamMap.put("startdate", dto.getStartDate());
		}else{
			return;
		}
		if(dto.getEndDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE-1<=:enddate");
			hqlParamMap.put("enddate", dto.getEndDate());
		}else{
			return;
		}
		hqlBuffer.append(" GROUP BY t2.CTLOC_NAME ");
		hqlBuffer.append(" order BY  value desc ");
		dto.setChartVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ChartVO.class, hqlParamMap));
	
	}
	
	/**
	 * 
	* @Title: listLocIncPrice 
	* @Description: TODO(查询科室采购商品平均价) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月12日 下午12:03:27
	 */
	@SuppressWarnings("unchecked")
	public void listLocIncPrice(OrdVenDistributionDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append("select ");
		hqlBuffer.append(" T2.CTLOC_NAME as name, ");
		hqlBuffer.append(" avg(t1.ORDER_RP)  as value ");
		hqlBuffer.append(" from T_ORD_ORDERDETAIL T1   ");
		hqlBuffer.append(" left join T_SYS_CTLOC t2 on T1.ORDER_RECLOC = t2.CTLOC_ID ");
		hqlBuffer.append(" left join T_VEN_INC t3 on T1.ORDER_VEN_INC_ID = t3.VEN_INC_ROWID ");
		hqlBuffer.append(" WHERE  1=1 ");
		if(dto.getStartDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE>=:startdate");
			hqlParamMap.put("startdate", dto.getStartDate());
		}
		if(dto.getEndDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE-1<=:enddate");
			hqlParamMap.put("enddate", dto.getEndDate());
		}
		if(dto.getSubCatId()!=0){
			hqlBuffer.append(" and T3.VEN_INC_CATID=:subcatid");
			hqlParamMap.put("subcatid", dto.getSubCatId());
		}
		hqlBuffer.append(" GROUP BY t2.CTLOC_NAME ");
		hqlBuffer.append(" order BY  value desc ");
		dto.setChartVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ChartVO.class, hqlParamMap));
	
	}
	@SuppressWarnings("unchecked")
	public void listLocIncPriceByMon(OrdVenDistributionDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append("select ");
		//hqlBuffer.append(" to_char(t1.ORDER_ODATE,'yyyy-MM')as  name, ");
		hqlBuffer.append(" date_format(t1.ORDER_ODATE,'%Y-%c')as  name, ");
		hqlBuffer.append(" T2.CTLOC_NAME as value1, ");
		hqlBuffer.append(" avg(t1.ORDER_RP)  as value ");
		hqlBuffer.append(" from T_ORD_ORDERDETAIL T1   ");
		hqlBuffer.append(" left join T_SYS_CTLOC t2 on T1.ORDER_RECLOC = t2.CTLOC_ID ");
		hqlBuffer.append(" left join T_VEN_INC t3 on T1.ORDER_VEN_INC_ID = t3.VEN_INC_ROWID ");
		hqlBuffer.append(" WHERE  1=1 ");
		if(dto.getStartDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE>=:startdate");
			hqlParamMap.put("startdate", dto.getStartDate());
		}
		if(dto.getEndDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE-1<=:enddate");
			hqlParamMap.put("enddate", dto.getEndDate());
		}
		if(dto.getSubCatId()!=0){
			hqlBuffer.append(" and T3.VEN_INC_CATID=:subcatid");
			hqlParamMap.put("subcatid", dto.getSubCatId());
		}
		hqlBuffer.append(" GROUP BY date_format(t1.ORDER_ODATE,'%Y-%m'),t2.CTLOC_NAME ");
		hqlBuffer.append(" order BY  name  ");
		dto.setChartVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ChartVO.class, hqlParamMap));
	
	}
	
	
	/**
	 * 
	* @Title: venSevenDayAmt 
	* @Description: TODO(供应商七天销售额) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月18日 上午10:05:30
	 */
	@SuppressWarnings("unchecked")
	public void venSevenDayAmt(OrdVenDistributionDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		hqlBuffer.append("select date_format(t1.ORDER_ODATE,'%Y-%c-%e')as  name , ");
		hqlBuffer.append(" sum(t1.ORDER_VEN_QTY*t1.ORDER_RP) as value ");
		hqlBuffer.append(" from T_ORD_ORDERDETAIL t1  ");
		hqlBuffer.append(" where  t1.ORDER_ODATE>=NOW()-7 ");
		hqlBuffer.append(" and t1.ORDER_VEN_ID= "+Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong()));
		hqlBuffer.append(" group by date_format(t1.ORDER_ODATE,'%Y-%c-%e') ");
		dto.setChartVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ChartVO.class, hqlParamMap));
	
	}
	
	/**
	 * 
	* @Title: venOneMonthHotSale 
	* @Description: TODO(近一个月商品销售数量) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月18日 下午3:24:26
	 */
	@SuppressWarnings("unchecked")
	public void venOneMonthHotSale(OrdVenDistributionDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		hqlBuffer.append("select t1.ORDER_VEN_INC_ID as  incid , ");
		hqlBuffer.append(" sum(t1.ORDER_VEN_QTY) as orderqty ");
		hqlBuffer.append(" from T_ORD_ORDERDETAIL t1  ");
		hqlBuffer.append(" where  t1.ORDER_ODATE>=NOW()-30 ");
		hqlBuffer.append(" and t1.ORDER_VEN_ID= "+Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong()));
		hqlBuffer.append(" group by t1.ORDER_VEN_INC_ID order by orderqty desc");
		dto.setChartVenHotSaleVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ChartVenHotSaleVO.class, hqlParamMap, 1, 6, "orderqty"));
	}
	
	
	
	/**
	 * 
	* @Title: listLocAmtGrpByDate 
	* @Description: TODO(按月，季度，或者年来汇总科室金额(全院)) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月22日 上午11:15:51
	 */
	@SuppressWarnings("unchecked")
	public void listLocAmtGrpByDate(OrdVenDistributionDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		String grpType="yyyy-MM-dd";
		if(StringUtils.isNotBlank(dto.getQueryType())){
			if(!dto.getQueryType().equals("0")){
				grpType=dto.getQueryType();
			}
			
		}
		hqlBuffer.append(" select  ");
		hqlBuffer.append(" to_char(t1.ORDER_ODATE,'"+grpType+"') legend, ");
		hqlBuffer.append(" T2.CTLOC_NAME as category , ");
		if((StringUtils.isNotBlank(dto.getHopIncId()))&&(!dto.getHopIncId().equals("0"))){
			hqlBuffer.append(" round(avg (NVL(T1.ORDER_RP ,0)),2) as serie ");
		}else{
			hqlBuffer.append(" SUM (T1.ORDER_RP * T1.ORDER_VEN_QTY) as serie ");
		}
		hqlBuffer.append(" FROM ");
		hqlBuffer.append(" T_ORD_ORDERDETAIL t1, ");
		hqlBuffer.append(" T_SYS_CTLOC t2 ");
		hqlBuffer.append(" WHERE T1.ORDER_RECLOC = t2.CTLOC_ID ");
		if(dto.getStartDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE+1>=:startdate");
			hqlParamMap.put("startdate", dto.getStartDate());
		}
		if(dto.getEndDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE-1<=:enddate");
			hqlParamMap.put("enddate", dto.getEndDate());
		}
		if((StringUtils.isNotBlank(dto.getHopIncId()))&&(!dto.getHopIncId().equals("0"))){
			hqlBuffer.append(" and T1.ORDER_HOP_INC_ID=:hopincid");
			hqlParamMap.put("hopincid", dto.getHopIncId());
		}
		hqlBuffer.append(" and T1.ORDER_HOP_ID="+WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		hqlBuffer.append(" GROUP BY to_char(t1.ORDER_ODATE,'"+grpType+"'),t2.CTLOC_NAME ");
		hqlBuffer.append(" order BY   legend ");
		dto.setBarVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), BarVO.class, hqlParamMap));
	
	}
	
	/**
	 * 
	* @Title: listLocCatAmt 
	* @Description: TODO(当前登录科室采购金额按商品汇总) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月22日 下午5:23:46
	 */
	@SuppressWarnings("unchecked")
	public void listLocIncAmt(OrdVenDistributionDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		hqlBuffer.append(" select  ");
		hqlBuffer.append(" T2.VEN_INC_NAME name, ");
		hqlBuffer.append(" round(SUM (T1.ORDER_RP * T1.ORDER_VEN_QTY),2) as value ");
		hqlBuffer.append(" FROM ");
		hqlBuffer.append(" T_ORD_ORDERDETAIL t1 ");
		hqlBuffer.append(" LEFT JOIN T_VEN_INC t2 ON t1.ORDER_VEN_INC_ID = t2.VEN_INC_ROWID ");
		hqlBuffer.append(" WHERE 1=1 ");
		if(dto.getStartDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE+1>=:startdate");
			hqlParamMap.put("startdate", dto.getStartDate());
		}
		if(dto.getEndDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE-1<=:enddate");
			hqlParamMap.put("enddate", dto.getEndDate());
		}
		hqlBuffer.append(" and T1.ORDER_RECLOC="+WebContextHolder.getContext().getVisit().getUserInfo().getLocId());
		hqlBuffer.append(" GROUP BY t2.VEN_INC_ROWID,t2.VEN_INC_NAME ");
		hqlBuffer.append(" order BY   value ");
		dto.setChartVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ChartVO.class, hqlParamMap));
	
	}
	
	/**
	 * 
	* @Title: listLocGroupAmt 
	* @Description: TODO(当前登录科室采购金额按商品分类汇总) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月25日 下午4:48:37
	 */
	@SuppressWarnings("unchecked")
	public void listLocGroupAmt(OrdVenDistributionDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		hqlBuffer.append(" select  ");
		hqlBuffer.append(" t5.SG_DESC name, ");
		hqlBuffer.append(" t4.SDG_DESC value1, ");
		hqlBuffer.append(" SUM (T1.ORDER_RP * T1.ORDER_VEN_QTY) as value ");
		hqlBuffer.append(" FROM ");
		hqlBuffer.append(" T_ORD_ORDERDETAIL t1 ");
		hqlBuffer.append(" LEFT JOIN T_VEN_INC t2 ON t1.ORDER_VEN_INC_ID = t2.VEN_INC_ROWID ");
		hqlBuffer.append(" left join T_CAT_DRUGGROUPITM t3 on t2.VEN_INC_CATID=t3.SDGI_ID ");
		hqlBuffer.append(" left join T_CAT_DRUGGROUP t4 on t3.SDGI_PARREF_ID=t4.SDG_ID ");
		hqlBuffer.append(" left join T_CAT_GROUP t5 on t4.SDG_PARREF_ID=SG_ID ");
		hqlBuffer.append(" WHERE 1=1 ");
		if(dto.getStartDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE+1>=:startdate");
			hqlParamMap.put("startdate", dto.getStartDate());
		}
		if(dto.getEndDate()!=null){
			hqlBuffer.append(" and T1.ORDER_ODATE-1<=:enddate");
			hqlParamMap.put("enddate", dto.getEndDate());
		}
		hqlBuffer.append(" and T1.ORDER_RECLOC="+WebContextHolder.getContext().getVisit().getUserInfo().getLocId());
		hqlBuffer.append(" GROUP BY t4.SDG_DESC,t5.SG_DESC ");
		hqlBuffer.append(" order by t5.SG_DESC ");
		dto.setChartVOs(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ChartVO.class, hqlParamMap));
	
	}
}
