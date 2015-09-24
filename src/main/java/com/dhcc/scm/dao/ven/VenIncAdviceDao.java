/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.ven;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ven.VenIncAdviceDto;
import com.dhcc.scm.entity.ven.VenIncAdvice;
import com.dhcc.scm.entity.vo.ven.ReplayVenIncVo;
import com.dhcc.scm.entity.vo.ven.VenIncAdviceVo;

@Repository
public class VenIncAdviceDao extends HibernatePersistentObjectDAO<VenIncAdvice> {

	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;

	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

	}

	public void save(VenIncAdvice venIncAdvice) {

		super.save(venIncAdvice);
	}

	public void delete(VenIncAdvice venIncAdvice) {

		super.delete(venIncAdvice);
	}

	public void update(VenIncAdvice venIncAdvice) {

		super.update(venIncAdvice);
	}

	public VenIncAdvice findById(VenIncAdvice venIncAdvice) {

		return super.findById(venIncAdvice.getVenIncAdviceId());

	}

	/**
	 * 
	 * @Title: listVenIncAdvice
	 * @Description: TODO(查询咨询列表)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年5月5日 下午8:22:07
	 */
	public void listVenIncAdvice(VenIncAdviceDto dto) {
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.VENINCADVICE_ID     as  askid, ");
		hqlBuffer.append("t1.VENINCADVICE_ASK     as  ask, ");
		hqlBuffer.append("t1.VENINCADVICE_REPLAY     as  replay, ");
		hqlBuffer.append("t1.VENINCADVICE_ASK_DATE  as  askdate, ");
		hqlBuffer.append("t1.VENINCADVICE_REPLAY_DATE  as  replaydate, ");
		hqlBuffer.append("t2.alias as  askname, ");
		hqlBuffer.append("t3.alias as  replayname ");
		hqlBuffer.append("from ");
		hqlBuffer.append("T_VEN_INC_ADVICE t1 left join T_SYS_NORMAL_ACCOUNT t2 on t1.VENINCADVICE_ASK_USERID=t2.ACCOUNT_ID ");
		hqlBuffer.append(" left join T_SYS_NORMAL_ACCOUNT t3 on t1.VENINCADVICE_REPLAY_USERID=t3.ACCOUNT_ID ");
		hqlBuffer.append(" where 1=1 ");

		if (dto.getVenIncAdvice() != null) {
			if (dto.getVenIncAdvice().getVenIncAdviceIncId() != null) {
				hqlBuffer.append(" and t1.VENINCADVICE_INC_ID=:venincid");
				hqlParamMap.put("venincid", dto.getVenIncAdvice().getVenIncAdviceIncId());
			}
		}
		if (dto.getAskUserId() != null) {
			hqlBuffer.append(" and t1.VENINCADVICE_ASK_USERID=:askuserid");
			hqlParamMap.put("askuserid", dto.getAskUserId());
		}
		if (StringUtils.isNotBlank(dto.getReplyFlag())) {
			if (dto.getReplyFlag().equals("1")) {
				hqlBuffer.append(" and t1.VENINCADVICE_REPLAY_USERID is null ");
			}
		}
		hqlBuffer.append(" order by t1.VENINCADVICE_ASK_DATE desc");
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), VenIncAdviceVo.class, "t1.VENINCADVICE_ID");
	}

	/**
	 * 
	 * @Title: getVenIncAdviceNum
	 * @Description: TODO(查询供应商待回复咨询条数)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年5月6日 上午10:42:50
	 */
	public int getVenIncAdviceNum(Date date) {

		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.VENINCADVICE_ID ");
		hqlBuffer.append("from ");
		hqlBuffer.append("T_VEN_INC_ADVICE t1 left join T_VEN_INC t2 on t1.VENINCADVICE_INC_ID=t2.VEN_INC_ROWID ");
		hqlBuffer.append(" left join T_VEN_VENDOR t3 on t3.VEN_ID=t2.VEN_INC_VENID ");
		hqlBuffer.append(" where 1=1 ");

		Long vendor = WebContextHolder.getContext().getUserInfo().getVendorIdLong();
		hqlBuffer.append(" and t3.VEN_ID=:venid");
		hqlParamMap.put("venid", vendor);
		hqlBuffer.append(" and t1.VENINCADVICE_REPLAY_USERID is null ");

		if (date != null) {
			hqlBuffer.append(" and t1.VENINCADVICE_ASK_DATE>=:date");
			hqlParamMap.put("date", date);
		}
		return jdbcTemplateWrapper.getResultCountWithValuesMap(hqlBuffer.toString(), "t1.VENINCADVICE_ID", hqlParamMap);
	}

	/**
	 * 
	 * @Title: getVenIncAdviceList
	 * @Description: TODO(供应商待回复商品列表)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年5月6日 下午12:12:21
	 */
	@SuppressWarnings("unchecked")
	public void getVenIncAdviceList(VenIncAdviceDto dto) {

		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select ");
		hqlBuffer.append(" COUNT (*) as qty, ");
		hqlBuffer.append(" t1.VENINCADVICE_INC_ID as inc ");
		hqlBuffer.append("from ");
		hqlBuffer.append("T_VEN_INC_ADVICE t1 left join T_VEN_INC t2 on t1.VENINCADVICE_INC_ID=t2.VEN_INC_ROWID ");
		hqlBuffer.append(" left join T_VEN_VENDOR t3 on t3.VEN_ID=t2.VEN_INC_VENID ");
		hqlBuffer.append(" where 1=1 ");

		
		if(StringUtils.isNotBlank(dto.getReplyFlag())){
			hqlBuffer.append(" and t1.VENINCADVICE_REPLAY_USERID is null ");
		}
		if(dto.getVendorId()!=null){
			hqlBuffer.append(" and t3.VEN_ID=:venid");
			hqlParamMap.put("venid", dto.getVendorId());
		}
		if(dto.getAskUserId()!=null){
			hqlBuffer.append(" and t1.VENINCADVICE_ASK_USERID=:askid");
			hqlParamMap.put("askid", dto.getAskUserId());
		}
		hqlBuffer.append(" GROUP BY T1.VENINCADVICE_INC_ID ");
		hqlBuffer.append(" ORDER BY 1 desc ");
		dto.getPageModel().setTotals(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ReplayVenIncVo.class, hqlParamMap).size());
		dto.setReplayVenIncVos(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ReplayVenIncVo.class, hqlParamMap, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "T1.VENINCADVICE_INC_ID"));

	}
	
	/**
	 * 
	 * @Title: getVenIncAdviceNum
	 * @Description: TODO(查询护士咨询以回复未读的条数)
	 * @param @param dto 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年5月6日 上午10:42:50
	 */
	@SuppressWarnings("unchecked")
	public int getNurIncAdviceNum(VenIncAdviceDto dto) {

		DetachedCriteria criteria = DetachedCriteria.forClass(VenIncAdvice.class);
		criteria.add(Restrictions.eq("venIncAdviceAskUserId", Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId())));

		if(StringUtils.isNotBlank(dto.getReadFlag())){
			//以读
			if(dto.getReadFlag().equals("1")){
				criteria.add(Restrictions.eq("venIncAdviceReadFlag", dto.getReadFlag()));
			}
			//未读
			if(dto.getReadFlag().equals("2")){
				criteria.add(Restrictions.isNull("venIncAdviceReadFlag"));
			}
		}
		if(StringUtils.isNotBlank(dto.getReplyFlag())){
			if(dto.getReplyFlag().equals("1")){
				criteria.add(Restrictions.isNotNull("venIncAdviceReplayUserId"));
			}
		}
		criteria.setProjection(Projections.rowCount());
		List<Long> incAdvices=super.findByDetachedCriteria(criteria);
		return incAdvices.get(0).intValue();
	}
}
