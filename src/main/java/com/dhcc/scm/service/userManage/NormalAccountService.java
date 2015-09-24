package com.dhcc.scm.service.userManage;

import com.dhcc.scm.dto.userManage.NormalAccountDto;
import com.dhcc.scm.entity.userManage.NormalAccount;

/**
 * 标题: NormalAccountService.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年10月16日
 * @version V1.0 
 */
public interface NormalAccountService {

	/**
	 * 
	* 方法名:          normalAccountList
	* 方法功能描述:     分页获取普通用户帐户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 上午10:07:41
	 */
	public void normalAccountList(NormalAccountDto normalAccountDto) throws Exception;
	
	/**
	 * 
	* 方法名:          save
	* 方法功能描述:    保存普通用户帐户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午3:50:37
	 */
	public void save(NormalAccount normalAccount) throws Exception;
	
	/**
	 * 
	* 方法名:          update
	* 方法功能描述:    更新普通用户帐户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午3:51:24
	 */
	public void update(NormalAccountDto normalAccountDto) throws Exception;
	
	/**
	 * 
	* 方法名:          deleteNormalAccount
	* 方法功能描述:     根据id删除普通用户账户
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午6:17:56
	 */
	public void deleteNormalAccount(NormalAccountDto normalAccountDto) throws Exception;
	
	/**
	 * 
	* 方法名:          getNormalAccountRole
	* 方法功能描述:    根据普通账户id获取普通账户角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午7:13:39
	 */
	public void getNormalAccountRole(NormalAccountDto normalAccountDto) throws Exception;
	
	/**
	 * 
	* 方法名:          saveNormalAccountRole
	* 方法功能描述:    保存账户角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午7:45:57
	 */
	public void saveNormalAccountRole(NormalAccountDto normalAccountDto) throws Exception;
	
	/**
	 * 
	* 方法名:          getNormalAccountFunc
	* 方法功能描述:    根据普通账户id获取账户权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午8:19:40
	 */
	public void getNormalAccountFunc(NormalAccountDto normalAccountDto) throws Exception;
	
	/**
	 * 
	* 方法名:          findNormalAccount
	* 方法功能描述:    根据帐户名和密码获取账户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月18日 下午4:16:03
	 */
	public NormalAccount findNormalAccount(NormalAccountDto normalAccountDto) throws Exception;
	
	/**
	 * 
	* 方法名:          updatePassword
	* 方法功能描述:      更新普通用户账户密码
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月28日 下午5:19:05
	 */
	public void updatePassword(NormalAccount normalAccount) throws Exception;
	
	/**
	 * 
	* 方法名:          configOnly
	* 方法功能描述:    确定账户名的唯一性
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月21日 下午1:58:57
	 */
	public void configOnly(NormalAccountDto normalAccountDto) throws Exception;
	
	
	/**
	 * 
	* @Title: NormalAccountService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param account
	* @return
	* @return:NormalAccount 
	* @author zhouxin  
	* @date 2014年7月2日 下午5:33:49
	* @version V1.0
	 */
	public NormalAccount getNormalAccountByAccount(String account);
}
