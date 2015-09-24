/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.cat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.cat.CatGroupPropertyDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.cat.CatGroupProperty;
import com.dhcc.scm.entity.cat.CatProperty;
import com.dhcc.scm.entity.cat.Group;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.entity.ven.VenIncProperty;
import com.dhcc.scm.entity.vo.cat.IncPropertyVO;
import com.dhcc.scm.entity.vo.cat.IncPropertysVO;
import com.dhcc.scm.service.cat.CatGroupPropertyService;



@Component
public class CatGroupPropertyBlh extends AbstractBaseBlh {


	@Resource
	private CatGroupPropertyService catGroupPropertyService;
	
	@Resource
	private CommonService commonService;
	
	public CatGroupPropertyBlh() {
		
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
	
		CatGroupPropertyDto dto = super.getDto(CatGroupPropertyDto.class, res);
		
		//调用对应的service方法
		catGroupPropertyService.list(dto);
		dto.setAttr("1", 2);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		CatGroupPropertyDto dto = super.getDto(CatGroupPropertyDto.class, res);
		
		//调用对应的service方法
		commonService.saveOrUpdate(dto.getCatGroupProperty());
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		CatGroupPropertyDto dto = super.getDto(CatGroupPropertyDto.class, res);
		
		if(dto.getCatGroupProperty()!=null){
			if(dto.getCatGroupProperty().getGrpProId()!=null){
				CatGroupProperty catGroupProperty=commonService.get(CatGroupProperty.class, dto.getCatGroupProperty().getGrpProId());
				commonService.delete(catGroupProperty);
			}
		}	
				
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		CatGroupPropertyDto dto = super.getDto(CatGroupPropertyDto.class, res);
		
		//调用对应的service方法
		catGroupPropertyService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		CatGroupPropertyDto dto = super.getDto(CatGroupPropertyDto.class, res);
		
		//调用对应的service方法
		catGroupPropertyService.findById(dto);
		
	}
	
	/**
	 * 
	* @Title: listIncProperty 
	* @Description: TODO(修改商品时显示商品属性使用) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月20日 下午3:56:23
	 */
	@SuppressWarnings("unchecked")
	public void listIncProperty(BusinessRequest res) {
		
		CatGroupPropertyDto dto = super.getDto(CatGroupPropertyDto.class, res);
		
		DetachedCriteria criteria = DetachedCriteria.forClass(CatGroupProperty.class);
		criteria.add(Restrictions.eq("grpParrefId", dto.getSubcatgroup()));
		criteria.addOrder(Order.desc("grpProParrefId"));
		List<CatGroupProperty> catGroupProperties=commonService.findByDetachedCriteria(criteria);
		
		Map<String,List<IncPropertyVO>> map = new HashMap<String,List<IncPropertyVO>>();
		for(CatGroupProperty catGroupProperty:catGroupProperties){
			String[] propertyNames={"incProIncId","incProCatProId"};
			Object[] values={dto.getVeninc(),catGroupProperty.getGrpProId()};
			List<VenIncProperty> venIncProperties=commonService.findByProperties(VenIncProperty.class, propertyNames, values);
			
			CatProperty catProperty=commonService.get(CatProperty.class, catGroupProperty.getGrpProParrefId());
			
			if(catProperty.getProCode().equals("1")) continue; //厂商退出
			if(catProperty.getProCode().equals("999")) continue; //大家说退出
			IncPropertyVO incPropertyVO=new IncPropertyVO();
			incPropertyVO.setPropertyId(catGroupProperty.getGrpProId());
			incPropertyVO.setPropertyName(catGroupProperty.getGrpProDesc());
			if(venIncProperties.size()>0){
				incPropertyVO.setIsDefault("Y");
			}
			if(map.containsKey(catProperty.getProName())){
				map.get(catProperty.getProName()).add(incPropertyVO);
			}else{
				List<IncPropertyVO> propertyVOs=new ArrayList<IncPropertyVO>();
				propertyVOs.add(incPropertyVO);
				map.put(catProperty.getProName(), propertyVOs);
			}
		}
		List<IncPropertysVO> incPropertysVOs=new ArrayList<IncPropertysVO>();
		for(Map.Entry<String, List<IncPropertyVO>> entry: map.entrySet()) {
			IncPropertysVO incPropertysVO=new IncPropertysVO();
			incPropertysVO.setPropertyName(entry.getKey());
			incPropertysVO.setIncPropertyVOs(entry.getValue());
			incPropertysVOs.add(incPropertysVO);
		}	   
		super.writeJSON(incPropertysVOs);
	}
	
	/**
	 * 
	* @Title: getCatProByIncPro 
	* @Description: TODO(查找商品分类和类祖) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月20日 下午3:57:26
	 */
	public void getCatProBySubPro(BusinessRequest res) {
		
		CatGroupPropertyDto dto = super.getDto(CatGroupPropertyDto.class, res);
		SubCatGroup subCatGroup=commonService.get(SubCatGroup.class, (Integer)dto.getSubcatgroup().intValue());
		CatGroup catGroup=commonService.get(CatGroup.class, subCatGroup.getSubParrefGroupID());
		Group group=commonService.get(Group.class, catGroup.getParrefId());
		dto.setCatGroupObj(catGroup);
		dto.setGroupObj(group);
		super.writeJSON(dto);
	}
}
