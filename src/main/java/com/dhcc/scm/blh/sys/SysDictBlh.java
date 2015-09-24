package com.dhcc.scm.blh.sys;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.sys.SysDictDto;
import com.dhcc.scm.entity.sys.SysDict;
import com.dhcc.scm.service.sys.SysDictService;

/**
 * <p>标题：</p>
 * <p>业务描述：</p>
 * <p>公司：东华软件股份公司</p>
 * <p>版权：dhcc2013</p>
 * @author 代超
 * @date 2013年12月9日
 * @version 
 */
@Component
public class SysDictBlh extends AbstractBaseBlh {

	@SuppressWarnings("unused")
	private static Log logger = LogFactory.getLog(SysDictBlh.class);
	
	@Resource
	private SysDictService sysDictService;
	
	@Resource
	CommonService commonService;

	  /**
	 * 
	 * 方法名: list 方法功能描述: 列表查询
	 * @param:  res
	 * @Author: 代超
	 * @Create Date: 2013年12月9日 上午10:38:50
	 */
	public void list(BusinessRequest res){
		
		SysDictDto dto=super.getDto(SysDictDto.class, res);		
		if(dto.getPageModel() == null){
			dto.setPageModel(new PagerModel());
		}
		sysDictService.list(dto);
		
		//Map<String, String>map = new HashMap<String, String>(1);
		//map.put("demoGender", "gender");
		//commonService.dictionaryConvert(dto.getPageModel().getPageData(), map);
	}
	
	public void save(BusinessRequest res) {
		
		SysDictDto dto=super.getDto(SysDictDto.class, res);	
		
		if(dto.getSysDict().getId()==null){
			dto.getSysDict().setId(null);
			//调用对应的service方法
			sysDictService.save(dto);
		}else{
			sysDictService.update(dto);
		}
		
		
	}

	public void update(BusinessRequest res) {
		
		SysDictDto dto=super.getDto(SysDictDto.class, res);	
		
		//调用对应的service方法
		sysDictService.update(dto);
	}

	public void delete(BusinessRequest res) {
		
		SysDictDto dto=super.getDto(SysDictDto.class, res);
		
		//调用对应的service方法
		sysDictService.delete(dto);
	}
	
	public void findById(BusinessRequest res) {
		
		SysDictDto dto=super.getDto(SysDictDto.class, res);
		
		//调用对应的service方法
		SysDict sysDict=sysDictService.findById(dto);
		dto.setSysDict(sysDict);		
	}
}
	
	
