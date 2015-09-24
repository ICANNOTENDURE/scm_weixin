package com.dhcc.scm.entity.vo.platformManage;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>标题: CertVo.java</p>
 * <p>业务描述:统一运维及安全管理平台</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年10月11日
 * @version V1.0 
 */
public class CertVo implements Serializable {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private String certId;
	private Date beginTime;
	private String certInfo;
	private String certKeyInfo;
	private String certSerialNum;
	private String certState;
	private String commonName;
	private String country;
	private Date createTime;
	private String email;
	private Date endTime;
	private String issuerDn;
	private String locality;
	private String organization;
	private String province;
	private String section;
	private String subjectDn;
	
	private String gatewayId;
	private String systemType;
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
	/**  
	 * @return gatewayId 
	 */
	public String getGatewayId() {
		return gatewayId;
	}
	/**  
	 * @param gatewayId gatewayId 
	 */
	public void setGatewayId(String gatewayId) {
		this.gatewayId = gatewayId;
	}
	/**  
	 * @return systemType 
	 */
	public String getSystemType() {
		return systemType;
	}
	/**  
	 * @param systemType systemType 
	 */
	public void setSystemType(String systemType) {
		this.systemType = systemType;
	}
	
}
