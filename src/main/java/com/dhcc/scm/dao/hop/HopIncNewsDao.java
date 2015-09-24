/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.hop;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.hop.HopIncNewsDto;
import com.dhcc.scm.entity.hop.HopIncNews;
import com.dhcc.scm.entity.vo.hop.HopIncNewsVo;

@Repository
public class HopIncNewsDao extends HibernatePersistentObjectDAO<HopIncNews> {
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {

	}
	
	
	/**
	 * 
	* @Title: list 
	* @Description: TODO(查询新闻列表) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月11日 下午3:14:08
	 */
	public void list(HopIncNewsDto dto){
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.INCNEWS_ID     as  newsid, ");
		hqlBuffer.append("t1.INCNEWS_TITLE     as  newstitle, ");
		hqlBuffer.append("t1.INCNEWS_PATH     as  newspath, ");
		hqlBuffer.append("t1.INCNEWS_DATE     as  newsdate, ");
		hqlBuffer.append("t1.INCNEWS_CONTENT  as  newscontent, ");
		hqlBuffer.append("t1.INCNEWS_READCOUNT  as  readcount, ");
		hqlBuffer.append("t2.alias as  username ");
		hqlBuffer.append("from ");
		hqlBuffer.append("T_HOP_INC_NEWS t1 left join T_SYS_NORMAL_ACCOUNT t2 on t1.INCNEWS_USERID=t2.ACCOUNT_ID ");
		hqlBuffer.append(" where 1=1 ");


		if (dto.getHopIncNews() != null) {
			if(StringUtils.isNotBlank(dto.getHopIncNews().getIncNewsType())){
				hqlBuffer.append(" and t1.INCNEWS_TYPE=:type");
				hqlParamMap.put("type", dto.getHopIncNews().getIncNewsType());
			}
			
		}

		hqlBuffer.append(" order by t1.INCNEWS_DATE desc");
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), HopIncNewsVo.class, "t1.INCNEWS_ID");
	}


}
