package com.dhcc.scm.entity.userManage;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name="T_SYS_ROLE")
@XmlRootElement
@JsonIgnoreProperties({"praAccounts","normalAccounts"})
public class Role implements java.io.Serializable{

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	private Long roleId;
	private String roleCode;
	private String roleName;
	private String description;
	private Date createTime;
	private String useState;
	/**  
	 * @return roleId 
	 */
	@Id
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="Seq_SYS_ROLE")})
	@GeneratedValue(generator="idGenerator")
	//@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "ROLE_ID")
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
	 * @return roleCode 
	 */
	@Column(name = "code")
	public String getRoleCode() {
		return roleCode;
	}

	/**  
	 * @param roleCode roleCode 
	 */
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	/**  
	 * @return roleName 
	 */
	@Column(name = "name")
	public String getRoleName() {
		return roleName;
	}

	/**  
	 * @param roleName roleName 
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/**  
	 * @return description 
	 */
	@Column(name = "DESCRIPTION")
	public String getDescription() {
		return description;
	}

	/**  
	 * @param description description 
	 */
	public void setDescription(String description) {
		this.description = description;
	}



	/**  
	 * @return createTime 
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createTime")
	public Date getCreateTime() {
		return createTime;
	}

	/**  
	 * @param createTime createTime 
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**  
	 * @return useState 
	 */
	@Column(name = "useState")
	public String getUseState() {
		return useState;
	}

	/**  
	 * @param useState useState 
	 */
	public void setUseState(String useState) {
		this.useState = useState;
	}

	//与权限映射多对多关系
	private Set<Func> funcs;
	/**  
	 * @return funcs 
	 */
	@JsonIgnore
	@ManyToMany
	@JoinTable(name="T_SYS_FUNC_ROLE",joinColumns={@JoinColumn(name="role_id")},
	inverseJoinColumns={@JoinColumn(name="func_id")})
	public Set<Func> getFuncs() {
		return funcs;
	}
	/**  
	 * @param funcs funcs 
	 */
	public void setFuncs(Set<Func> funcs) {
		this.funcs = funcs;
	}
	

		
	//与普通用户账户映射多对多关系
	public Set<NormalAccount> normalAccounts;
	/**  
	 * @return normalAccounts 
	 */
	@JsonIgnore
	@ManyToMany(mappedBy="roles",targetEntity=NormalAccount.class)
	public Set<NormalAccount> getNormalAccounts() {
		return normalAccounts;
	}

	/**  
	 * @param normalAccounts normalAccounts 
	 */
	public void setNormalAccounts(Set<NormalAccount> normalAccounts) {
		this.normalAccounts = normalAccounts;
	}

	/**  
	* Title:  
	* Description: 
	* @param roleId
	* @param systemType
	* @param roleCode
	* @param roleName
	* @param description
	* @param accountId
	* @param createTime
	* @param useState 
	*/
	public Role(Long roleId, String roleCode,
			String roleName, String description, 
			Date createTime, String useState) {
		super();
		this.roleId = roleId;
		this.roleCode = roleCode;
		this.roleName = roleName;
		this.description = description;
		this.createTime = createTime;
		this.useState = useState;
	}
	/**  
	* Title:  
	* Description:  
	*/
	public Role() {
		super();
	}
	
	//是否选中的标识符，在账户权限中使用
	private String checkboxFlag = "0";
	/**  
	 * @return checkboxFlag 
	 */
	@Transient
	public String getCheckboxFlag() {
		return checkboxFlag;
	}

	/**  
	 * @param checkboxFlag checkboxFlag 
	 */
	public void setCheckboxFlag(String checkboxFlag) {
		this.checkboxFlag = checkboxFlag;
	}
	
	
	
	
}
