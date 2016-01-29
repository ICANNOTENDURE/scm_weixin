package com.dhcc.scm.dao.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.comment.CommentDto;
import com.dhcc.scm.entity.hop.Evalute;
import com.dhcc.scm.entity.vo.chart.ChartVO;
import com.dhcc.scm.entity.vo.comment.CommentVenVO;

/**
 * 
 * @author Administrator
 * 
 */
@Repository
public class CommentDao extends HibernatePersistentObjectDAO<Evalute> {
	
	@Resource
	private CommentDao commentDao;
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;

	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

	}

	/**
	 * 
	 * @Title: listEvalute
	 * @Description: TODO(获取评价结果)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年2月5日 下午7:42:22
	 */
	public void listVenEval(CommentDto dto) {
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append(" select * from ( ");
		hqlBuffer.append(" select id,NAME, ");
		hqlBuffer.append(" value1, ");
		hqlBuffer.append(" value2, ");
		hqlBuffer.append(" value3, ");
		hqlBuffer.append(" value4, ");
		hqlBuffer.append(" value5, ");
		hqlBuffer.append(" totals, ");
		hqlBuffer.append(" value1/totals*100 pec1,");
		hqlBuffer.append(" value2/totals*100 pec2,");
		hqlBuffer.append(" value3/totals*100 pec3,");
		hqlBuffer.append(" value4/totals*100 pec4,");
		hqlBuffer.append(" value5/totals*100 pec5 from (");
		hqlBuffer.append(" select t3.H_NAME as name,  ");
		hqlBuffer.append(" t3.H_VENID as id,  ");
		hqlBuffer.append(" count(case ele_result when '5' then 1 else null end) value5, ");
		hqlBuffer.append(" count(case ele_result when '4' then 1 else null end) value4, ");
		hqlBuffer.append(" count(case ele_result when '3' then 1 else null end) value3, ");
		hqlBuffer.append(" count(case ele_result when '2' then 1 else null end) value2, ");
		hqlBuffer.append(" count(case ele_result when '1' then 1 else null end) value1, ");
		hqlBuffer.append(" count(*) totals ");
		hqlBuffer.append(" from t_hop_evalute t1 left join t_ven_vendor t2 on t2.ven_id=t1.ele_vendorid    ");
		hqlBuffer.append(" left join t_hop_vendor t3 on t3.H_VENDORID=t1.ele_vendorid   where 1=1 and t3.H_auditflag='Y' ");
		if(dto.getStartDate()!=null){
			hqlBuffer.append(" and t1.ELE_DATE >=:startdate");
			hqlParamMap.put("startdate", dto.getStartDate());
		}
		if(dto.getEndDate()!=null){
			hqlBuffer.append(" and t1.ELE_DATE-1 <=:enddate");
			hqlParamMap.put("enddate", dto.getEndDate());
		}
		hqlBuffer.append(" and t3.H_HOPID ="+WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		hqlBuffer.append(" group by t3.H_NAME,t3.H_VENID ");
		hqlBuffer.append(") as yy ) as yyy where 1=1 ");
		if(StringUtils.isNotBlank(dto.getQueryResult())){
			if(StringUtils.isNotBlank(dto.getQueryCondition())){
				if(StringUtils.isNotBlank(dto.getQueryType())){
					if(StringUtils.isNotBlank(dto.getQueryValue())){
						String type="";
						if(dto.getQueryType().equals("1")){
							type="pec";
						}else{
							type="value";
						}
						switch(dto.getQueryResult())
						{
							case "5":
								hqlBuffer.append(" and "+type+"5 ");
								break;
							case "4":
								hqlBuffer.append(" and "+type+"4 ");
								break;
							case "3":
								hqlBuffer.append(" and "+type+"3 ");
								break;
							case "2":
								hqlBuffer.append(" and "+type+"2 ");
								break;
							case "1":
								hqlBuffer.append(" and "+type+"1 ");
								break;
						}
						switch(dto.getQueryCondition())
						{
							case "eq":
								hqlBuffer.append(" = "+dto.getQueryValue());
								break;
							case "gt":
								hqlBuffer.append(" > "+dto.getQueryValue());
								break;
							case "ge":
								hqlBuffer.append(" >= "+dto.getQueryValue());
								break;
							case "lt":
								hqlBuffer.append(" < "+dto.getQueryValue());
								break;
							case "le":
								hqlBuffer.append(" <= "+dto.getQueryValue());
								break;
						}
					}
				}
			}
		}
		
		dto.getPageModel().setTotals(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), CommentVenVO.class, hqlParamMap).size());
		dto.getPageModel().setPageData(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), CommentVenVO.class, hqlParamMap, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "t2.ven_id"));
	}
	
	
	/**
	 * 
	* @Title: listVenIncEval 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月19日 下午12:00:35
	 */
	public void listVenIncEval(CommentDto dto) {
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append(" select * from ( ");
		hqlBuffer.append(" select id,NAME,name2, ");
		hqlBuffer.append(" avgspeed, ");
		hqlBuffer.append(" avgservice, ");
		hqlBuffer.append(" avgdescription, ");
		hqlBuffer.append(" avgresult, ");
		hqlBuffer.append(" value1, ");
		hqlBuffer.append(" value2, ");
		hqlBuffer.append(" value3, ");
		hqlBuffer.append(" value4, ");
		hqlBuffer.append(" value5, ");
		hqlBuffer.append(" totals, ");
		hqlBuffer.append(" value1/totals*100 pec1,");
		hqlBuffer.append(" value2/totals*100 pec2,");
		hqlBuffer.append(" value3/totals*100 pec3,");
		hqlBuffer.append(" value4/totals*100 pec4,");
		hqlBuffer.append(" value5/totals*100 pec5 from (");
		hqlBuffer.append(" select t4.VEN_INC_NAME as name,  ");
		hqlBuffer.append(" t3.H_NAME as name2,  ");
		hqlBuffer.append(" t4.VEN_INC_ROWID as id,  ");
		hqlBuffer.append(" avg(ELE_SPEED) avgspeed, ");
		hqlBuffer.append(" avg(ELE_SERVICE) avgservice, ");
		hqlBuffer.append(" avg(ELE_DESCRIPTION) avgdescription, ");
		hqlBuffer.append(" avg(ele_result) avgresult, ");
		hqlBuffer.append(" count(case ele_result when '5' then 1 else null end) value5, ");
		hqlBuffer.append(" count(case ele_result when '4' then 1 else null end) value4, ");
		hqlBuffer.append(" count(case ele_result when '3' then 1 else null end) value3, ");
		hqlBuffer.append(" count(case ele_result when '2' then 1 else null end) value2, ");
		hqlBuffer.append(" count(case ele_result when '1' then 1 else null end) value1, ");
		hqlBuffer.append(" count(*) totals ");
		hqlBuffer.append(" from t_hop_evalute t1 left join t_ven_vendor t2 on t2.ven_id=t1.ele_vendorid    ");
		hqlBuffer.append(" left join t_ven_inc t4 on t1.ELE_VENINCID=t4.VEN_INC_ROWID ");
		hqlBuffer.append(" left join T_VEN_HOP_INC t5 on t5.VEN_INC_ID=t4.VEN_INC_ROWID ");
		hqlBuffer.append(" left join t_hop_vendor t3 on t3.H_VENDORID=t1.ele_vendorid   where 1=1 and t3.H_auditflag='Y' and t5.VEN_HOP_AUDITFLAG='Y' ");
		if(dto.getStartDate()!=null){
			hqlBuffer.append(" and t1.ELE_DATE >=:startdate");
			hqlParamMap.put("startdate", dto.getStartDate());
		}
		if(dto.getEndDate()!=null){
			hqlBuffer.append(" and t1.ELE_DATE-1 <=:enddate");
			hqlParamMap.put("enddate", dto.getEndDate());
		}
		if(dto.getHopVendorId()!=null){
			hqlBuffer.append(" and t3.H_VENID=:vendroid");
			hqlParamMap.put("vendroid", dto.getHopVendorId());
		}
		hqlBuffer.append(" and t3.H_HOPID ="+WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		hqlBuffer.append(" group by t4.VEN_INC_ROWID,t4.VEN_INC_NAME,t3.H_NAME ");
		hqlBuffer.append(") as yy ) as yyy where 1=1 ");
		if(StringUtils.isNotBlank(dto.getQueryResult())){
			if(StringUtils.isNotBlank(dto.getQueryCondition())){
				if(StringUtils.isNotBlank(dto.getQueryType())){
					if(StringUtils.isNotBlank(dto.getQueryValue())){
						String type="";
						if(dto.getQueryType().equals("1")){
							type="pec";
						}else{
							type="value";
						}
						switch(dto.getQueryResult())
						{
							case "5":
								hqlBuffer.append(" and "+type+"5 ");
								break;
							case "4":
								hqlBuffer.append(" and "+type+"4 ");
								break;
							case "3":
								hqlBuffer.append(" and "+type+"3 ");
								break;
							case "2":
								hqlBuffer.append(" and "+type+"2 ");
								break;
							case "1":
								hqlBuffer.append(" and "+type+"1 ");
								break;
						}
						switch(dto.getQueryCondition())
						{
							case "eq":
								hqlBuffer.append(" = "+dto.getQueryValue());
								break;
							case "gt":
								hqlBuffer.append(" > "+dto.getQueryValue());
								break;
							case "ge":
								hqlBuffer.append(" >= "+dto.getQueryValue());
								break;
							case "lt":
								hqlBuffer.append(" < "+dto.getQueryValue());
								break;
							case "le":
								hqlBuffer.append(" <= "+dto.getQueryValue());
								break;
						}
					}
				}
			}
		}
		
		dto.getPageModel().setTotals(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), CommentVenVO.class, hqlParamMap).size());
		dto.getPageModel().setPageData(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), CommentVenVO.class, hqlParamMap, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "t2.ven_id"));
	}
	
	
	@SuppressWarnings("unchecked")
	public void ListVenIncEvalByIncId(CommentDto dto) {
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		hqlBuffer.append(" select ");
		hqlBuffer.append(" t2.NAME as name,  ");
		hqlBuffer.append(" avg(ELE_SPEED) avgspeed, ");
		hqlBuffer.append(" avg(ELE_SERVICE) avgservice, ");
		hqlBuffer.append(" avg(ELE_DESCRIPTION) avgdescription, ");
		hqlBuffer.append(" avg(ele_result) avgresult ");
		hqlBuffer.append(" from t_hop_evalute t1 left join t_ven_vendor t2 on t2.ven_id=t1.ele_vendorid    ");
		hqlBuffer.append(" where t1.ELE_VENINCID ="+dto.getVenIncId());
		hqlBuffer.append(" group by t1.ELE_VENINCID,t2.NAME ");
		List<CommentVenVO> commentVenVOs=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), CommentVenVO.class, hqlParamMap);
		if(commentVenVOs.size()>0){
			dto.setCommentVenVO(commentVenVOs.get(0));
		}
	}
	
	
	/**
	 * 
	* @Title: getIncTag 
	* @Description: TODO(查询商品标签信息) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年6月8日 上午11:51:14
	 */
	@SuppressWarnings("unchecked")
	public List<ChartVO> getIncTag(Long incId) {
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		hqlBuffer.append(" select ");
		hqlBuffer.append(" DISTINCT grp_pro_desc name, ");
		hqlBuffer.append(" count(*) as value ");
		hqlBuffer.append(" from T_HOP_ELESUB t2 left join T_HOP_EVALUTE t1 on t2.ELE_ORD_ID=t1.ELE_ORDERID    ");
		hqlBuffer.append(" LEFT JOIN T_CAT_GROUPPROPERTY t3 ON t3.grp_pro_id=t2.ele_property_id    ");
		hqlBuffer.append(" where t1.ELE_VENINCID ="+incId);
		hqlBuffer.append(" group by grp_pro_desc  ");
		hqlBuffer.append(" order by 2 desc ");
		return jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ChartVO.class, hqlParamMap);
	}
}
