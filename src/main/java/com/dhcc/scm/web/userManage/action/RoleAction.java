package com.dhcc.scm.web.userManage.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JsonResult4Pojo;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.userManage.RoleDto;

/**
 * 标题: RoleAction.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年9月3日
 * @version V1.0 
 */
@Namespace(value="/role")
@Scope("prototype")
@Action(value="roleCtrl",results={
		@Result(name="roleMain",location="/WEB-INF/jsp/userManage/role.jsp"),
		@Result(name="roleList",location="/WEB-INF/jsp/userManage/role.jsp"),
		@Result(name="saveOrUpdateRole",location="/WEB-INF/jsp/userManage/role.jsp"),
		@Result(name="deleteRole",location="/WEB-INF/jsp/userManage/role.jsp"),
		@Result(name="praAccountList",location="/WEB-INF/jsp/userManage/role.jsp"),
		@Result(name="normalAccountList",location="/WEB-INF/jsp/userManage/role.jsp")
})
@JsonResult4Pojo("saveRoleVen:roleDto;saveRoleLoc:roleDto;getRoleLocs:roleDto.treeVOs;getRoleVens:roleDto.treeVOs;getRoleFuncs:roleDto.funcs;saveRoleFunc:roleDto;getSystemVersion:roleDto.systemVersions")
@Blh("roleBlh")
public class RoleAction extends BaseAction{

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id 
	*/
	private static final long serialVersionUID = 1L;
	
	private RoleDto roleDto = new RoleDto();
	
	/**  
	 * @return roleDto 
	 */
	public RoleDto getRoleDto() {
		return roleDto;
	}

	/**  
	 * @param roleDto roleDto 
	 */
	public void setRoleDto(RoleDto roleDto) {
		this.roleDto = roleDto;
	}

	@Override
	public BaseDto getBaseDto() {
		return roleDto;
	}

	@Override
	protected void prepareRequest(BusinessRequest arg0) throws BaseException {
		arg0.setDto(roleDto);
	}
	
	/**
	 * 有时候不走后台，只要页面跳成时，复写这个父类方法， super.getBusinessFlow() 能得调用的方法，也就是URL中!后的方法名
	 */
	@Override
	public String directlyJump() {
		if ("roleMain".equals(super.getBusinessFlow())) {
			return "roleMain";
		}
		return null; // 返回null时不会跳转
	}
	
}
















