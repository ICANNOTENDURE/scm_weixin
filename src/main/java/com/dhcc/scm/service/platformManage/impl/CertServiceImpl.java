package com.dhcc.scm.service.platformManage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.platformManage.CertDao;
import com.dhcc.scm.dto.platformManage.CertDto;
import com.dhcc.scm.entity.platformManage.Cert;
import com.dhcc.scm.service.platformManage.CertService;

/**
 * 
* 标题: CertServiceImpl.java
* 业务描述：安全运维管理平台
* 公司:东华软件股份公司
* 版权:dhcc2013
* @author 聂文来
* @date 2013年10月21日
* @version V1.0
 */
@Service("certService")
public class CertServiceImpl implements CertService {
	
	private static Log logger = LogFactory.getLog(CommonServiceImpl.class);
	
	public CertServiceImpl(){
		logger.info("====new CertServiceImpl====");
	}
	
	@Resource
	private CertDao certDao;
	
	@Resource
	private CommonService commonService;
	
	/**
	 * 
	* 方法名:          certList
	* 方法功能描述:    分页获取证书信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 上午10:54:42
	 */
	@Override
	public void certList(CertDto certDto) throws Exception {
		PagerModel pagerModel = certDto.getPageModel();
		this.certDao.buildPagerModelQuery(pagerModel, certDto);
		this.commonService.fillPagerModelData(pagerModel);
	}
	
	/** 
	* 方法名:          saveCert
	* 方法功能描述:    保存证书信息
	* @param:         cert
	* @return:        void
	* @Author:        聂文来
	* @Create Date:   2013年8月31日 下午7:33:43
	*/
	@Override
	public void saveCert(Cert cert)  throws Exception{
		this.certDao.save(cert);
	}

	/** 
	* 方法名:          updateCert
	* 方法功能描述:    更新证书信息
	* @param:         cert
	* @return:        void
	* @Author:        聂文来
	* @Create Date:   2013年9月9日 下午4:08:38
	*/
	@Override
	public void updateCert(Cert cert)  throws Exception{
		this.certDao.update(cert);
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
	@Override
	public void delCert(CertDto certDto) throws Exception{
		Cert cert = this.certDao.get(Cert.class, certDto.getCert().getCertId());
		this.certDao.delete(cert);
	}

	/**
	 * 
	* 方法名:          getRootCert
	* 方法功能描述:    根据证书序列号获取证书
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 下午5:28:13
	 */
	@Override
	public Cert getCert(String certSerialNum) throws Exception {
		List<Cert> certs = this.certDao.getCert(certSerialNum);
		if(certs!=null&&!certs.isEmpty()){
			return certs.get(0);
		}else{
			return null;
		}
	}

	/**
	 * 
	* 方法名:          deleteCertKey
	* 方法功能描述:    根据证书序列号删除证书密钥
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月22日 下午3:35:32
	 */
	@Override
	public void deleteCertKey(String certSerialNum) throws Exception {
		this.certDao.deleteCertKey(certSerialNum);
	}

}
