package com.dhcc.scm.service.platformManage;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.entity.platformManage.RsConfig;

/**
 * <p>标题: RsConfigService.java</p>
 * <p>业务描述:统一运维及安全管理平台  接收服务器配置信息模块Service接口</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月17日
 * @version V1.0 
 */
public interface RsConfigService {

	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或修改接收服务器配置信息
	* @param:         rsConfig
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:06:19
	*/
	public void saveOrUpdate(RsConfig rsConfig);
	
	/** 
	* 方法名:          saveRsConfig
	* 方法功能描述:    保存接收服务器配置信息
	* @param:         rsConfig
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:07:50
	*/
	public void saveRsConfig(RsConfig rsConfig);
	
	/** 
	* 方法名:          updateRsConfig
	* 方法功能描述:    更新接收服务器配置信息
	* @param:         rsConfig
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:08:19
	*/
	public void updateRsConfig(RsConfig rsConfig);
	
	/** 
	* 方法名:          delRsConfigById
	* 方法功能描述:    根据ID删除接收服务器配置信息
	* @param:         id
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:08:49
	*/
	public void delRsConfigById(String id);
	
	/** 
	* 方法名:          delRsConfig
	* 方法功能描述:    删除接收服务器配置信息
	* @param:         是包含汉字的字符串
	* @return:        其他非简体汉字返回 '0';
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:09:29
	*/
	public void delRsConfig(RsConfig rsConfig);
	
	/** 
	* 方法名:          findRsConfigById
	* 方法功能描述:    根据ID查询接收服务器配置信息
	* @param:         id
	* @return:        RsConfig
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:10:33
	*/
	public RsConfig findRsConfigById(String id);
	
	/** 
	* 方法名:          findRsConfig
	* 方法功能描述:    分页查询接收服务器配置信息
	* @param:         pagerModel
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:11:09
	*/
	public void findRsConfig(PagerModel pagerModel);
}
