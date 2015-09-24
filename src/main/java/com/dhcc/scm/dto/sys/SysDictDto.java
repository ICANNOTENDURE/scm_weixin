/**
 * 
 */
package com.dhcc.scm.dto.sys;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.sys.SysDict;

/**
 * <p>标题：</p>
 * <p>业务描述：</p>
 * <p>公司：东华软件股份公司</p>
 * <p>版权：dhcc2013</p>
 * @author 吴杰
 * @date 2013年12月9日
 * @version 
 */

public class SysDictDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	private SysDict sysDict;
	public SysDict getSysDict() {
		return sysDict;
	}
	public void setSysDict(SysDict sysDict) {
		this.sysDict = sysDict;
	}
	
}
