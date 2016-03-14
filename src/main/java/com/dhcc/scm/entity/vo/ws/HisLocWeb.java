
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.List;

/**
 * 
* @ClassName: HisIncLocQtyWeb 
* @Description: TODO(his科室库存信息和标准库存) 
* @author zhouxin
* @date 2015年4月15日 下午3:50:01 
*
 */
public class HisLocWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private List<HisLocItmWeb> hisLocItmWebs;
	
	private String userName;
	
	private String passWord;


	

	public List<HisLocItmWeb> getHisLocItmWebs() {
		return hisLocItmWebs;
	}

	public void setHisLocItmWebs(List<HisLocItmWeb> hisLocItmWebs) {
		this.hisLocItmWebs = hisLocItmWebs;
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
	 * @return the passWord
	 */
	public String getPassWord() {
		return passWord;
	}

	/**
	 * @param passWord the passWord to set
	 */
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	
	
	
	
}
