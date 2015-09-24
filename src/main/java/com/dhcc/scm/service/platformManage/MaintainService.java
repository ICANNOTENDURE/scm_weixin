package com.dhcc.scm.service.platformManage;

import com.dhcc.scm.dto.platformManage.MaintainDto;
import com.dhcc.scm.entity.platformManage.Maintain;

/**
 * <p>标题: MaintainService.java</p>
 * <p>业务描述:统一运维及安全管理平台  运维记录模块Service接口</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月16日
 * @version V1.0 
 */
public interface MaintainService {

	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者更新运维记录
	* @param:         maintain
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午7:58:06
	*/
	public void saveOrUpdate(Maintain maintain);
	
	/** 
	* 方法名:          saveMaintain
	* 方法功能描述:    保存运维记录
	* @param:         maintain
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午7:58:40
	*/
	public void saveMaintain(Maintain maintain);
	
	/** 
	* 方法名:          updateMaintain
	* 方法功能描述:    更新运维记录
	* @param:         maintain
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午7:59:04
	*/
	public void updateMaintain(Maintain maintain);
	
	/** 
	* 方法名:          delMaintainById
	* 方法功能描述:    根据ID删除运维记录
	* @param:         id
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午7:59:36
	*/
	public void delMaintainById(String id);
	
	/** 
	* 方法名:          delMaintain
	* 方法功能描述:    删除运维记录
	* @param:         maintain
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午8:00:08
	*/
	public void delMaintain(Maintain maintain);
	 
	/** 
	* 方法名:          findMaintainById
	* 方法功能描述:    根据Id查询运维记录
	* @param:         id
	* @return:        Maintain
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午8:00:31
	*/
	public Maintain findMaintainById(String id);
	
	/** 
	* 方法名:          findMaintain
	* 方法功能描述:    分页查询运维记录
	* @param:         pagerModel
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午8:01:04
	*/
	public void findMaintain(MaintainDto maintainDto);
}
