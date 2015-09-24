package com.dhcc.framework.common;

import java.util.List;

public interface ConvertObjArrayToVo {

	/**
	 * 
	 *@author liuyg
	 *功能： 把resultSet转换成ＶＯ或ＰＯＪＯ
	 *@param resultSet 用ＳＱＬ果询到的对像数组List
	 *@return
	 */
	public List<?> convert(List<?> resultSet);
}
