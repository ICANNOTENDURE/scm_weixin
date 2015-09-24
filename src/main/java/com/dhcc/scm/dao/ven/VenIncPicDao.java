/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.ven;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import  com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.scm.dto.ven.VenIncPicDto;
import com.dhcc.scm.entity.ven.VenIncPic;
import com.dhcc.scm.entity.vo.ven.VenIncPicVo;

@Repository
public class VenIncPicDao extends HibernatePersistentObjectDAO<VenIncPic> {
	
	@Resource
	private CommonDao commonDao;

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		VenIncPicDto venIncPicDto = (VenIncPicDto) dto;
		VenIncPic venIncPic = venIncPicDto.getVenIncPic();

		pagerModel.setCountProName(super.getIdName(VenIncPic.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, venIncPic, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map<String, Object> hqlParamMap,VenIncPic venIncPic,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from VenIncPic v");
		//拼接查询条件		
		if (venIncPic!=null) {
			hqlStr.append(" where 1=1 ");						
			Long venIncDr=venIncPic.getVenIncPicId();				
			if(venIncDr!=null){
				hqlStr.append(" AND v.venPicIncid =:venIncDr ");
				hqlParamMap.put("venIncDr",venIncDr);
			}
							
		}
	}
		
	public void save(VenIncPic venIncPic){
	
		super.save(venIncPic);
	}
	
	public void delete(VenIncPic venIncPic){
		
		super.delete(venIncPic);
	}
	
	public void update(VenIncPic venIncPic){
	
		super.update(venIncPic);
	}
	
	public VenIncPic findById(VenIncPic venIncPic){

		return super.findById(venIncPic.getVenIncPicId());

	}

	/**
	 * @param venIncPicVos
	 * @param venIncPic
	 * @return 供应商药品图片信息显示列表
	 */
	@SuppressWarnings("unchecked")
	public List<VenIncPicVo> getListInfo(PagerModel pagerModel,List<VenIncPicVo> venIncPicVos,
			VenIncPic venIncPic) {
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select new com.dhcc.pms.entity.vo.ven.VenIncPicVo(");
		hqlBuffer.append(" v.venIncPicId, ");
		hqlBuffer.append(" v.venIncPicVenincid, ");
		hqlBuffer.append(" vi.venIncName, ");
		hqlBuffer.append(" v.venIncPicPath, ");
		hqlBuffer.append(" v.venIncPicSeq) ");
		hqlBuffer.append(" from VenIncPic v , VenInc  vi ");
		hqlBuffer.append(" where v.venIncPicVenincid=vi.venIncId ");
		
		if (venIncPic!=null) {								
			Long venIncDr=venIncPic.getVenIncPicVenincid();				
			if(venIncDr!=null){
				hqlBuffer.append(" AND v.venIncPicVenincid =:venIncDr ");
				hqlParamMap.put("venIncDr",venIncDr);
			}
							
		}
		//获取总条数
		pagerModel.setCountProName("VEN_INC_PIC_ID");
		pagerModel.setQueryHql(hqlBuffer.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
		int totalRows = pagerModel.getTotals();
		if (totalRows == 0) {
			totalRows = commonDao.getResultCountWithValuesMap(
					pagerModel.getQueryHql(), pagerModel.getHqlParamMap(),
					pagerModel.getCountProName(), false).intValue();
		}
		if (totalRows == 0) {
			pagerModel.setPageData(new ArrayList<Object>(1));
			return null;
		}
		pagerModel.setTotals(totalRows);
		return (List<VenIncPicVo>)findByHqlWithValuesMap(hqlBuffer.toString(), 
				pagerModel.getPageNo(),pagerModel.getPageSize(),hqlParamMap, true);
	}
	
	
	
}
