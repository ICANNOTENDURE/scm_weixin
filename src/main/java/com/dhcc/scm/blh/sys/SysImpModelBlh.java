/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.sys;

import java.io.IOException;

import javax.annotation.Resource;

import com.dhcc.framework.app.service.CommonService;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.sys.SysImpModelDto;
import com.dhcc.scm.service.sys.SysImpModelService;


@Component
public class SysImpModelBlh extends AbstractBaseBlh {


	@Resource
	private SysImpModelService sysImpModelService;
	
	@Resource
	private CommonService commonService;
	
	public SysImpModelBlh() {
		
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
	
		SysImpModelDto dto = super.getDto(SysImpModelDto.class, res);
		
		//调用对应的service方法
		sysImpModelService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		SysImpModelDto dto = super.getDto(SysImpModelDto.class, res);
		
		//调用对应的service方法
		//sysImpModelService.save(dto);
		commonService.saveOrUpdate(dto.getImpModel());
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		SysImpModelDto dto = super.getDto(SysImpModelDto.class, res);
		
		//调用对应的service方法
		sysImpModelService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		SysImpModelDto dto = super.getDto(SysImpModelDto.class, res);
		
		//调用对应的service方法
		sysImpModelService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		SysImpModelDto dto = super.getDto(SysImpModelDto.class, res);
		
		//调用对应的service方法
		sysImpModelService.findById(dto);
		
	}
	
	
	/**
	 * 
	* @Title: SysImpModelBlh.java
	* @Description: TODO(保存excel模板顺序)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月3日 上午10:01:24
	* @version V1.0
	 */
	public void saveModel(BusinessRequest res){
		SysImpModelDto dto = super.getDto(SysImpModelDto.class, res);
		sysImpModelService.saveModel(dto);
	}

	
	/**
	 * 
	* @Title: SysImpModelBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param res
	* @throws IOException
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月10日 上午11:54:10
	* @version V1.0
	 */
	public void listImpModel(BusinessRequest res) throws IOException{
		SysImpModelDto dto = super.getDto(SysImpModelDto.class, res);
		dto.setImpModelList(null);
		WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(sysImpModelService.getModelList(dto)));
	}
	
}
