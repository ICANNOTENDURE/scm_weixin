package com.dhcc.scm.service.userManage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.platformManage.SystemVersionDao;
import com.dhcc.scm.dao.userManage.FuncDao;
import com.dhcc.scm.dao.userManage.RoleDao;
import com.dhcc.scm.dto.platformManage.SystemVersionDto;
import com.dhcc.scm.dto.userManage.FuncDto;
import com.dhcc.scm.dto.userManage.RoleDto;
import com.dhcc.scm.entity.platformManage.SystemVersion;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.userManage.Role;
import com.dhcc.scm.service.userManage.RoleService;

/**
 * 标题: RoleServiceImpl.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年9月3日
 * @version V1.0 
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService{
	
	@Resource
	private RoleDao roleDao;
	@Resource
	private FuncDao funcDao;
	@Resource
	private SystemVersionDao systemVersionDao;
	@Resource
	private CommonService commonService;

	/**
	 * 
	* 方法名:          getRoleListByPagerModel
	* 方法功能描述:      分页获取角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月3日 下午3:11:22
	 */
	@Override
	public void getRoleListByPagerModel(RoleDto roleDto) throws Exception {
		PagerModel pagerModel = roleDto.getPageModel();
		this.roleDao.buildPagerModelQuery(pagerModel, roleDto);
		this.commonService.fillPagerModelData(pagerModel);
	}
	
	/**
	 * 
	* 方法名:          saveRole
	* 方法功能描述:    保持角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月5日 上午11:12:22
	 */
	@Override
	public void saveRole(Role role) throws Exception {
		this.roleDao.save(role);
	}

	/**
	 * 
	* 方法名:          updateRole
	* 方法功能描述:    更新角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月5日 上午11:15:15
	 */
	@Override
	public void updateRole(RoleDto roleDto) throws Exception {
		roleDto.setRoleId(roleDto.getRole().getRoleId());
		this.roleDao.getRoleFuncs(roleDto);
		this.roleDao.update(roleDto.getRole());
	}
	
	/**
	 * 
	* 方法名:          deleteRole
	* 方法功能描述:        删除角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月5日 上午9:38:45
	 */
	@Override
	public void deleteRole(String roleIdString) throws Exception {
		Role role = (Role)this.roleDao.get(Role.class, Long.valueOf(roleIdString));
		this.roleDao.delete(role);
	}

	/**
	 * 
	* 方法名:          getFuncsByRoleId
	* 方法功能描述:    获取角色权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月29日 下午2:02:02
	 */
	@Override
	public void getRoleFuncs(RoleDto roleDto) throws Exception {
		FuncDto funcDto = new FuncDto();
		funcDto.setSystemType(roleDto.getSystemType());
		List<Func> funcs = this.funcDao.findFuncs(funcDto);
		roleDto.setFuncs(funcs);
		this.roleDao.getRoleFuncs(roleDto); 
	}

	/**
	 * 
	* 方法名:          saveRoleFunc
	* 方法功能描述:    分配角色权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月29日 下午3:44:28
	 */
	@Override
	public void saveRoleFunc(RoleDto roleDto) throws Exception {
		this.roleDao.removeRoleFunc(roleDto);
		this.roleDao.saveRoleFuncs(roleDto.getRoleFuncs());
	}



	/**
	 * 
	* 方法名:          normalAccountList
	* 方法功能描述:    获取拥有该角色的普通用户账户
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月31日 上午11:29:36
	 */
	@Override
	public void normalAccountList(RoleDto roleDto) throws Exception {
		this.roleDao.queryNormalAccountByPageModel(roleDto);
	}

	/**
	 * 
	* 方法名:          getSystemVersion
	* 方法功能描述:    获取系统类型
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月4日 下午3:57:26
	 */
	@Override
	public List<SystemVersion> getSystemVersion(SystemVersionDto systemVersionDto) throws Exception {
		return this.systemVersionDao.findSystemVersion(systemVersionDto);
	}

	/**
	 * 
	* 方法名:          findRole
	* 方法功能描述:    获取某个角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月25日 下午4:15:39
	 */
	@Override
	public Role findRole(RoleDto roleDto) throws Exception {
		List<Role> roles = this.roleDao.findRole(roleDto);
		if(null!=roles&&roles.size()>0){
			return roles.get(0);
		}else{
			return null;
		}
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.userManage.RoleService#getRoleVens(com.dhcc.pms.dto.userManage.RoleDto)
	 */
	@Override
	public void getRoleVens(RoleDto roleDto) {
		// TODO Auto-generated method stub
		roleDao.getRoleVens(roleDto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.userManage.RoleService#getRoleLocs(com.dhcc.pms.dto.userManage.RoleDto)
	 */
	@Override
	public void getRoleLocs(RoleDto roleDto) {
		// TODO Auto-generated method stub
		roleDao.getRoleLocs(roleDto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.userManage.RoleService#saveRoleLoc(com.dhcc.pms.dto.userManage.RoleDto)
	 */
	@Override
	public void saveRoleLoc(RoleDto roleDto) {
		// TODO Auto-generated method stub
		roleDao.saveRoleLoc(roleDto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.userManage.RoleService#saveRoleVen(com.dhcc.pms.dto.userManage.RoleDto)
	 */
	@Override
	public void saveRoleVen(RoleDto roleDto) {
		// TODO Auto-generated method stub
		roleDao.saveRoleVen(roleDto);
	}

}
