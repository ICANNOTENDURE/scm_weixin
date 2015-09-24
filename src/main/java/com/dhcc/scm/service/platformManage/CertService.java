package com.dhcc.scm.service.platformManage;

import com.dhcc.scm.dto.platformManage.CertDto;
import com.dhcc.scm.entity.platformManage.Cert;

/**
 * 
* 标题: CertService.java
* 业务描述：安全运维管理平台
* 公司:东华软件股份公司
* 版权:dhcc2013
* @author 聂文来
* @date 2013年10月21日
* @version V1.0
 */
public interface CertService {
	
	/**
	 * 
	* 方法名:          certList
	* 方法功能描述:    分页获取证书信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 上午10:54:42
	 */
	public void certList(CertDto certDto) throws Exception;
	
	/** 
	* 方法名:          saveCert
	* 方法功能描述:    保存证书信息
	* @param:         cert
	* @return:        void
	* @Author:        聂文来
	* @Create Date:   2013年8月31日 下午7:33:43
	*/
	public void saveCert(Cert cert) throws Exception;
	
	/** 
	* 方法名:          updateCert
	* 方法功能描述:    更新证书信息
	* @param:         cert
	* @return:        void
	* @Author:        聂文来
	* @Create Date:   2013年9月9日 下午4:08:38
	*/
	public void updateCert(Cert cert) throws Exception;
	
	/**
	 * 
	* 方法名:          delCert
	* 方法功能描述:    根据id删除证书
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 上午11:39:43
	 */
	public void delCert(CertDto certDto) throws Exception;
	
	
	/**
	 * 
	* 方法名:          getRootCert
	* 方法功能描述:    根据证书序列号获取证书
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 下午5:28:13
	 */
	public Cert getCert(String certSerialNum) throws Exception;
	
	/**
	 * 
	* 方法名:          deleteCertKey
	* 方法功能描述:    根据证书序列号删除证书密钥
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月22日 下午3:35:32
	 */
    public void deleteCertKey(String certSerialNum) throws Exception;	
	
	
	
	
}
