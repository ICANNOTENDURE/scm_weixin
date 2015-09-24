package com.dhcc.scm.dao.platformManage;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.platformManage.MonSysDto;
import com.dhcc.scm.entity.platformManage.MonSys;
import com.dhcc.scm.tool.hql.GetHql;

/**
 * 
* <p>标题: MonSysDao.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月1日
* @version V1.0
 */
@Repository
public class MonSysDao extends HibernatePersistentObjectDAO<MonSys> {

	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		MonSysDto monSysDto=(MonSysDto)dto;
		MonSys monSys=monSysDto.getMonSys();
		Map<String, Object> map = new HashMap<String, Object>();
		
		StringBuilder hqlStr=new StringBuilder(64);
		if (monSys==null) {
			hqlStr.append("from MonSys");
		}else {
			List<String> exceptList=new ArrayList<String>();
			exceptList.add("recordTime");
			GetHql getHql=new GetHql();
			getHql.getHqlByObject(monSys,hqlStr,map, exceptList);
		}
		if (monSysDto.getStartDate()!=null) {
			if (hqlStr.length()==0) {
				hqlStr.append("from MonSys where 1=1");
			}
			hqlStr.append(" And recordTime>=:startDate");
			map.put("startDate",monSysDto.getStartDate());
		}
		if (monSysDto.getEndDate()!=null) {
			if (hqlStr.length()==0) {
				hqlStr.append("from MonSys where 1=1");
			}
			hqlStr.append(" And recordTime<=:endDate");
			map.put("endDate",monSysDto.getEndDate());
		}
		logger.info("\n---------------hqlStr---------------\n"+hqlStr);
		pagerModel.setHqlParamMap(map);
		pagerModel.setCountProName(super.getIdName(MonSys.class));
		pagerModel.setQueryHql(hqlStr.toString());
	}
		
	public void save(MonSys monSys){
	
		super.save(monSys);
	}
	
	public void delete(MonSys monSys){
		
		super.delete(monSys);
	}
	
	public void update(MonSys monSys){
	
		super.update(monSys);
	}
	
	public void findById(MonSys monSys){
		
		super.findById(monSys);
	}
	
	public Date getMonStartDate() {
		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append("select recordTime from MonSys where rownum=1");
		logger.info("\n---------------hqlStr---------------\n"+hqlStr);
		List<Date> timeList=this.findByHql(hqlStr.toString());
		Date startDate=null;
		if (timeList.size()>0) {
			startDate=timeList.get(0);
		}
		return startDate;
	}
	
	public List<MonSys> getMonSysByDate(Date start,Date end) {
		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append("from MonSys where recordTime>=? and recordTime<=?");
		logger.info("\n---------------hqlStr---------------\n"+hqlStr);
		List<MonSys> monSysList=this.findByHql(hqlStr.toString(),start,end);
		return monSysList;
	}
	
}
