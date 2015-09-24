/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.cat;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.cat.CatPropertyDto;
import com.dhcc.scm.entity.cat.CatProperty;
import com.dhcc.scm.service.cat.CatPropertyService;


@Component
public class CatPropertyBlh extends AbstractBaseBlh {


	@Resource
	private CatPropertyService catPropertyService;
	
	@Resource
	private CommonService commonService;
	
	public CatPropertyBlh() {
		
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
	
		CatPropertyDto dto = super.getDto(CatPropertyDto.class, res);
		
		//调用对应的service方法
		catPropertyService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		CatPropertyDto dto = super.getDto(CatPropertyDto.class, res);
		
		//调用对应的service方法

		commonService.saveOrUpdate(dto.getCatProperty());
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		CatPropertyDto dto = super.getDto(CatPropertyDto.class, res);
		
		//调用对应的service方法
		catPropertyService.delete(dto);
	}
		
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		CatPropertyDto dto = super.getDto(CatPropertyDto.class, res);
		
		//调用对应的service方法
		catPropertyService.findById(dto);
		
	}
	
	
	/**
	 * 
	* @Title: listSubCatGroupComb 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月7日 上午11:48:54
	 */
	public void listCatPropertyComb(BusinessRequest res) {
		
		CatPropertyDto dto = super.getDto(CatPropertyDto.class, res);
		
		DetachedCriteria criteria = DetachedCriteria.forClass(CatProperty.class);
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getComgridparam())){
			criteria.add(Restrictions.like("proName",dto.getComgridparam().trim(),MatchMode.ANYWHERE));
		}

		super.writeJSON(commonService.findByDetachedCriteria(criteria));
		
	}
}
