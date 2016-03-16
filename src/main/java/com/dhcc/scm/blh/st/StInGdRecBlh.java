/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.st;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.service.st.StInGdRecService;

@Component
public class StInGdRecBlh extends AbstractBaseBlh {


	@Resource
	private StInGdRecService stInGdRecService;
	
	@Resource
	private CommonService commonService;
	
	public StInGdRecBlh() {
		
	}
	

	
}
