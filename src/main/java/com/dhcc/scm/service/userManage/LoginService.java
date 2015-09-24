package com.dhcc.scm.service.userManage;

import java.util.List;

import com.dhcc.scm.dto.login.LoginDto;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.vo.login.LoginVo;

/**
 * <p>标题: LoginDao.java</p>
 * <p>业务描述:Kerberos登录服务接口</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月23日
 * @version V1.0 
 */
public interface LoginService {
	
	/** 
	* 方法名:          getPraAccountPassword
	* 方法功能描述:    获取从业人员账户密码
	* @param:         账户登录数据传输对象
	* @return:        账户密码
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午4:01:30
	*/
	public String getPraAccountPassword(LoginVo loginVo);
	
	/**
	 * 
	* 方法名:          getNormalAccountPassword
	* 方法功能描述:    获取普通用户账户密码
	* @param:         账户登录数据传输对象
	* @return:        账户密码
	* @Author:        于鸿
	* @Create Date:   2013年10月22日 上午11:32:04
	 */
	public String getNormalAccountPassword(LoginVo loginVo);
	
	/**
	 * 
	* 方法名:          getGatewayPassword
	* 方法功能描述:    查询应用系统的通信密码
	* @param:         应用系统类型，应用系统版本
	* @return:        应用系统通信密码;
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午4:40:16
	 */
	public String getGatewayPassword(String systemType,String version);
	
	/**
	 * 
	* 方法名:          getGatewayPassword
	* 方法功能描述:    查询应用系统的通信密码
	* @param:         应用系统唯一标识符
	* @return:        应用系统通信密码;
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午4:43:51
	 */
	public String getGatewayPassword(LoginVo loginVo);
	
	/**
	 * 
	* 方法名:          getPraAccountFunc
	* 方法功能描述:    获取从业人员在要访问的应用系统的账户权限
	* @param:         BaseDto
	* @return:        以^分隔的权限信息;
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午4:46:25
	 */
	public String getPraAccountFunc(LoginVo loginVo);
	
	/**
	 * 
	* 方法名:          getNorAccountFunc
	* 方法功能描述:    获取从业人员在要访问的应用系统的账户权限
	* @param:         BaseDto
	* @return:        以^分隔的权限信息;
	* @Author:        周鑫
	* @Create Date:   2014年3月28日 下午4:46:25
	 */
	public String getNorAccountFunc(LoginVo loginVo);
	
	/**
	 * 
	* 方法名:          getNorAccountFunc
	* 方法功能描述:    获取从业人员在要访问的应用系统的菜单
	* @param:         BaseDto
	* @return:        以^分隔的权限信息;
	* @Author:        周鑫
	* @Create Date:   2014年3月28日 下午4:46:25
	 */
	public String getNorAccountMainFuncJson(LoginVo loginVo);

	
	public List<Func> getFuncByParentId(LoginDto loginDto);

	/**
	 * @param userName
	 * @return
	 */
	public String getUserPassword(String userName);
	
}
