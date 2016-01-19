package com.dhcc.scm.service.userManage;

import com.dhcc.scm.dto.userManage.RoleDto;
import com.dhcc.scm.entity.userManage.Role;

/**
 * 标题: RoleService.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年9月3日
 * @version V1.0 
 */
public interface RoleService {
	
	/**
	 * 
	* 方法名:          getRoleListByPagerModel
	* 方法功能描述:      分页获取角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月3日 下午3:11:22
	 */
	public void getRoleListByPagerModel(RoleDto roleDto) throws Exception;
	
	/**
	 * 
	* 方法名:          saveRole
	* 方法功能描述:    保持角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月5日 上午11:12:22
	 */
	public void saveRole(Role role) throws Exception;
	
	/**
	 * 
	* 方法名:          updateRole
	* 方法功能描述:    更新角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月5日 上午11:15:15
	 */
	public void updateRole(RoleDto roleDto) throws Exception; 
	
	/**
	 * 
	* 方法名:          deleteRole
	* 方法功能描述:        删除角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月5日 上午9:38:45
	 */
	public void deleteRole(String roleIdString) throws Exception;
	
	/**
	 * 
	* 方法名:          getFuncsByRoleId
	* 方法功能描述:    获取角色权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月29日 下午2:02:02
	 */
	public void getRoleFuncs(RoleDto roleDto) throws Exception;
	
	/**
	 * 
	* 方法名:          saveRoleFunc
	* 方法功能描述:    分配角色权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月29日 下午3:44:28
	 */
	public void saveRoleFunc(RoleDto roleDto) throws Exception;
	

	
	/**
	 * 
	* 方法名:          normalAccountList
	* 方法功能描述:    获取拥有该角色的普通用户账户
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月31日 上午11:29:36
	 */
	public void normalAccountList(RoleDto roleDto) throws Exception;
	
	
	/**
	 * 
	* 方法名:          findRole
	* 方法功能描述:    获取某个角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月25日 下午4:15:39
	 */
	public Role findRole(RoleDto roleDto) throws Exception;
	
	/**
	 * 
	* @Title: RoleService.java
	* @Description: TODO(查询角色有的供应商)
	* @param roleDto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午4:36:12
	* @version V1.0
	 */
	public void getRoleVens(RoleDto roleDto);
	
	/**
	 * 
	* @Title: RoleService.java
	* @Description: TODO(查询角色有的供应商)
	* @param roleDto
	* @return
	* @return:List<Role> 
	* @author zhouxin  
	* @date 2014年6月12日 下午4:37:29
	* @version V1.0
	 */
	public void getRoleLocs(RoleDto roleDto);
	
	/**
	 * 
	* @Title: RoleService.java
	* @Description: TODO(保存角色权限科室)
	* @param roleDto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午8:58:31
	* @version V1.0
	 */
	public void saveRoleLoc(RoleDto roleDto);
	
	
	/**
	 * 
	* @Title: RoleService.java
	* @Description: TODO(保存权限供应商)
	* @param roleDto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午8:59:11
	* @version V1.0
	 */
	
	public void saveRoleVen(RoleDto roleDto);
	
}
