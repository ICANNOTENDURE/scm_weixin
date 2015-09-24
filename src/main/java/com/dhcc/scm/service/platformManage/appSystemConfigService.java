package com.dhcc.scm.service.platformManage;

import com.dhcc.scm.entity.platformManage.Server;

/**
 * <p>标题: appSystemConfigService.java</p>
 * <p>业务描述:统一运维及安全管理平台  应用系统安装配置管理模块Service接口</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年10月9日
 * @version V1.0 
 */
public interface appSystemConfigService {

	public void saveOrUpdate(Server server);
	
	public void delServer(Server server);
	
	
}
