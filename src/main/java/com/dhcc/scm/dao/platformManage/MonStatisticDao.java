package com.dhcc.scm.dao.platformManage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.StatelessSession;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.platformManage.MonStatisticDto;
import com.dhcc.scm.entity.platformManage.MonStatistic;
import com.dhcc.scm.tool.hql.GetHql;

/**
 * 
* <p>标题: MonStatisticDao.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月1日
* @version V1.0
 */
@Repository
public class MonStatisticDao extends HibernatePersistentObjectDAO<MonStatistic> {

	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		MonStatisticDto monStatisticDto=(MonStatisticDto)dto;
		MonStatistic monStatistic=monStatisticDto.getMonStatistic();
		Map<String, Object> map = new HashMap<String, Object>();
		
		StringBuilder hqlStr=new StringBuilder(64);
		if (monStatistic==null) {
			hqlStr.append("from MonStatistic");
		}else {
			List<String> exceptList=new ArrayList<String>();
			exceptList.add("startTime");
			exceptList.add("endTime");
			GetHql getHql=new GetHql();
			getHql.getHqlByObject(monStatistic,hqlStr,map, exceptList);
		}
		if (monStatisticDto.getStartDate()!=null) {
			if (hqlStr.length()==0) {
				hqlStr.append("from MonStatistic where 1=1");
			}
			hqlStr.append(" And endTime>=:startDate");
			map.put("startDate",monStatisticDto.getStartDate());
		}
		if (monStatisticDto.getEndDate()!=null) {
			if (hqlStr.length()==0) {
				hqlStr.append("from MonStatistic where 1=1");
			}
			hqlStr.append(" And endTime<=:endDate");
			map.put("endDate",monStatisticDto.getEndDate());
		}
		logger.info("\n---------------hqlStr---------------\n"+hqlStr);
		pagerModel.setHqlParamMap(map);
		pagerModel.setCountProName(super.getIdName(MonStatistic.class));
		pagerModel.setQueryHql(hqlStr.toString());
	}
		
	public void save(MonStatistic monStatistic){
	
		super.save(monStatistic);
	}
	
	public void delete(MonStatistic monStatistic){
		
		super.delete(monStatistic);
	}
	
	public void update(MonStatistic monStatistic){
	
		super.update(monStatistic);
	}
	
	public void findById(MonStatistic monStatistic){
		
		super.findById(monStatistic);
	}
	
	public void buildFindLastStaEndTimeQuery(PagerModel pagerModel) {
		StringBuilder hqlStr=new StringBuilder(64);
		//select top 1 * from table order by submitdate desc
		hqlStr.append("from MonStatistic order by endTime desc");
		logger.info("\n---------------hqlStr---------------\n"+hqlStr);
		pagerModel.setCountProName(super.getIdName(MonStatistic.class));
		pagerModel.setQueryHql(hqlStr.toString());
	}
	
	public String ifHaveData() {
		StringBuilder hqlStr=new StringBuilder(64);

		hqlStr.append("select count(*) from MonStatistic where rownum<=1");
		logger.info("\n---------------hqlStr---------------\n"+hqlStr);
		List numList=this.findByHql(hqlStr.toString());
		logger.info("\n---------------hqlStr---------------\n"+numList.get(0));
		String haveData=numList.get(0).toString();
		return haveData;
	}
	
	public void saveStaList(List<MonStatistic> monStatisticList) {
		StatelessSession session = null;
		try {
			session = this.getSessionFactory().openStatelessSession();
			session.beginTransaction();
			for(int i=0;i<monStatisticList.size();i++){
				session.insert(monStatisticList.get(i));
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}finally{
			if(session!=null){
				session.close();
			}
		}
	}
	
}
