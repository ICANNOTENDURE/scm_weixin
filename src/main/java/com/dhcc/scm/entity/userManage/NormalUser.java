package com.dhcc.scm.entity.userManage;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "T_SYS_NORMAL_USER")
public class NormalUser implements Serializable {

	/**
	 * 字段: 序列化id
	 * 
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	//@GenericGenerator(name = "idGenerator", strategy = "sequence", parameters = { @Parameter(name = "sequence", value = "Seq_NormalUser") })
	//@GeneratedValue(generator = "idGenerator")
	//@GenericGenerator(name="idGenerator", strategy="foreign", parameters=@Parameter(name="property", value="FK_ACCOUNT_RF_USER"))
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "USER_ID")
	private Long userId;
	
	@Column(name = "realName")
	private String realName;
	
	@Column(name = "sex")
	private String sex;
	
	@Column(name = "nation")
	private String nation;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "birth")
	private Date birthday;
	
	@Column(name = "tel")
	private String telephone;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "address")
	private String address;
	
	@Column(name="CARDID")
	private String idCard;
	
	@Column(name="DESCRIPT")
	private String description;
	
	@Column(name = "FACCOUNT_ID")
	private String faccountId;

	@Temporal(TemporalType.DATE)
	@Column(name = "regTime")
	private Date regTime;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "updTime")
	private Date updateTime;
	
	@Column(name = "useState")
	private String useState;
	
	//人员类型(0,工作，1医院,2,供应商,3护士)
	@Column(name = "TYPE")
	private Long type;
	
	
	@Column(name = "VENDORID")
	private Long vendorId;
	
	@Column(name = "LOCID")
	private Long locId;
	
	@JsonIgnore
	@OneToOne(mappedBy="normalUser",fetch=FetchType.EAGER)
	private NormalAccount normalAccount;
	
	
	
	
	// @Id
	// @GenericGenerator(name="idGenerator",strategy="uuid")
	// @GeneratedValue(generator="idGenerator")
	// @GeneratedValue(strategy=GenerationType.AUTO)

	public NormalAccount getNormalAccount() {
		return normalAccount;
	}

	public void setNormalAccount(NormalAccount normalAccount) {
		this.normalAccount = normalAccount;
	}

	/**
	 * @return userId
	 */
	public Long getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            userId
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	/**
	 * @return realName
	 */
	
	public String getRealName() {
		return realName;
	}

	/**
	 * @param realName
	 *            realName
	 */
	public void setRealName(String realName) {
		this.realName = realName;
	}

	/**
	 * @return sex
	 */
	
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex
	 *            sex
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return nation
	 */
	
	public String getNation() {
		return nation;
	}

	/**
	 * @param nation
	 *            nation
	 */
	public void setNation(String nation) {
		this.nation = nation;
	}

	/**
	 * @return birthday
	 */

	public Date getBirthday() {
		return birthday;
	}

	/**
	 * @param birthday
	 *            birthday
	 */
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	/**
	 * @return telephone
	 */
	
	public String getTelephone() {
		return telephone;
	}

	/**
	 * @param telephone
	 *            telephone
	 */
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	/**
	 * @return email
	 */
	
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return address
	 */
	
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            address
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return regTime
	 */
	
	public Date getRegTime() {
		return regTime;
	}

	/**
	 * @param regTime
	 *            regTime
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
	 * @param updateTime
	 *            updateTime
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * @return useState
	 */
	
	public String getUseState() {
		return useState;
	}

	/**
	 * @param useState
	 *            useState
	 */
	public void setUseState(String useState) {
		this.useState = useState;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getFaccountId() {
		return faccountId;
	}

	public void setFaccountId(String faccountId) {
		this.faccountId = faccountId;
	}

	/**
	 * @return the type
	 */
	public Long getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(Long type) {
		this.type = type;
	}

	/**
	 * @return the vendorId
	 */
	public Long getVendorId() {
		return vendorId;
	}

	/**
	 * @param vendorId the vendorId to set
	 */
	public void setVendorId(Long vendorId) {
		this.vendorId = vendorId;
	}

	/**
	 * @return the locId
	 */
	public Long getLocId() {
		return locId;
	}

	/**
	 * @param locId the locId to set
	 */
	public void setLocId(Long locId) {
		this.locId = locId;
	}
	
	
}
