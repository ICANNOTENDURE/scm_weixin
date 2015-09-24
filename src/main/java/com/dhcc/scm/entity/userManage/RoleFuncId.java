package com.dhcc.scm.entity.userManage;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class RoleFuncId implements Serializable{

	/**  
	* 字段:      序列化
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private Long roleId;
	
	private Long funcId;
	
	/**  
	 * @return roleId 
	 */
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
	public Long getFuncId() {
		return funcId;
	}

	/**  
	 * @param funcId funcId 
	 */
	public void setFuncId(Long funcId) {
		this.funcId = funcId;
	}

	/**  
	* Title:  
	* Description: 
	* @param roleId
	* @param funcId 
	*/
	public RoleFuncId(Long roleId, Long funcId) {
		super();
		this.roleId = roleId;
		this.funcId = funcId;
	}

	/**  
	* Title:  
	* Description:  
	*/
	public RoleFuncId() {
		super();
	}
	
	@Override
	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof RoleFuncId))
			return false;
		RoleFuncId castOther = (RoleFuncId) other;

		return ((this.getFuncId().equals(castOther.getFuncId())) || (this
				.getFuncId() != null
				&& castOther.getFuncId() != null && this.getFuncId().equals(
				castOther.getFuncId())))
				&& ((this.getRoleId().equals(castOther.getRoleId())) || (this
						.getRoleId() != null
						&& castOther.getRoleId() != null && this
						.getRoleId().equals(castOther.getRoleId())));
	}
	@Override
	public int hashCode() {
		int result = 17;
		result = 37 * result
				+ (this.getFuncId() == null ? 0 : this.getFuncId().hashCode());
		result = 37 * result
				+ (this.getRoleId() == null ? 0 : this.getRoleId().hashCode());
		return result;
	}
	
}
