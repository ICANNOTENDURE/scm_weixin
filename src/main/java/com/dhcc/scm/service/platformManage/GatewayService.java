package com.dhcc.scm.service.platformManage;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dto.platformManage.GatewayDto;
import com.dhcc.scm.entity.platformManage.Gateway;

/**
 * <p>标题: GatewayService.java</p>
 * <p>业务描述:统一运维及安全管理平台  网关管理模块Service接口</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月31日
 * @version V1.0 
 */
public interface GatewayService {

	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改网关信息
	* @param:         gateway
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月1日 上午12:15:34
	*/
	public void saveOrUpdate(Gateway gateway);
	
	/** 
	* 方法名:          saveGateway
	* 方法功能描述:    保存网关信息
	* @param:         gateway
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月1日 上午12:17:26
	*/
	public void saveGateway(Gateway gateway);
	
	/** 
	* 方法名:          updateGateway
	* 方法功能描述:    更新网关信息
	* @param:         gateway
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月9日 下午4:19:07
	*/
	public void updateGateway(Gateway gateway);
	
	/** 
	* 方法名:          delGatewayById
	* 方法功能描述:    根据ID删除网关信息
	* @param:         id
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月1日 上午12:18:05
	*/
	public void delGatewayById(String id);
	
	/** 
	* 方法名:          delGateway
	* 方法功能描述:    删除网关信息
	* @param:         gateway
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月4日 上午10:13:52
	*/
	public void delGateway(Gateway gateway);
	
	/** 
	* 方法名:          findGatewayById
	* 方法功能描述:    根据ID查询网关信息
	* @param:         id
	* @return:        Gateway
	* @Author:        李飞
	* @Create Date:   2013年9月1日 上午12:18:42
	*/	
	public Gateway findGatewayById(String id);
	
	/** 
	* 方法名:          findGateway
	* 方法功能描述:    分页查询网关信息
	* @param:         pagermodel
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月1日 上午12:19:26
	*/
	public void findGateway(PagerModel pagerModel, GatewayDto gatewayDto);
}
