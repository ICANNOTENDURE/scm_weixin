package com.dhcc.scm.dao.platformManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.platformManage.CertDto;
import com.dhcc.scm.entity.platformManage.Cert;
/**
 * 
* 标题: CertDao.java
* 业务描述：安全运维管理平台
* 公司:东华软件股份公司
* 版权:dhcc2013
* @author 聂文来
* @date 2013年10月21日
* @version V1.0
 */
@Repository
public class CertDao extends HibernatePersistentObjectDAO<Cert> {
	
	/**
	 * 
	* 方法名:          certList
	* 方法功能描述:     分页获取证书信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 上午10:49:32
	 */
	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		CertDto certDto = (CertDto)dto;
		pagerModel.setCountProName("certId");
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap= new HashMap<String, Object>();
		
		this.buildQuery(certDto,hqlBuffer,hqlParamMap);
		pagerModel.setQueryHql(hqlBuffer.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}
	/**
	 * 
	* 方法名:          certList
	* 方法功能描述:    获取证书分页查询语句
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 上午10:49:32
	 */
	private void buildQuery(CertDto certDto,StringBuffer hqlBuffer,Map<String, Object> hqlParamMap){
		hqlBuffer.append(" from Cert t ");
		hqlBuffer.append(" where 1=1 ");
		if(certDto.getColumnName().length()!=0&&certDto.getColumnValue().length()!=0){
			hqlBuffer.append(" and "+certDto.getColumnName()+" = :columnValue ");
			hqlParamMap.put("columnValue", certDto.getColumnValue());
		}
	}
	
	/**
	 * 
	* 方法名:          getCert
	* 方法功能描述:    根据证书序列号获取证书
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月21日 下午5:32:20
	 */
	@SuppressWarnings("unchecked")
	public List<Cert> getCert(String certSerialNum) throws Exception {
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" from Cert t ");
		hqlBuffer.append(" where t.certSerialNum = ? ");
		List<Cert> certs = (List<Cert>)this.findByHql(hqlBuffer.toString(), certSerialNum);
		return certs;
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
    public void deleteCertKey(String certSerialNum) throws Exception{
    	StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" update Cert t ");
		hqlBuffer.append(" set t.certKeyInfo = ? ");
		hqlBuffer.append(" where t.certSerialNum = ? ");
		this.updateByHqlWithFreeParam(hqlBuffer.toString(),"",certSerialNum);
    }
	
	
	
	

}
