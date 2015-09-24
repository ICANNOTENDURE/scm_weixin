package com.dhcc.scm.dao.platformManage;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.platformManage.ServerDto;
import com.dhcc.scm.entity.platformManage.Server;
import com.dhcc.scm.entity.vo.platformManage.ServerVo;

/**
 * <p>标题: ServerDao.java</p>
 * <p>业务描述:统一运维及安全管理平台  服务器信息持久化操作类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月13日
 * @version V1.0 
 */
@Repository
public class ServerDao extends HibernatePersistentObjectDAO<Server> {
	
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
		ServerDto serverDto = (ServerDto)dto;
		pagerModel.setCountProName("s.serverId");
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		buildQuery(hqlParamMap, serverDto, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}
	
	/** 
	* 方法名:          buildQuery
	* 方法功能描述:    通过serverId分页查找服务器信息
	* @param:         map,server,hqlStr
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月9日 下午2:35:53
	*/
	private void buildQuery(Map<String, Object>map, ServerDto serverDto, StringBuilder hqlStr) {
		Server server = serverDto.getServer();
		hqlStr.append("select new com.dhcc.pms.entity.vo.platformManage.ServerVo( ");
		hqlStr.append("s.serverId, ");
		hqlStr.append("s.serverType, ");
		hqlStr.append("s.serverName, ");
		hqlStr.append("sip.ipType, ");
		hqlStr.append("sip.ip, ");
		hqlStr.append("s.port, ");
		hqlStr.append("s.onlineState) ");
		hqlStr.append("from Server s left join s.serverIps sip ");
		hqlStr.append("where 1=1 ");
		if (server != null) {
			String serverType = server.getServerType();
			if (!"".equals(serverType)) {
				//hqlStr.append("and serverType = '"+server.getServerType()+"'");
				hqlStr.append("and s.serverType = :serverType ");
				map.put("serverType", serverType);
			}
		}
	}

	/** 
	* 方法名:          findServersInfo
	* 方法功能描述:    获取服务器图形模式悬停显示数据
	* @param:         ServerDto
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年11月25日 下午2:51:17
	*/
	public void findServersInfo(ServerDto serverDto) {	
		Map<String, Object> map = new HashMap<String, Object>();
		
		StringBuilder sqlStr = new StringBuilder();
		sqlStr.append("SELECT T9.SERVER_ID,T9.SERVER_TYPE,T9.SERVER_NAME,T9.ONLINE_STATE,T9.PORT,T9.IP_TYPE,T9.IP,T8.SYSTEM_TYPE,T8.USE_STATE,T8.DATA_UP_NUM,T8.ORG_NAME ");
		sqlStr.append("FROM (SELECT T1.SERVER_ID,T1.SERVER_TYPE,T1.SERVER_NAME,T1.ONLINE_STATE,T1.PORT,T2.IP_TYPE,T2.IP ");
		sqlStr.append("FROM PMS.T_SERVER_IP T2 RIGHT JOIN PMS.T_SERVER T1 ");
		sqlStr.append("ON T2.SERVER_ID=T1.SERVER_ID) T9 LEFT JOIN ");
		sqlStr.append("(SELECT T7.SERVER_ID,T6.DATA_UP_NUM,T7.SYSTEM_TYPE,T7.VERSION,T7.USE_STATE,T7.ORG_NAME ");
		sqlStr.append("FROM (SELECT T3.GATEWAY_ID,T3.SERVER_ID,T3.SYSTEM_TYPE,T3.VERSION,T3.USE_STATE,T5.ORG_ID,T5.ORG_NAME ");
		sqlStr.append("FROM PMS.T_GATEWAY T3 LEFT JOIN PMS.T_ORG T5 ");
		sqlStr.append("ON T3.GATEWAY_ID=T5.GATEWAY_ID AND T5.ORG_ID is not null) T7 ");
		sqlStr.append("LEFT JOIN (SELECT T3.GATEWAY_ID,T3.SERVER_ID,T4.STATISTIC_ID,T4.DATA_UP_NUM ");
		sqlStr.append("FROM PMS.T_GATEWAY T3 LEFT JOIN PMS.T_FLOW T4 ");
		sqlStr.append("ON T3.GATEWAY_ID=T4.GATEWAY_ID AND T4.STATISTIC_ID is not null) T6 ");
		sqlStr.append("ON T6.GATEWAY_ID=T7.GATEWAY_ID AND T6.SERVER_ID=T7.SERVER_ID) T8 ");
		sqlStr.append("ON T8.SERVER_ID=T9.SERVER_ID ");
		
		@SuppressWarnings("unchecked")
		List<ServerVo> serverInfo = jdbcTemplateWrapper.queryAllMatchListWithParaMap(sqlStr.toString(), ServerVo.class, map);
		serverDto.setServerVos(serverInfo);
	}
	
}
