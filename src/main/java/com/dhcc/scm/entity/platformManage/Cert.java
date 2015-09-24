package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * <p>标题: Cert.java</p>
 * <p>业务描述:统一运维及安全管理平台  证书管理实体类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月29日
 * @version V1.0 
 */
@Entity
@Table(name="T_CERT", schema="PMS")
@JsonIgnoreProperties(value={"hibernateLazyInitializer"})
public class Cert implements Serializable {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="CERT_ID", unique=true, nullable=false, length=32)
	private String certId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="BEGIN_TIME")
	private Date beginTime;

	@Column(name="CERT_INFO", length=4000)
	private String certInfo;

	@Column(name="CERT_KEY_INFO", length=4000)
	private String certKeyInfo;

	@Column(name="CERT_SERIAL_NUM", length=64)
	private String certSerialNum;

	@Column(name="CERT_STATE", length=16)
	private String certState;

	@Column(name="COMMON_NAME", length=64)
	private String commonName;

	@Column(name="COUNTRY", length=64)
	private String country;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	@Column(name="EMAIL", length=128)
	private String email;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="END_TIME")
	private Date endTime;

	@Column(name="ISSUER_DN", length=600)
	private String issuerDn;

	@Column(name="LOCALITY", length=64)
	private String locality;

	@Column(name="ORGANIZATION", length=64)
	private String organization;

	@Column(name="PROVINCE", length=64)
	private String province;

	@Column(name="SECTION", length=64)
	private String section;

	@Column(name="SUBJECT_DN", length=600)
	private String subjectDn;
	
//	@OneToOne
//	@JoinColumn(name = "GATEWAY_ID")
//	private Gateway gateway;

	public Cert() {
	}

	/**  
	 * @return certId 
	 */
	public String getCertId() {
		return certId;
	}

	/**  
	 * @param certId certId 
	 */
	public void setCertId(String certId) {
		this.certId = certId;
	}

	/**  
	 * @return beginTime 
	 */
	public Date getBeginTime() {
		return beginTime;
	}

	/**  
	 * @param beginTime beginTime 
	 */
	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	/**  
	 * @return certInfo 
	 */
	public String getCertInfo() {
		return certInfo;
	}

	/**  
	 * @param certInfo certInfo 
	 */
	public void setCertInfo(String certInfo) {
		this.certInfo = certInfo;
	}

	/**  
	 * @return certKeyInfo 
	 */
	public String getCertKeyInfo() {
		return certKeyInfo;
	}

	/**  
	 * @param certKeyInfo certKeyInfo 
	 */
	public void setCertKeyInfo(String certKeyInfo) {
		this.certKeyInfo = certKeyInfo;
	}

	/**  
	 * @return certSerialNum 
	 */
	public String getCertSerialNum() {
		return certSerialNum;
	}

	/**  
	 * @param certSerialNum certSerialNum 
	 */
	public void setCertSerialNum(String certSerialNum) {
		this.certSerialNum = certSerialNum;
	}

	/**  
	 * @return certState 
	 */
	public String getCertState() {
		return certState;
	}

	/**  
	 * @param certState certState 
	 */
	public void setCertState(String certState) {
		this.certState = certState;
	}

	/**  
	 * @return commonName 
	 */
	public String getCommonName() {
		return commonName;
	}

	/**  
	 * @param commonName commonName 
	 */
	public void setCommonName(String commonName) {
		this.commonName = commonName;
	}

	/**  
	 * @return country 
	 */
	public String getCountry() {
		return country;
	}

	/**  
	 * @param country country 
	 */
	public void setCountry(String country) {
		this.country = country;
	}

	/**  
	 * @return createTime 
	 */
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
	 * @return email 
	 */
	public String getEmail() {
		return email;
	}

	/**  
	 * @param email email 
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**  
	 * @return endTime 
	 */
	public Date getEndTime() {
		return endTime;
	}

	/**  
	 * @param endTime endTime 
	 */
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	/**  
	 * @return issuerDn 
	 */
	public String getIssuerDn() {
		return issuerDn;
	}

	/**  
	 * @param issuerDn issuerDn 
	 */
	public void setIssuerDn(String issuerDn) {
		this.issuerDn = issuerDn;
	}

	/**  
	 * @return locality 
	 */
	public String getLocality() {
		return locality;
	}

	/**  
	 * @param locality locality 
	 */
	public void setLocality(String locality) {
		this.locality = locality;
	}

	/**  
	 * @return organization 
	 */
	public String getOrganization() {
		return organization;
	}

	/**  
	 * @param organization organization 
	 */
	public void setOrganization(String organization) {
		this.organization = organization;
	}

	/**  
	 * @return province 
	 */
	public String getProvince() {
		return province;
	}

	/**  
	 * @param province province 
	 */
	public void setProvince(String province) {
		this.province = province;
	}

	/**  
	 * @return section 
	 */
	public String getSection() {
		return section;
	}

	/**  
	 * @param section section 
	 */
	public void setSection(String section) {
		this.section = section;
	}

	/**  
	 * @return subjectDn 
	 */
	public String getSubjectDn() {
		return subjectDn;
	}

	/**  
	 * @param subjectDn subjectDn 
	 */
	public void setSubjectDn(String subjectDn) {
		this.subjectDn = subjectDn;
	}

//	/**  
//	 * @return gateway 
//	 */
//	public Gateway getGateway() {
//		return gateway;
//	}
//
//	/**  
//	 * @param gateway gateway 
//	 */
//	public void setGateway(Gateway gateway) {
//		this.gateway = gateway;
//	}

}
