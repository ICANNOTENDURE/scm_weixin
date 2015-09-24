package com.dhcc.scm.tool.func;

import java.util.Comparator;

import com.dhcc.scm.entity.userManage.Func;

/**
 * 标题: FuncComparator.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年11月15日
 * @version V1.0 
 */
public class FuncComparator implements Comparator<Func>{

	@Override
	public int compare(Func func1, Func func2) {
		return (int)(Double.parseDouble(func1.getMenuSeq()) - Double.parseDouble(func2.getMenuSeq()));
	}

}
