package com.dhcc.scm.service.userManage;

import java.util.List;

import com.dhcc.scm.dto.platformManage.SystemVersionDto;
import com.dhcc.scm.dto.userManage.FuncDto;
import com.dhcc.scm.entity.platformManage.SystemVersion;
import com.dhcc.scm.entity.userManage.Func;

/**
 * 标题: FuncService.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年8月29日
 * @version V1.0 
 */
public interface FuncService {
	
	/**
	 * 
	* 方法名:          funcList
	* 方法功能描述:      获取权限树
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月23日 下午3:01:16
	 */
	public void funcList(FuncDto funcDto) throws Exception;
	
	/**
	 * 
	* 方法名:          saveFunc
	* 方法功能描述:      保存权限信息
	* @param:        func1权限对象
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年8月30日 下午2:39:31
	 */
	public void saveFunc(Func func) throws Exception;
	
	/**
	 * 
	* 方法名:          updateFunc
	* 方法功能描述:      更新权限信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年8月30日 下午4:16:14
	 */
	public void updateFunc(FuncDto funcDto) throws Exception;
	
	/**
	 * 
	* 方法名:          deleteFunc
	* 方法功能描述:      删除权限信息
	* @param:        idString
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年8月30日 下午3:39:25
	 */
	public void deleteFunc(Long idString) throws Exception;
	
	/**
	 * 
	* 方法名:          getFuncListBySystemType
	* 方法功能描述:    通过系统类型代码获取该系统下的所有权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月4日 下午7:36:04
	 */
	public void getFuncListBySystemType(FuncDto funcDto) throws Exception;
	
	/**
	 * 
	* 方法名:          getSystemVersion
	* 方法功能描述:    获取系统类型
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月4日 下午3:22:16
	 */
	public List<SystemVersion> getSystemVersion(SystemVersionDto systemVersionDto) throws Exception;
	
	/***
	 * 
	* 方法名:          saveFuncs
	* 方法功能描述:    批量保存权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月11日 下午5:26:28
	 */
	public void saveFuncs(List<Func> funcs) throws Exception;
	
	/**
	 * 
	* 方法名:          structuringFunc
	* 方法功能描述:    结构化权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月6日 上午9:14:32
	 */
	public void structuringFunc(Func func) throws Exception;
	
	/**
	 * 
	* 方法名:          getFuncsByAccount
	* 方法功能描述:    通过账户信息获取账户权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月15日 下午2:09:16
	 */
	public void getFuncsByAccount(FuncDto funcDto) throws Exception;
	
	/**
	 * 
	* 方法名:          configOnly
	* 方法功能描述:    确定权限编号的唯一性
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月20日 下午2:19:59
	 */
	public void configOnly(FuncDto funcDto) throws Exception;
	
}
