package com.dhcc.scm.service.platformManage;

import com.dhcc.scm.dto.platformManage.SystemVersionDto;
import com.dhcc.scm.entity.platformManage.SystemVersion;

/**
 * <p>标题: SystemVersionService.java</p>
 * <p>业务描述:统一运维及安全管理平台  业务系统版本管理模块Service接口</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月16日
 * @version V1.0 
 */
/**
* <p>标题: SystemVersionService.java</p>
* <p>业务描述:统一运维及安全管理平台</p>
* <p>公司:东华软件股份公司</p>
* <p>版权:dhcc2013</p>
* @author 李飞
* @date 2013年10月18日
* @version V1.0 
*/
/**
* <p>标题: SystemVersionService.java</p>
* <p>业务描述:统一运维及安全管理平台</p>
* <p>公司:东华软件股份公司</p>
* <p>版权:dhcc2013</p>
* @author 李飞
* @date 2013年10月18日
* @version V1.0 
*/
/**
* <p>标题: SystemVersionService.java</p>
* <p>业务描述:统一运维及安全管理平台</p>
* <p>公司:东华软件股份公司</p>
* <p>版权:dhcc2013</p>
* @author 李飞
* @date 2013年10月18日
* @version V1.0 
*/
public interface SystemVersionService {

	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改业务系统版本信息
	* @param:         systemVersion
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午5:46:57
	*/
	public void saveOrUpdate(SystemVersion systemVersion);
	
	/** 
	* 方法名:          saveSystemVersion
	* 方法功能描述:    保存业务系统版本信息
	* @param:         systemVersion
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午6:25:56
	*/
	public void saveSystemVersion(SystemVersion systemVersion);
	
	/** 
	* 方法名:          updateSystemVersion
	* 方法功能描述:    更新业务系统版本信息
	* @param:         systemVersion
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午6:27:03
	*/
	public void updateSystemVersion(SystemVersion systemVersion);
	
	/** 
	* 方法名:          delSystemVersionById
	* 方法功能描述:    根据ID删除业务系统版本信息
	* @param:         id
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午6:27:45
	*/
	public void delSystemVersionById(String id);
	
	/** 
	* 方法名:          delSystemVersion
	* 方法功能描述:    删除业务系统版本信息
	* @param:         systemVersion
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午6:28:22
	*/
	public void delSystemVersion(SystemVersion systemVersion);
	
	/** 
	* 方法名:          findSystemVersion
	* 方法功能描述:    根据ID查询业务系统版本信息
	* @param:         是包含汉字的字符串
	* @return:        其他非简体汉字返回 '0';
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午6:32:52
	*/
	public SystemVersion findSystemVersionById(String id);
	
	/** 
	* 方法名:          systemVersionList
	* 方法功能描述:    获取安装包树列表
	* @param:         SystemVersionDto
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月18日 下午2:17:01
	*/
	public void getSystemVersion(SystemVersionDto systemVersionDto);
}
