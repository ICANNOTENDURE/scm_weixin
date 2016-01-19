package com.dhcc.scm.service.userManage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.scm.dao.userManage.FuncDao;
import com.dhcc.scm.dto.userManage.FuncDto;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.service.userManage.FuncService;

/**
 * 标题: FuncServiceImpl.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年8月29日
 * @version V1.0 
 */
@Service("funcService")
public class FuncServiceImpl implements FuncService{

	@Resource
	private FuncDao funcDao;
	
	
	/**
	 * 
	* 方法名:          funcList
	* 方法功能描述:      获取权限树
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月23日 下午3:01:16
	 */
	@Override
	public void funcList(FuncDto funcDto) throws Exception {
		List<Func> funcs = this.funcDao.findFuncs(funcDto);
		funcDto.setFuncs(funcs);
	}

	/**
	 * 
	* 方法名:          saveFunc
	* 方法功能描述:      保存权限信息
	* @param:        func1权限对象
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年8月30日 下午2:39:31
	 */
	@Override
	public void saveFunc(Func func) throws Exception {
		this.funcDao.save(func);
	}

	/**
	 * 
	* 方法名:          updateFunc
	* 方法功能描述:      更新权限信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年8月30日 下午4:16:14
	 */
	@Override
	public void updateFunc(FuncDto funcDto) throws Exception {
		this.funcDao.update(funcDto.getFunc());
	}
	
	/**
	 * 
	* 方法名:          deleteFunc
	* 方法功能描述:      删除权限信息
	* @param:        idString
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年8月30日 下午3:39:25
	 */
	@Override
	public void deleteFunc(Long idString) throws Exception {
		Func func = this.funcDao.get(Func.class, idString);
		this.funcDao.delete(func);
	}

	/**
	 * 
	* 方法名:          getFuncListBySystemType
	* 方法功能描述:    通过系统类型代码获取该系统下的所有权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月4日 下午7:36:04
	 */
	@Override
	public void getFuncListBySystemType(FuncDto funcDto) throws Exception {
		this.funcDao.getFuncListBySystemType(funcDto);
	}

	/***
	 * 
	* 方法名:          saveFuncs
	* 方法功能描述:    批量保存权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月11日 下午5:26:28
	 */
	@Override
	public void saveFuncs(List<Func> funcs) throws Exception {
		this.funcDao.saveFuncs(funcs);
	}
	
	/**
	 * 
	* 方法名:          structuringFunc
	* 方法功能描述:    结构化权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月6日 上午9:14:32
	 */
	@Override
	public void structuringFunc(Func func) throws Exception {
		this.funcDao.structuringFunc(func);
	}
	

	/**
	 * 
	* 方法名:          getFuncsByAccount
	* 方法功能描述:    通过账户信息获取账户权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月15日 下午2:09:16
	 */
	@Override
	public void getFuncsByAccount(FuncDto funcDto) throws Exception {
		this.funcDao.getFuncsByAccount(funcDto);
	}

	/**
	 * 
	* 方法名:          configOnly
	* 方法功能描述:    确定权限编号的唯一性
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月20日 下午2:19:59
	 */
	@Override
	public void configOnly(FuncDto funcDto) throws Exception {
		this.funcDao.configOnly(funcDto);
	}


}
