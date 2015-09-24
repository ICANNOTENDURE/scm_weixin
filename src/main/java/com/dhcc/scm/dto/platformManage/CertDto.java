package com.dhcc.scm.dto.platformManage;

import javax.xml.bind.annotation.XmlRootElement;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.Cert;

/**
 * <p>标题: CertDto.java</p>
 * <p>业务描述:统一运维及安全管理平台  证书信息传输对象Dto</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月31日
 * @version V1.0 
 */
@XmlRootElement
public class CertDto extends BaseDto {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	private Cert cert;

	/**  
	 * @return cert 
	 */
	public Cert getCert() {
		return cert;
	}

	/**  
	 * @param cert cert 
	 */
	public void setCert(Cert cert) {
		this.cert = cert;
	}
	
	private String columnName = "";
	private String columnValue = "";

	/**  
	 * @return columnName 
	 */
	public String getColumnName() {
		return columnName;
	}

	/**  
	 * @param columnName columnName 
	 */
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	/**  
	 * @return columnValue 
	 */
	public String getColumnValue() {
		return columnValue;
	}

	/**  
	 * @param columnValue columnValue 
	 */
	public void setColumnValue(String columnValue) {
		this.columnValue = columnValue;
	}
	
}
