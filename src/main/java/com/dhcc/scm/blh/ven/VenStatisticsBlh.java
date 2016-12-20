/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.ven;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.ven.VenStatisticsDto;
import com.dhcc.scm.service.ven.VenStatisticsService;

@Component
public class VenStatisticsBlh extends AbstractBaseBlh {


	@Resource
	private VenStatisticsService venStatisticsService;
	
	@Resource
	private CommonService commonService;
	
	public VenStatisticsBlh() {
		
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
	
		VenStatisticsDto dto = super.getDto(VenStatisticsDto.class, res);
		
		//调用对应的service方法
		venStatisticsService.list(dto);
	}
	
}
