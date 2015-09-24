package com.dhcc.scm.dao.platformManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.platformManage.OrgDto;
import com.dhcc.scm.entity.platformManage.Org;
import com.dhcc.scm.entity.platformManage.Server;
import com.dhcc.scm.entity.vo.platformManage.OrgVo;

/**
 * <p>标题: OrgDao.java</p>
 * <p>业务描述:统一运维及安全管理平台  机构管理持久化操作类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月29日
 * @version V1.0 
 */
@Repository
public class OrgDao extends HibernatePersistentObjectDAO<Org> {
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;

	/**  
	 * @return jdbcTemplateWrapper 
	 */
	public JdbcTemplateWrapper getJdbcTemplateWrapper() {
		return jdbcTemplateWrapper;
	}

	/**  
	 * @param jdbcTemplateWrapper jdbcTemplateWrapper 
	 */
	public void setJdbcTemplateWrapper(JdbcTemplateWrapper jdbcTemplateWrapper) {
		this.jdbcTemplateWrapper = jdbcTemplateWrapper;
	}

	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		OrgDto orgDto = (OrgDto)dto;
		pagerModel.setCountProName("o.orgId");
		Map<String, Object> map = new HashMap<String,Object>();
		StringBuilder hqlStr = new StringBuilder(64);
		
		buildQuery(map, orgDto, hqlStr);
		pagerModel.setHqlParamMap(map);
		pagerModel.setQueryHql(hqlStr.toString());
	}
	
	/** 
	* 方法名:          buildQuery
	* 方法功能描述:    通过orgId分页查找机构信息
	* @param:         map,org,hqlStr
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月9日 下午12:13:52
	*/
	private void buildQuery(Map<String, Object> map, OrgDto orgDto, StringBuilder hqlStr) {
		Org org = orgDto.getOrg();
		Server server = orgDto.getServer();
		//hqlStr.append("select new Org( ");
		hqlStr.append("select new com.dhcc.pms.entity.vo.platformManage.OrgVo( ");
		hqlStr.append("o.orgId, ");
		hqlStr.append("o.orgCenterId, ");
		hqlStr.append("o.orgName, ");
		hqlStr.append("o.orgCode, ");
		hqlStr.append("o.addrState, ");
		hqlStr.append("o.addrCity, ");
		hqlStr.append("o.addrCounty, ");
		hqlStr.append("o.addrTown, ");
		hqlStr.append("o.addrStreet, ");
		hqlStr.append("o.addrHouseNumber, ");
		hqlStr.append("o.addrDistrictsCode, ");
		hqlStr.append("o.useState, ");
		hqlStr.append("s.serverType, ");
		hqlStr.append("s.serverName) ");
		//hqlStr.append("s.ip) ");
//		hqlStr.append("from Org o left join o.gateway.server s ");
		hqlStr.append("from Org o,Gateway g,Server s ");
		hqlStr.append("where o.gatewayId=g.gatewayId ");
		hqlStr.append("and g.serverId=s.serverId ");
		
		if (org != null) {
			String orgName = org.getOrgName();
			if (!"".equals(orgName)) {
				hqlStr.append("and o.orgName=:orgName ");
				map.put("orgName", orgName);
			}
			String orgCode = org.getOrgCode();
			if (!"".equals(orgCode)) {
				hqlStr.append("and o.orgCode=:orgCode ");
				map.put("orgCode", orgCode);
			}
			String addrState = org.getAddrState();
			if (!"".equals(addrState)) {
				hqlStr.append("and o.addrState=:addrState ");
				map.put("addrState", addrState);
			}
			String addrCity = org.getAddrCity();
			if (!"".equals(addrCity)) {
				hqlStr.append("and o.addrCity=:addrCity ");
				map.put("addrCity", addrCity);
			}
			String addrCounty = org.getAddrCounty();
			if (!"".equals(addrCounty)) {
				hqlStr.append("and o.addrCounty=:addrCounty ");
				map.put("addrCounty", addrCounty);
			}
			String addrTown = org.getAddrTown();
			if (!"".equals(addrTown)) {
				hqlStr.append("and o.addrTown=:addrTown ");
				map.put("addrTown", addrTown);
			}
			String addrStreet = org.getAddrStreet();
			if (!"".equals(addrStreet)) {
				hqlStr.append("and o.addrStreet=:addrStreet ");
				map.put("addrStreet", addrStreet);
			}
			String addrHouseNumber = org.getAddrHouseNumber();
			if (!"".equals(addrHouseNumber)) {
				hqlStr.append("and o.addrHouseNumber=:addrHouseNumber ");
				map.put("addrHouseNumber", addrHouseNumber);
			}
			String addrDistrictsCode = org.getAddrDistrictsCode();
			if (!"".equals(addrDistrictsCode)) {
				hqlStr.append("and o.addrDistrictsCode=:addrDistrictsCode ");
				map.put("addrDistrictsCode", addrDistrictsCode);
			}
			String useState = org.getUseState();
			if (!"".equals(useState)) {
				hqlStr.append("and o.useState=:useState ");
				map.put("useState", useState);
			}
		}
		
		if (server != null) {
			String serverName = server.getServerName();
			if (!"".equals(serverName)) {
				hqlStr.append("and s.serverName=:serverName ");
				map.put("serverName", serverName);
			}
		}
		logger.info("\n---------------hqlStr---------------\n"+hqlStr);
	}
	
	public void buildOrgSqlQery(OrgDto orgDto) {
		PagerModel pagerModel = orgDto.getPageModel();
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuilder sqlStr = new StringBuilder();
		
		sqlStr.append("SELECT T1.ORG_NAME,T1.ORG_CODE,T1.ADDR_STATE,T1.ADDR_CITY,T1.ADDR_COUNTY,T1.ADDR_TOWN,T1.ADDR_STREET,T1.ADDR_HOUSE_NUMBER,T1.ADDR_DISTRICTS_CODE,T6.SERVER_NAME,T6.SERVER_TYPE,T6.IP,T6.IP_TYPE,T6.PORT ");
		sqlStr.append("FROM PMS.T_ORG T1 LEFT JOIN ");
		sqlStr.append("(SELECT T2.GATEWAY_ID,T5.SERVER_NAME,T5.SERVER_TYPE,T5.IP,T5.IP_TYPE,T5.PORT ");
		sqlStr.append("FROM PMS.T_GATEWAY T2 LEFT JOIN ");
		sqlStr.append("(SELECT T3.SERVER_ID,T3.SERVER_NAME,T3.SERVER_TYPE,T4.IP,T4.IP_TYPE,T3.PORT FROM PMS.T_SERVER T3,PMS.T_SERVER_IP T4 ");
		sqlStr.append("WHERE T4.SERVER_ID=T3.SERVER_ID ");
		sqlStr.append("AND T4.IP_ID is not null) T5 ");
		sqlStr.append("ON T2.SERVER_ID=T5.SERVER_ID) T6 ");
		sqlStr.append("ON T1.GATEWAY_ID=T6.GATEWAY_ID ");
		
		@SuppressWarnings("unchecked")
		List<OrgVo> orgVos = jdbcTemplateWrapper.queryAllMatchListWithParaMap(
			sqlStr.toString(), OrgVo.class, map, pagerModel.getPageNo(),
			pagerModel.getPageSize(), "ORG_ID");
		//orgDto.setOrgVos(orgVos);
		pagerModel.setTotals(orgVos.size());
		pagerModel.setPageData(orgVos);
	}

}
