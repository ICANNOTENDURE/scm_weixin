package com.dhcc.scm.service.userManage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.userManage.NormalAccountDao;
import com.dhcc.scm.dto.userManage.NormalAccountDto;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.service.userManage.NormalAccountService;

/**
 * 标题: NormalAccountServiceImpl.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年10月16日
 * @version V1.0 
 */
@Service("normalAccountService")
public class NormalAccountServiceImpl implements NormalAccountService{
	
	@Resource
	private NormalAccountDao normalAccountDao;
	
	@Resource
	private CommonService commonService;

	/**
	 * 
	* 方法名:          normalAccountList
	* 方法功能描述:     分页获取普通用户帐户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 上午10:07:41
	 */
	@Override
	public void normalAccountList(NormalAccountDto normalAccountDto)
			throws Exception {
		PagerModel pagerModel = normalAccountDto.getPageModel();
		this.normalAccountDao.buildPagerModelQuery(pagerModel, normalAccountDto);
		this.commonService.fillPagerModelData(pagerModel);
	}
	
	/**
	 * 
	* 方法名:          save
	* 方法功能描述:    保存普通用户帐户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午3:50:37
	 */
	@Override
	public void save(NormalAccount normalAccount) throws Exception {
		this.normalAccountDao.save(normalAccount.getNormalUser());
		this.normalAccountDao.save(normalAccount);
	}

	/**
	 * 
	* 方法名:          update
	* 方法功能描述:    更新普通用户帐户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午3:51:24
	 */
	@Override
	public void update(NormalAccountDto normalAccountDto) throws Exception {
		normalAccountDto.setAccountId(normalAccountDto.getNormalAccount().getAccountId().toString());
		this.normalAccountDao.getNormalAccountRoles(normalAccountDto);
		this.normalAccountDao.update(normalAccountDto.getNormalAccount());
	}

	/**
	 * 
	* 方法名:          deleteNormalAccount
	* 方法功能描述:     根据id删除普通用户账户
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午6:17:56
	 */
	@Override
	public void deleteNormalAccount(NormalAccountDto normalAccountDto)
			throws Exception {
		this.normalAccountDao.deleteNormalAccount(normalAccountDto.getNormalAccount().getAccountId());
	}

	/**
	 * 
	* 方法名:          getNormalAccountRole
	* 方法功能描述:    根据普通账户id获取普通账户角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午7:13:39
	 */
	@Override
	public void getNormalAccountRole(NormalAccountDto normalAccountDto)
			throws Exception {
		this.normalAccountDao.getRoles(normalAccountDto);
		this.normalAccountDao.getNormalAccountRoles(normalAccountDto);
	}

	/**
	 * 
	* 方法名:          saveNormalAccountRole
	* 方法功能描述:    保存账户角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午7:45:57
	 */
	@Override
	public void saveNormalAccountRole(NormalAccountDto normalAccountDto)
			throws Exception {
		this.normalAccountDao.removeNormalAccountRole(normalAccountDto);
		this.normalAccountDao.saveNormalAccountRoles(normalAccountDto.getNormalAccountRoles());
	}

	/**
	 * 
	* 方法名:          getNormalAccountFunc
	* 方法功能描述:    根据普通账户id获取账户权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午8:19:40
	 */
	@Override
	public void getNormalAccountFunc(NormalAccountDto normalAccountDto)
			throws Exception {
		this.normalAccountDao.getNormalAccountFunc(normalAccountDto);
	}

	/**
	 * 
	* 方法名:          findNormalAccount
	* 方法功能描述:    根据帐户名和密码获取账户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月18日 下午4:16:03
	 */
	@Override
	public NormalAccount findNormalAccount(NormalAccountDto normalAccountDto)
			throws Exception {
		List<NormalAccount> normalAccounts = this.normalAccountDao.findNormalAccount(normalAccountDto);
		if(null!=normalAccounts&&normalAccounts.size()>0){
			return normalAccounts.get(0);
		}else{
			return null;
		}
	}

	/**
	 * 
	* 方法名:          updatePassword
	* 方法功能描述:      更新普通用户账户密码
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月28日 下午5:19:05
	 */
	@Override
	public void updatePassword(NormalAccount normalAccount) throws Exception {
		this.normalAccountDao.updatePassword(normalAccount);
	}

	/**
	 * 
	* 方法名:          configOnly
	* 方法功能描述:    确定账户名的唯一性
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月21日 下午1:58:57
	 */
	@Override
	public void configOnly(NormalAccountDto normalAccountDto) throws Exception {
		this.normalAccountDao.configOnly(normalAccountDto);
	}

	/* (non-Javadoc)
	 * @see com.dhcc.pms.service.userManage.NormalAccountService#getNormalAccountByAccount(java.lang.String)
	 */
	@Override
	public NormalAccount getNormalAccountByAccount(String account) {
		// TODO Auto-generated method stub
		return normalAccountDao.getNormalAccountByAccount(account);
	}

	@Override
	public void listUser(NormalAccountDto dto) {
		// TODO Auto-generated method stub
		normalAccountDao.listUser(dto);
	}
	
	

}
