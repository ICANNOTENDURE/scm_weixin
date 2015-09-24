package com.dhcc.scm.service.platformManage;

import java.util.List;

import com.dhcc.scm.dto.platformManage.ServerDto;
import com.dhcc.scm.dto.platformManage.SystemVersionDto;
import com.dhcc.scm.entity.platformManage.Server;
import com.dhcc.scm.entity.platformManage.SystemVersion;

/**
 * <p>标题: ServerService.java</p>
 * <p>业务描述:统一运维及安全管理平台  服务器管理模块Service接口</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月16日
 * @version V1.0 
 */
public interface ServerService {

	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改服务器信息
	* @param:         server
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午4:27:31
	*/
	public void saveOrUpdate(Server server);
	
	/** 
	* 方法名:          saveServer
	* 方法功能描述:    保存服务器信息
	* @param:         server
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午4:28:15
	*/
	public void saveServer(Server server);
	
	/** 
	* 方法名:          updateServer
	* 方法功能描述:    更新服务器信息
	* @param:         server
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午4:29:00
	*/
	public void updateServer(Server server);
	
	/** 
	* 方法名:          delServerById
	* 方法功能描述:    根据ID删除服务器信息
	* @param:         id
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午4:29:33
	*/
	public void delServerById(String id);
	
	/** 
	* 方法名:          delServer
	* 方法功能描述:    删除服务器信息
	* @param:         server
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午4:30:06
	*/
	public void delServer(Server server);
	
	/** 
	* 方法名:          findServerById
	* 方法功能描述:    根据Id查找服务器信息
	* @param:         ServerDto
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月29日 上午11:09:08
	*/
	public void findServerGraph(ServerDto serverDto);
	
	/** 
	* 方法名:          findServer
	* 方法功能描述:    分页查询服务器信息
	* @param:         ServerDto
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午4:31:31
	*/
	public void findServerList(ServerDto serverDto);
	
	/** 
	* 方法名:          getSystemVersion
	* 方法功能描述:    获取安装包信息
	* @param:         SystemVersionDto
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年11月15日 下午4:29:45
	*/
	public List<SystemVersion> getSystemVersion(SystemVersionDto systemVersionDto);
	
	/** 
	* 方法名:          findServerId
	* 方法功能描述:    将新增服务器部分注册信息保存至数据库并返回其唯一标识符
	* @param:         ServerDto
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年11月25日 下午4:19:49
	*/
	public void findServerId(ServerDto serverDto);
	
}
