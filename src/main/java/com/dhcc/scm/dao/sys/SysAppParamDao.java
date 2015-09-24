/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.sys.SysAppParamDto;
import com.dhcc.scm.entity.sys.SysAppParam;

@Repository
public class SysAppParamDao extends HibernatePersistentObjectDAO<SysAppParam> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		SysAppParamDto sysAppParamDto = (SysAppParamDto) dto;
		SysAppParam sysAppParam = sysAppParamDto.getSysAppParam();

		pagerModel.setCountProName(super.getIdName(SysAppParam.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, sysAppParam, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,SysAppParam sysAppParam,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from SysAppParam where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		
	public void save(SysAppParam sysAppParam){
	
		super.save(sysAppParam);
	}
	
	public void delete(SysAppParam sysAppParam){
		
		super.delete(sysAppParam);
	}
	
	public void update(SysAppParam sysAppParam){
	
		super.update(sysAppParam);
	}
	
	/**
	 * 
	* @Title: getOrderAudit 
	* @Description: TODO(查询护士完成订单定单是否需要审核) 
	* @param  -4 科主任审核,
	* @param  -3 计划科审核,
	* @param  -2 采购科审核, 
	* @return Long    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年6月23日 下午3:06:15
	 */
	@SuppressWarnings("unchecked")
	public Long getOrderAudit(Long par){
		
		long ret=1;
		DetachedCriteria criteria = createDetachedCriteria(SysAppParam.class);
		criteria.setProjection(Property.forName("appValue"));
		criteria.add(Restrictions.eq("appCode",BaseConstants.ORDER_AUDIT));
		criteria.add(Restrictions.eq("appHopId",WebContextHolder.getContext().getVisit().getUserInfo().getHopId()));

		criteria.addOrder(Order.desc("appValue"));
		List<String> sysAppParams=super.findByDetachedCriteria(criteria);
	
		if(sysAppParams.size()>0){
			if(par==null){
				if(StringUtils.isNotBlank(sysAppParams.get(0))){
					ret=Long.valueOf(sysAppParams.get(0));
				}else{
					ret=1l;
				}
			}else{
				ret=par;
				for(String value:sysAppParams){
					if(StringUtils.isNotBlank(value)){
						if(Long.valueOf(value).longValue()>ret){
							ret=Long.valueOf(value).longValue();
							break;
						}
					}
				}
				if(ret==par.longValue()){
					ret=1l;
				}
			}
		}
		return ret;
	}

}
