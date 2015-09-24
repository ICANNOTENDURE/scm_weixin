package com.dhcc.scm.dto.login;

import javax.xml.bind.annotation.XmlRootElement;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.vo.login.LoginVo;

/**
 * <p>标题: LoginDto.java</p>
 * <p>业务描述:Kerberos登录服务Dto</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月23日
 * @version V1.0 
 */
@XmlRootElement
public class LoginDto extends BaseDto {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private LoginVo loginVo;
	
	private Func func;

	private String userName;
	
	private String password;
	
	public Func getFunc() {
		return func;
	}

	public void setFunc(Func func) {
		this.func = func;
	}

	/**  
	 * @return loginVo 
	 */
	public LoginVo getLoginVo() {
		return loginVo;
	}

	/**  
	 * @param loginVo loginVo 
	 */
	public void setLoginVo(LoginVo loginVo) {
		this.loginVo = loginVo;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
}
