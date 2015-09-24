package com.dhcc.scm.entity.userManage;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class NormalAccountRoleId implements Serializable{

	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private Long accountId;
	private Long roleId;

	/**  
	 * @return accountId 
	 */
	public Long getAccountId() {
		return accountId;
	}

	/**  
	 * @param accountId accountId 
	 */
	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

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
	
	@Override
	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof NormalAccountRoleId))
			return false;
		NormalAccountRoleId castOther = (NormalAccountRoleId) other;

		return ((this.getAccountId().equals(castOther.getAccountId())) || (this
				.getAccountId() != null
				&& castOther.getAccountId() != null && this.getAccountId().equals(
				castOther.getAccountId())))
				&& ((this.getRoleId().equals(castOther.getRoleId())) || (this
						.getRoleId() != null
						&& castOther.getRoleId() != null && this
						.getRoleId().equals(castOther.getRoleId())));
	}
	@Override
	public int hashCode() {
		int result = 17;
		result = 37 * result
				+ (this.getAccountId() == null ? 0 : this.getAccountId().hashCode());
		result = 37 * result
				+ (this.getRoleId() == null ? 0 : this.getRoleId().hashCode());
		return result;
	}

	
}
