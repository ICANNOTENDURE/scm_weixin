package com.dhcc.scm.blh.platformManage;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.CertDto;
import com.dhcc.scm.entity.platformManage.Cert;
import com.dhcc.scm.service.platformManage.CertService;
import com.dhcc.scm.tool.cert.CertPro;

/**
 * 
* 标题: CertBlh.java
* 业务描述：安全运维管理平台
* 公司:东华软件股份公司
* 版权:dhcc2013
* @author 聂文来
* @date 2013年10月21日
* @version V1.0
 */
@Component
public class CertBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(CertBlh.class);
	
	@Resource
	private CertService certService;
	
	public CertBlh() {
		logger.info("====new CertBlh====");
	}
	
	/**
	 * 
	* 方法名:          certList
	* 方法功能描述:     分页获取证书信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 上午11:17:03
	 */
	public void certList(BusinessRequest res) {
		try {
			certService.certList(super.getDto(CertDto.class, res));
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改证书信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 下午2:30:23
	 */
	public void saveOrUpdate(BusinessRequest res) {
		try {
			CertDto certDto = (CertDto)super.getDto(CertDto.class, res);
			//如果没有主键则为保存
			if("".equals(certDto.getCert().getCertId())){
				//获取根证书
				Cert rootCert = this.certService.getCert("013948738317");
				//生成证书头部
				String subjectStr = "CN="+certDto.getCert().getCommonName()+",OU="+certDto.getCert().getSection()+",O="+certDto.getCert().getOrganization()+",L="+certDto.getCert().getLocality()+",ST="+certDto.getCert().getProvince()+",C="+certDto.getCert().getCountry();
				if(rootCert!=null){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					com.dhcc.scm.tool.cert.Cert certTool = new com.dhcc.scm.tool.cert.Cert(1024);
					
					//获取证书和密钥的字串
					String str = certTool.GetIssuedCertAndKeyByStr(rootCert.getCertInfo(), rootCert.getCertKeyInfo(), 
							subjectStr, sdf.format(certDto.getCert().getBeginTime()),  sdf.format(certDto.getCert().getEndTime()), certDto.getCert().getEmail());
					//拆分后设入新的证书中
					String[] strTemp=str.split("-----BEGIN RSA PRIVATE KEY-----");
					certDto.getCert().setCertInfo(strTemp[0]);
					certDto.getCert().setCertKeyInfo("-----BEGIN RSA PRIVATE KEY-----"+strTemp[1]);
					//获取根证书相关属性设入新的证书中
					CertPro certPro = certTool.GetCertPro(strTemp[0]);
					certDto.getCert().setCertSerialNum(certPro.getSerialNumber());
					certDto.getCert().setSubjectDn(certPro.getSubjectDN());
					certDto.getCert().setIssuerDn(certPro.getIssuerDN());
					certDto.getCert().setCreateTime(new Date());
					
				}
				
				this.certService.saveCert(certDto.getCert());
			}else{
				this.certService.updateCert(certDto.getCert());
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          delCert
	* 方法功能描述:    根据id删除证书
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 上午11:39:43
	 */
	public void delCert(BusinessRequest res) {
		try {
			this.certService.delCert(super.getDto(CertDto.class, res));
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          deleteCertKey
	* 方法功能描述:    根据证书序列号删除证书密钥
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月22日 下午3:41:46
	 */
	public void deleteCertKey(BusinessRequest res){
		try {
			CertDto certDto = (CertDto)super.getDto(CertDto.class, res);
			this.certService.deleteCertKey(certDto.getCert().getCertSerialNum());
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	
}
