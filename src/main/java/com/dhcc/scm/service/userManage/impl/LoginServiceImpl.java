package com.dhcc.scm.service.userManage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.scm.dao.userManage.LoginDao;
import com.dhcc.scm.dto.login.LoginDto;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.vo.login.LoginVo;
import com.dhcc.scm.service.userManage.LoginService;

/**
 * <p>标题: LoginServiceImpl.java</p>
 * <p>业务描述:Kerberos登录服务接口的实现</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月23日
 * @version V1.0 
 */
@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource
	private LoginDao loginDao;
	
	@Override
	public String getPraAccountPassword(LoginVo loginVo) {
		String accountKey=loginDao.getPraAccountPassword(loginVo);
		return accountKey;
	}

	@Override
	public String getNormalAccountPassword(LoginVo loginVo) {
		String accountKey=loginDao.getNormalAccountPassword(loginVo);
		return accountKey;
	}
	
	@Override
	public String getGatewayPassword(String systemType, String version) {
		String gatewayPassword=loginDao.getGatewayPassword(systemType, version);
		return gatewayPassword;
	}

	@Override
	public String getGatewayPassword(LoginVo loginVo) {
		String gatewayPassword=loginDao.getGatewayPassword(loginVo);
		return gatewayPassword;
	}

	@Override
	public String getPraAccountFunc(LoginVo loginVo) {
		String roleFunc=loginDao.getPraAccountFunc(loginVo);
		return roleFunc;
	}

	@Override
	public String getNorAccountFunc(LoginVo loginVo) {
		String roleFunc=loginDao.getNorAccountFunc(loginVo);
		return roleFunc;
	}
	
	@Override
	public String getNorAccountMainFuncJson(LoginVo loginVo) {
		String roleFunc=loginDao.getNorAccountMainFuncJson(loginVo);
		return roleFunc;
	}
	
	@Override
	public List<Func> getFuncByParentId(LoginDto loginDto) {
		List<Func>  funclist=loginDao.getFuncByParentId(loginDto);
		return funclist;
	}

	
	@Override
	public String getUserPassword(String userName) {
		String accountKey=loginDao.getUserPassword(userName);
		return accountKey;
	}
	
}
