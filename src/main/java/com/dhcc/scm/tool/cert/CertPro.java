package com.dhcc.scm.tool.cert;

/**
 * <p>标题: CertPro.java</p>
 * <p>业务描述:统一运维及安全管理平台</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class CertPro {
	
	// 版本信息
	private int version;
	
	// 证书序列号
	private String serialNumber;
	
	// 签名算法
	private String sigAlgName;
	
	// 类型
	private String type;
	
	// 颁发者名称
	private String issuerAlternativeNames;
	
	// 颁发者信息
	private String issuerDN;
	
	// 使用者名称
	private String subjectAlternativeNames;
	
	// 使用者信息
	private String subjectDN;
	
	// 证书生效时间
	private String beginTime;
	
	// 证书到期时间
	private String endTime;

	/**  
	 * @return version 
	 */
	public int getVersion() {
		return version;
	}

	/**  
	 * @param version version 
	 */
	public void setVersion(int version) {
		this.version = version;
	}

	/**  
	 * @return serialNumber 
	 */
	public String getSerialNumber() {
		return serialNumber;
	}

	/**  
	 * @param serialNumber serialNumber 
	 */
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	/**  
	 * @return sigAlgName 
	 */
	public String getSigAlgName() {
		return sigAlgName;
	}

	/**  
	 * @param sigAlgName sigAlgName 
	 */
	public void setSigAlgName(String sigAlgName) {
		this.sigAlgName = sigAlgName;
	}

	/**  
	 * @return type 
	 */
	public String getType() {
		return type;
	}

	/**  
	 * @param type type 
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**  
	 * @return issuerAlternativeNames 
	 */
	public String getIssuerAlternativeNames() {
		return issuerAlternativeNames;
	}

	/**  
	 * @param issuerAlternativeNames issuerAlternativeNames 
	 */
	public void setIssuerAlternativeNames(String issuerAlternativeNames) {
		this.issuerAlternativeNames = issuerAlternativeNames;
	}

	/**  
	 * @return issuerDN 
	 */
	public String getIssuerDN() {
		return issuerDN;
	}

	/**  
	 * @param issuerDN issuerDN 
	 */
	public void setIssuerDN(String issuerDN) {
		this.issuerDN = issuerDN;
	}

	/**  
	 * @return subjectAlternativeNames 
	 */
	public String getSubjectAlternativeNames() {
		return subjectAlternativeNames;
	}

	/**  
	 * @param subjectAlternativeNames subjectAlternativeNames 
	 */
	public void setSubjectAlternativeNames(String subjectAlternativeNames) {
		this.subjectAlternativeNames = subjectAlternativeNames;
	}

	/**  
	 * @return subjectDN 
	 */
	public String getSubjectDN() {
		return subjectDN;
	}

	/**  
	 * @param subjectDN subjectDN 
	 */
	public void setSubjectDN(String subjectDN) {
		this.subjectDN = subjectDN;
	}

	/**  
	 * @return beginTime 
	 */
	public String getBeginTime() {
		return beginTime;
	}

	/**  
	 * @param beginTime beginTime 
	 */
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	/**  
	 * @return endTime 
	 */
	public String getEndTime() {
		return endTime;
	}

	/**  
	 * @param endTime endTime 
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
}
