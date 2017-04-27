/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.sys;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import  com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.scm.entity.sys.SysMessage;
import com.dhcc.scm.entity.sys.SysMessageTo;
import com.dhcc.scm.entity.vo.sys.SysMessageCheckVo;
import com.dhcc.scm.entity.vo.sys.SysMessageToVo;
import com.dhcc.scm.dto.sys.SysMessageDto;
import com.dhcc.scm.dto.sys.SysMessageToDto;

@Repository
public class SysMessageToDao extends HibernatePersistentObjectDAO<SysMessageTo> {
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		SysMessageToDto sysMessageToDto = (SysMessageToDto) dto;
		SysMessageTo sysMessageTo = sysMessageToDto.getSysMessageTo();

		pagerModel.setCountProName(super.getIdName(SysMessageTo.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, sysMessageTo, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}
	@SuppressWarnings("unchecked")
	public void list(SysMessageToDto dto){
		    StringBuilder hqlBuffer = new StringBuilder();
		    hqlBuffer.append("select (case t.TO_TYPE when 'H' then (select  c.HOSPITAL_NAME from t_sys_ctloc a,t_sys_hospital c where a.CTLOC_ID=t.TO_DEPARTID and a.CTLOC_HOSPID=c.HOSPITAL_ID)  else '供应商' end) as retype, ");
		    hqlBuffer.append(" (case t.TO_TYPE when 'H' then (select a.CTLOC_NAME from t_sys_ctloc a where a.CTLOC_ID=t.TO_DEPARTID) when 'V' then (select b.`NAME` from t_ven_vendor b where b.VEN_ID=t.TO_DEPARTID) else '' end) as typedesc,");
		    hqlBuffer.append("  t.TO_ID , ");    
		    hqlBuffer.append(" t.TO_MESSAGEID as tomessageid,");
		    hqlBuffer.append(" t.TO_READFLAG ,  ");
		    hqlBuffer.append(" t.TO_READDATE , ");
		    hqlBuffer.append("  t.TO_WX_OPENID ");
		
			hqlBuffer.append(" from t_sys_message_to t  where 1=1 ");
			Map<String, Object> hqlParamMap = new HashMap<String, Object>();		
			
			if(dto.getToMessageId()!=null){
				hqlBuffer.append("  and  t.TO_MESSAGEID=:toMessageId ");
				hqlParamMap.put("toMessageId", dto.getToMessageId());
				
				
			}
		
			
			if(dto.getPageModel()==null){
				dto.setPageModel(new PagerModel());
			}
			Integer total=jdbcTemplateWrapper.getResultCount(hqlBuffer.toString(), hqlParamMap);
			dto.getPageModel().setTotals(total);
			List<SysMessageToVo> dataList=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), SysMessageToVo.class, hqlParamMap,dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "t.TO_ID");
			dto.getPageModel().setPageData(dataList);
		}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,SysMessageTo sysMessageTo,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from SysMessageTo where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		

}
