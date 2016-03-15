/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.st;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.st.StInGdRecDto;
import com.dhcc.scm.service.st.StInGdRecService;

@Component
public class StInGdRecBlh extends AbstractBaseBlh {


	@Resource
	private StInGdRecService stInGdRecService;
	
	@Resource
	private CommonService commonService;
	
	public StInGdRecBlh() {
		
	}
	
	/**
	 * 进入某个列表的入口方法
	 * 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list
	 * 框架 在不调Ctrl时，不指定方法，就默认为它list，在action中通过
	 * json注解，所dto中的pageModel to json
	 * @param: res
	 *  
	 */
	public void list(BusinessRequest res) {
	
		StInGdRecDto dto = super.getDto(StInGdRecDto.class, res);
		
		//调用对应的service方法
		stInGdRecService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		StInGdRecDto dto = super.getDto(StInGdRecDto.class, res);

	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		StInGdRecDto dto = super.getDto(StInGdRecDto.class, res);
		
	
	}

	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		StInGdRecDto dto = super.getDto(StInGdRecDto.class, res);
		
		//调用对应的service方法
		stInGdRecService.findById(dto);
		
	}
	
}
