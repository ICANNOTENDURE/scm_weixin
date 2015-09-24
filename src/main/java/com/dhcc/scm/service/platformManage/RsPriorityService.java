package com.dhcc.scm.service.platformManage;

import com.dhcc.scm.dto.platformManage.RsPriorityDto;
import com.dhcc.scm.entity.platformManage.RsPriority;

/**
 * <p>标题: RsPriorityService.java</p>
 * <p>业务描述:统一运维及安全管理平台  接收服务器优先级信息Service接口</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月31日
 * @version V1.0 
 */
public interface RsPriorityService {

	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改接收服务器优先级信息
	* @param:         rsPriority
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月5日 下午5:36:42
	*/
	public void saveOrUpdate(RsPriority rsPriority);
	
	/** 
	* 方法名:          saveRsPriority
	* 方法功能描述:    保存接收服务器优先级信息
	* @param:         rsPriority
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月5日 下午8:37:54
	*/
	public void saveRsPriority(RsPriority rsPriority);
	
	/** 
	* 方法名:          updateRsPriority
	* 方法功能描述:    更新接收服务器优先级信息
	* @param:         rsPriority
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月9日 下午4:24:44
	*/
	public void updateRsPriority(RsPriority rsPriority);
	
	/** 
	* 方法名:          delRsPriority
	* 方法功能描述:    删除接收服务器优先级信息
	* @param:         rsPriority
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月5日 下午5:37:24
	*/
	public void delRsPriority(RsPriority rsPriority);
	
	/** 
	* 方法名:          findRsPriority
	* 方法功能描述:    根据ID查询接收服务器优先级信息
	* @param:         rsPriority
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月5日 下午5:38:28
	*/
	public RsPriority findRsPriorityById(String id);
	
	/** 
	* 方法名:          findRsPriority
	* 方法功能描述:    查询接收服务器优先级信息
	* @param:         pagerModel
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月5日 下午8:39:47
	*/
	public void findRsPriority(RsPriorityDto rsPriorityDto);
}