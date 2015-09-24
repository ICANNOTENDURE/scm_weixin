package com.dhcc.scm.dao.platformManage;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.platformManage.GatewayDto;
import com.dhcc.scm.entity.platformManage.Cert;
import com.dhcc.scm.entity.platformManage.Gateway;
import com.dhcc.scm.entity.platformManage.Server;

/**
 * <p>标题: GatewayDao.java</p>
 * <p>业务描述:统一运维及安全管理平台  网关管理持久化操作类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月31日
 * @version V1.0 
 */
@Repository
public class GatewayDao extends HibernatePersistentObjectDAO<Gateway> {

	/* (非 Javadoc)   
	* <p>Title: buildPagerModelQuery</p>   
	* <p>Description: </p>   
	* @param pagerModel
	* @param dto   
	* @see com.dhcc.framework.hibernate.dao.PersistentObjectDAO#buildPagerModelQuery(com.dhcc.framework.common.PagerModel, com.dhcc.framework.transmission.dto.BaseDto)   
	*/
	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		// TODO Auto-generated method stub
		GatewayDto gatewayDto = (GatewayDto)dto;
		pagerModel.setCountProName("g.gatewayId");
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		buildQuery(hqlParamMap, gatewayDto, hqlStr);
		logger.info("\n=============hqlStr============\n"+hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}
	
	/** 
	* 方法名:          buildQuery
	* 方法功能描述:    通过gatewayId分页查找应用系统安装配置信息
	* @param:         map,gateway,hqlStr
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月9日 下午6:46:35
	*/
	private void buildQuery(Map<String, Object> map, GatewayDto gatewayDto, StringBuilder hqlStr) {
		Gateway gateway = gatewayDto.getGateway();
		Server server = gatewayDto.getServer();
		Cert cert = gatewayDto.getCert();
		
		hqlStr.append("select new com.dhcc.pms.entity.vo.platformManage.GatewayVo( ");
		hqlStr.append("g.gatewayId, ");
		hqlStr.append("s.serverType, ");
		hqlStr.append("s.serverName, ");
		hqlStr.append("c.certSerialNum, ");
		hqlStr.append("g.port, ");
		hqlStr.append("g.onlineState, ");
		hqlStr.append("g.systemType, ");
		hqlStr.append("g.version, ");
		hqlStr.append("g.regTime, ");
		hqlStr.append("g.updateTime, ");
		hqlStr.append("g.useState) ");
		hqlStr.append("from Server s right join s.gateways g left join g.cert as c ");
		hqlStr.append("where 1=1 ");
		
		if (gateway != null) {
			String gatewayId = gateway.getGatewayId();
			if (!"".equals(gatewayId)) {
				hqlStr.append("and g.gatewayId=:gatewayId ");
				map.put("gatewayId", gatewayId);
			}
			String port = gateway.getPort();
			if (!"".equals(port)) {
				hqlStr.append("and g.port=:port ");
				map.put("port", port);
			}
			String onlineState = gateway.getOnlineState();
			if (!"".equals(onlineState)) {
				hqlStr.append("and g.onlineState=:onlineState ");
				map.put("onlineState", onlineState);
			}
			String systemType = gateway.getSystemType();
			if (!"".equals(systemType)) {
				hqlStr.append("and g.systemType=:systemType ");
				map.put("systemType", systemType);
			}
			String version = gateway.getVersion();
			if (!"".equals(version)) {
				hqlStr.append("and g.version=:version ");
				map.put("version", version);
			}
			if (gateway.getRegTime() != null) {
				if (null != gatewayDto.getRegTimeS()) {
					hqlStr.append("and g.regTime>=:regTimeS ");
					map.put("regTimeS", gatewayDto.getRegTimeS());
				}
				if (null != gatewayDto.getRegTimeE()) {
					hqlStr.append("and g.regTime<=:regTimeE ");
					map.put("regTimeE", gatewayDto.getRegTimeE());
				}
			}
			if (gateway.getUpdateTime() != null) {
				if (null != gatewayDto.getUpdateTimeS()) {
					hqlStr.append("and g.updateTime>=:updateTimeS ");
					map.put("updateTimeS", gatewayDto.getUpdateTimeS());
				}
				if (null != gatewayDto.getUpdateTimeE()) {
					hqlStr.append("and g.updateTime<=:updateTimeE ");
					map.put("updateTimeE", gatewayDto.getUpdateTimeE());
				}
			}
			String useState = gateway.getUseState();
			if (!"".equals(useState)) {
				hqlStr.append("and g.useState=:useState ");
				map.put("useState", useState);
			}
		}
		
		if (server != null) {
			String serverType = server.getServerType();
			if (!"".equals(serverType)) {
				hqlStr.append("and s.serverType=:serverType ");
				map.put("serverType", serverType);
			}
			String serverName = server.getServerName();
			if (!"".equals(serverName)) {
				hqlStr.append("and s.serverName=:serverName ");
				map.put("serverName", serverName);
			}
		}
		
		if (cert != null) {
			String certSerialNum = cert.getCertSerialNum();
			if (!"".equals(certSerialNum)) {
				hqlStr.append("and c.certSerialNum=:certSerialNum ");
				map.put("certSerialNum", certSerialNum);
			}
		}
		
		if ((gatewayDto.getColumnName().length() != 0)&&(gatewayDto.getColumnValue().length() != 0)) {
			hqlStr.append("and g."+gatewayDto.getColumnName()+" like :columnValue ");
			map.put("columnValue", "%"+gatewayDto.getColumnValue()+"%");
		}
	}

}
