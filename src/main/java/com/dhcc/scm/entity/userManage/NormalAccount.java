package com.dhcc.scm.entity.userManage;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;



@Entity
@Table(name="T_SYS_NORMAL_ACCOUNT")
public class NormalAccount implements Serializable{

	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence",parameters={@Parameter(name="sequence",value="Seq_SYS_NORMAL_ACCOUNT")})
	//@GeneratedValue(generator="idGenerator")
	//@GeneratedValue(strategy=GenerationType.AUTO)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ACCOUNT_ID")
	private Long accountId;
	
	@Column(name="name")
	private String accountName;
	
	@Column(name="alias")
	private String accountAlias;
	
	@Column(name="password")
	private String password;
	
	@Column(name="sessionKey")
	private String sessionKey;
	
	@Column(name="description")
	private String description;
	
	@Column(name="useState")
	private String useState;
	
	@Column(name="onlineState")
	private String onlineState;
	
	@Temporal(TemporalType.DATE)
	@Column(name="regTime")
	private Date regTime;
	
	@Temporal(TemporalType.DATE)
	@Column(name="updateTime")
	private Date updateTime;
	
	@Temporal(TemporalType.DATE)
	@Column(name="loginTime")
	private Date loginTime;
	
	@Column(name="LOGNUM")
	private String logNum;

	
	@OneToOne(cascade={CascadeType.ALL})
	@JoinColumn(name="USER_ID")
	private NormalUser normalUser;
	
	//与角色映射多对多关系
	@JsonIgnore
	@ManyToMany
	@JoinTable(name="T_SYS_NORMALACCOUNT_ROLE",joinColumns={@JoinColumn(name="ACCOUNT_ID")},
	inverseJoinColumns={@JoinColumn(name="ROLE_ID")})
	private Set<Role> roles;
		
	
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
	 * @return accountName 
	 */
	
	public String getAccountName() {
		return accountName;
	}
	/**  
	 * @param accountName accountName 
	 */
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	/**  
	 * @return accountAlias 
	 */
	
	public String getAccountAlias() {
		return accountAlias;
	}
	/**  
	 * @param accountAlias accountAlias 
	 */
	public void setAccountAlias(String accountAlias) {
		this.accountAlias = accountAlias;
	}
	/**  
	 * @return password 
	 */
	
	public String getPassword() {
		return password;
	}
	/**  
	 * @param password password 
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**  
	 * @return sessionKey 
	 */
	
	public String getSessionKey() {
		return sessionKey;
	}
	/**  
	 * @param sessionKey sessionKey 
	 */
	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}
	/**  
	 * @return description 
	 */
	
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
	 * @return useState 
	 */
	
	public String getUseState() {
		return useState;
	}
	/**  
	 * @param useState useState 
	 */
	public void setUseState(String useState) {
		this.useState = useState;
	}
	/**  
	 * @return onlineState 
	 */
	
	public String getOnlineState() {
		return onlineState;
	}
	/**  
	 * @param onlineState onlineState 
	 */
	public void setOnlineState(String onlineState) {
		this.onlineState = onlineState;
	}
	/**  
	 * @return regTime 
	 */
	
	public Date getRegTime() {
		return regTime;
	}
	/**  
	 * @param regTime regTime 
	 */
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	/**  
	 * @return updateTime 
	 */
	
	public Date getUpdateTime() {
		return updateTime;
	}
	/**  
	 * @param updateTime updateTime 
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	/**  
	 * @return loginTime 
	 */
	
	public Date getLoginTime() {
		return loginTime;
	}
	/**  
	 * @param loginTime loginTime 
	 */
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	/**  
	 * @return logNum 
	 */
	
	public String getLogNum() {
		return logNum;
	}
	/**  
	 * @param logNum logNum 
	 */
	public void setLogNum(String logNum) {
		this.logNum = logNum;
	}
	

	public NormalUser getNormalUser() {
		return normalUser;
	}
	/**  
	 * @param normalUser normalUser 
	 */
	public void setNormalUser(NormalUser normalUser) {
		this.normalUser = normalUser;
	}
	
	
	public Set<Role> getRoles() {
		return roles;
	}
	/**  
	 * @param roles roles 
	 */
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	/**  
	* Title:  
	* Description: 
	* @param accountName
	* @param accountAlias
	* @param useState
	* @param onlineState 
	*/
	public NormalAccount(String accountName, String accountAlias,
			String useState, String onlineState) {
		super();
		this.accountName = accountName;
		this.accountAlias = accountAlias;
		this.useState = useState;
		this.onlineState = onlineState;
	}
	/**  
	* Title:  
	* Description:  
	*/
	public NormalAccount() {
		super();
	}
	
	
	

}
