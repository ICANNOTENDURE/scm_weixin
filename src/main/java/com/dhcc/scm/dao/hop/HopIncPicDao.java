/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.hop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.hop.HopIncPicDto;
import com.dhcc.scm.entity.hop.HopIncPic;
import com.dhcc.scm.entity.vo.hop.HopIncPicVo;

@Repository
public class HopIncPicDao extends HibernatePersistentObjectDAO<HopIncPic> {

	@Resource
	private CommonDao commonDao;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		HopIncPicDto hopIncPicDto = (HopIncPicDto) dto;
		HopIncPic hopIncPic = hopIncPicDto.getHopIncPic();

		pagerModel.setCountProName(super.getIdName(HopIncPic.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, hopIncPic, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map<String, Object> hqlParamMap,HopIncPic hopIncPic,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from HopIncPic h");
		//拼接查询条件		
		if (hopIncPic!=null) {
			hqlStr.append(" where 1=1 ");						
			Long hopIncDr=hopIncPic.getIncPicIncid();					
			if(hopIncDr!=null){
				hqlStr.append(" AND h.incPicIncid =:hopIncDr ");
				hqlParamMap.put("hopIncDr",hopIncDr);
			}
					
		}
	}
		
	public void save(HopIncPic hopIncPic){
	
		super.save(hopIncPic);
	}
	
	public void delete(HopIncPic hopIncPic){
		
		super.delete(hopIncPic);
	}
	
	public void update(HopIncPic hopIncPic){
	
		super.update(hopIncPic);
	}
	
	public HopIncPic findById(HopIncPic hopIncPic){

		return super.findById(hopIncPic.getHopIncPicId());

	}

	/**
	 * @param hopIncPicVos
	 * @param hopIncPic
	 * @return 新组建的药品图片显示列表
	 */
	@SuppressWarnings("unchecked")
	public List<HopIncPicVo> getListInfo(PagerModel pagerModel,List<HopIncPicVo> hopIncPicVos,
			HopIncPic hopIncPic) {
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select new com.dhcc.pms.entity.vo.hop.HopIncPicVo(");
		hqlBuffer.append(" hp.hopIncPicId, ");
		hqlBuffer.append(" hp.incPicIncid, ");
		hqlBuffer.append(" h.incName, ");
		hqlBuffer.append(" hp.incPicPath, ");
		hqlBuffer.append(" hp.incPicSeq) ");
		hqlBuffer.append(" from HopIncPic hp , HopInc  h ");
		hqlBuffer.append(" where hp.incPicIncid=h.incId ");
		if (hopIncPic!=null) {								
			Long hopIncDr=hopIncPic.getIncPicIncid();					
			if(hopIncDr!=null){
				hqlBuffer.append(" AND hp.incPicIncid =:hopIncDr ");
				hqlParamMap.put("hopIncDr",hopIncDr);
			}
					
		}
		
		//获取总条数
		pagerModel.setCountProName("INC_PIC_ID");
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
				
		return (List<HopIncPicVo>)findByHqlWithValuesMap(hqlBuffer.toString(), 
				pagerModel.getPageNo(),pagerModel.getPageSize(),hqlParamMap, true);
	}


}
