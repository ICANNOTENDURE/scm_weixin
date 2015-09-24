package com.dhcc.scm.entity.userManage;

import java.io.Serializable;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;



@Entity
@Table(name="T_SYS_FUNC_ROLE")
@IdClass(RoleFuncId.class)
public class RoleFunc implements Serializable {
	
	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private Long roleId;
	private Long funcId;
	
	@Id
	@AttributeOverrides({
		@AttributeOverride(name="roleId",
	    column=@Column(name="role_Id")),
	    @AttributeOverride(name="funcId",
	    column=@Column(name="func_Id"))
	})
	
	/**  
	 * @return roleId 
	 */
	@Column(name = "role_Id")
	public Long getRoleId() {
		return roleId;
	}
	/**  
	 * @param roleId roleId 
	 */
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	/**  
	 * @return funcId 
	 */
	@Column(name = "func_Id")
	public Long getFuncId() {
		return funcId;
	}
	/**  
	 * @param funcId funcId 
	 */
	public void setFuncId(Long funcId) {
		this.funcId = funcId;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}