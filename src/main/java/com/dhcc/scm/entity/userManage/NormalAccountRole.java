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
@Table(name="T_SYS_NORMALACCOUNT_ROLE")
@IdClass(NormalAccountRoleId.class)
public class NormalAccountRole implements Serializable{

	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
    private Long accountId;
	private Long roleId;
	
	@Id
	@AttributeOverrides({
		@AttributeOverride(name="accountId",
	    column=@Column(name="account_Id")),
	    @AttributeOverride(name="roleId",
	    column=@Column(name="role_Id"))
	})
	
	/**  
	 * @return accountId 
	 */
	@Column(name = "account_Id")
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
	* Title:  
	* Description: 
	* @param accountId
	* @param roleId 
	*/
	public NormalAccountRole(Long accountId, Long roleId) {
		super();
		this.accountId = accountId;
		this.roleId = roleId;
	}
	/**  
	* Title:  
	* Description:  
	*/
	public NormalAccountRole() {
		super();
	}  
	
	
	
}