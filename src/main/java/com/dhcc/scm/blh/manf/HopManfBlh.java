/**
 * 通过模板生成Blh 
 * template by liuyg
 */
package com.dhcc.scm.blh.manf;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.manf.HopManfDto;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.service.manf.HopManfService;


@Component
public class HopManfBlh extends AbstractBaseBlh {

	@SuppressWarnings("unused")
	private static Log logger = LogFactory.getLog(HopManfBlh.class);

	@Resource
	private HopManfService hopManfService;
	
	@Resource
	private CommonService commonService;
	
	public HopManfBlh() {
		
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
	
		HopManfDto dto = super.getDto(HopManfDto.class, res);
		
		//调用对应的service方法
		hopManfService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		HopManfDto dto = super.getDto(HopManfDto.class, res);
		if(dto.getHopManf().getHopManfId()==null||
				(dto.getHopManf().getHopManfId()).equals("")){
			dto.getHopManf().setHopManfId(null);
			//调用对应的service方法
			hopManfService.save(dto);
		}else{
			hopManfService.update(dto);
		}
		
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		HopManfDto dto = super.getDto(HopManfDto.class, res);
		
		//调用对应的service方法
		hopManfService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		HopManfDto dto = super.getDto(HopManfDto.class, res);
		
		//调用对应的service方法
		hopManfService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		HopManfDto dto = super.getDto(HopManfDto.class, res);
		
		//调用对应的service方法
		hopManfService.findById(dto);
		
	}
	/**
	 * 获取hopManf的id和描述
	 * @param res
	 * @throws Exception
	 */
	public void getManfInfo(BusinessRequest res) {
		HopManfDto dto = super.getDto(HopManfDto.class, res);
		DetachedCriteria criteria = DetachedCriteria.forClass(HopManf.class);
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getComgridparam())){
			criteria.add(Restrictions.like("manfName",dto.getComgridparam().trim(),MatchMode.ANYWHERE));
		}
		super.writeJSON(commonService.findByDetachedCriteria(criteria));
	}
	
	
	/**
	 * 
	* @Title: findManfComboxVos 
	* @Description: TODO(查询产地) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月20日 下午2:55:05
	 */
	public void findManfComboxVos(BusinessRequest res) {
		HopManfDto dto = super.getDto(HopManfDto.class, res);
		super.writeJSON(hopManfService.findManfComboxVos(dto));
	}
}
