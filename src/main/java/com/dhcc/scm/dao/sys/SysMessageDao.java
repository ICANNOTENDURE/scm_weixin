/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.sys;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import  com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.sys.SysMessage;
import com.dhcc.scm.entity.sys.SysMessageTo;
import com.dhcc.scm.entity.vo.ord.PutShippSumVo;
import com.dhcc.scm.entity.vo.sys.SysMessageCheckVo;
import com.dhcc.scm.entity.vo.ven.VenStatisticsVo;
import com.dhcc.scm.dto.ord.PutShippSumDto;
import com.dhcc.scm.dto.sys.SysMessageDto;
import com.dhcc.scm.dto.ven.VenDeliverDto;

@Repository
public class SysMessageDao extends HibernatePersistentObjectDAO<SysMessage> {
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		SysMessageDto sysMessageDto = (SysMessageDto) dto;
		SysMessage sysMessage = sysMessageDto.getSysMessage();

		pagerModel.setCountProName(super.getIdName(SysMessage.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, sysMessage, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}
	@SuppressWarnings("unchecked")
	public void list(SysMessageDto dto){
		    StringBuilder hqlBuffer = new StringBuilder();
		    hqlBuffer.append("select (case t.MESSAGE_SEND_TYPE when 'H' then (select a.HOSPITAL_NAME from t_sys_hospital a where a.HOSPITAL_ID=t.MESSAGE_SEND_POINTER) when 'V' then (select b.`NAME` from t_ven_vendor b where b.VEN_ID=t.MESSAGE_SEND_POINTER) else '' end) as typedesc,t.MESSAGE_SEND_TYPE, ");
		    hqlBuffer.append(" t.message_id, ");
		    hqlBuffer.append("  t.message_title, ");
		    hqlBuffer.append(" t.message_content,");
		    hqlBuffer.append(" t.message_type,  ");
		    hqlBuffer.append(" t.message_status, ");
		    hqlBuffer.append("  t.message_totype, ");
		    hqlBuffer.append(" t.message_date, ");
		    hqlBuffer.append(" t.message_createdate, ");
		    hqlBuffer.append(" t.message_createuser  ");
			hqlBuffer.append(" from t_sys_message t  where 1=1 ");
			Map<String, Object> hqlParamMap = new HashMap<String, Object>();		
			
			if(dto.getMessageId()!=null){
				hqlBuffer.append("  and  t.message_id=:messageId ");
				hqlParamMap.put("messageId", dto.getMessageId());
			}
			
			if(dto.getOrdStart()!=null){
				hqlBuffer.append("  and  t.message_createdate >=:ordstart ");
				hqlParamMap.put("ordstart", dto.getOrdStart());
			}
			
			if(dto.getOrdEnd()!=null){
				hqlBuffer.append("  and  t.message_createdate <=:ordend ");
				hqlParamMap.put("ordend", dto.getOrdEnd());
			}
			
			if(dto.getPageModel()==null){
				dto.setPageModel(new PagerModel());
			}
			Integer total=jdbcTemplateWrapper.getResultCount(hqlBuffer.toString(), hqlParamMap);
			dto.getPageModel().setTotals(total);
			List<SysMessageCheckVo> dataList=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), SysMessageCheckVo.class, hqlParamMap,dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "t.message_id");
			dto.getPageModel().setPageData(dataList);
		}
	
	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,SysMessage sysMessage,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from SysMessage where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE SysMessage.messageId=:messageId ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		public Long asaveOrUpdate(SysMessage entity) {
			Session session = getCurrentSession();
			//session.beginTransaction();
			session.save(entity);
			//session.getTransaction().commit();
			return entity.getMessageId();
		};

}
