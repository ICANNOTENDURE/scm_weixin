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
import com.dhcc.scm.dto.cat.CatGroupDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.cat.Group;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.cat.CatGroupService;

@Component
public class CatGroupBlh extends AbstractBaseBlh {


	@Resource
	private CatGroupService catGroupService;

	@Resource
	private CommonService commonService;

	public CatGroupBlh() {

	}

	/**
	 * 进入某个列表的入口方法 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list 框架
	 * 在不调Ctrl时，不指定方法，就默认为它list，在action中通过 json注解，所dto中的pageModel to json
	 * 
	 * @param: res
	 * 
	 */
	public void list(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		// 调用对应的service方法
		catGroupService.list(dto);
	}

	// 保存
	public void save(BusinessRequest res) {
		CatGroupDto dto = super.getDto(CatGroupDto.class, res);


		if (dto.getCatGroup().getGroupID() == null
				|| (dto.getCatGroup().getGroupID()).equals("")) {
			dto.getCatGroup().setGroupID(null);

			catGroupService.save(dto);
		} else {
			catGroupService.update(dto);
		}
	}


	// 删除
	public void delete(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		// 调用对应的service方法
		catGroupService.delete(dto);
	}


	// 更新
	public void update(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		// 调用对应的service方法
		catGroupService.update(dto);
	}

	/**
	 * 修改初始化方法 也是根据iD查询实体的方法 在action加能过注解把这个实体to json
	 * 
	 * @param: res
	 * 
	 */
	public void findById(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		// 调用对应的service方法
		catGroupService.findById(dto);

	}
	
	
	
	/**
	 * 
	* @Title: listGroup 
	* @Description: TODO(查询商品大类祖) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月2日 下午2:16:40
	 */
	public void listGroup(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		// 调用对应的service方法
		catGroupService.listGroup(dto);
	}
	
	/**
	 * 
	* @Title: saveGroup 
	* @Description: TODO(保存和修改商品大类祖) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月2日 下午2:19:19
	 */
	public void saveGroup(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		dto.setOperateResult(new OperateResult());
		try {
			commonService.saveOrUpdate(dto.getGroup());
			dto.getOperateResult().setResultCode("1");
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}
	
	/**
	 * 
	* @Title: deleteGroup 
	* @Description: TODO(删除大类祖) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月2日 下午2:19:48
	 */
	public void deleteGroup(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		dto.setOperateResult(new OperateResult());
		try {
			Group group=commonService.get(Group.class, dto.getGroup().getSgId());
			commonService.delete(group);
			dto.getOperateResult().setResultCode("1");
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}
	
	/**
	 * 
	* @Title: listCatGroup 
	* @Description: TODO(查询类祖) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月2日 下午3:23:33
	 */
	public void listCatGroup(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		catGroupService.listCatGroup(dto);
	}
	
	/**
	 * 
	* @Title: listGroup 
	* @Description: TODO(查询商品大类祖) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月2日 下午2:16:40
	 */
	public void listGroupComb(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		
		catGroupService.listGroupComb(dto);
		super.writeJSON(dto.getGroups());
	}
	/**
	 * 
	* @Title: listCatGroupComb 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月7日 上午11:08:34
	 */
	public void listCatGroupComb(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		
		DetachedCriteria criteria = DetachedCriteria.forClass(CatGroup.class);
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getComgridparam())){
			criteria.add(Restrictions.like("groupName",dto.getComgridparam().trim(),MatchMode.ANYWHERE));
		}
		if(dto.getParrefId()!=null){
			criteria.add(Restrictions.eq("parrefId", dto.getParrefId()));
		}
		super.writeJSON(commonService.findByDetachedCriteria(criteria));
	}
	/**
	 * 
	* @Title: listSubCatGroupComb 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月7日 上午11:08:39
	 */
	public void listSubCatGroupComb(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
			
		DetachedCriteria criteria = DetachedCriteria.forClass(SubCatGroup.class);
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getComgridparam())){
			criteria.add(Restrictions.like("subGroupName",dto.getComgridparam().trim(),MatchMode.ANYWHERE));
		}
		if(dto.getParrefId()!=null){
			criteria.add(Restrictions.eq("subParrefGroupID", dto.getParrefId().intValue()));
		}
		super.writeJSON(commonService.findByDetachedCriteria(criteria));
	}
	/**
	 * 
	* @Title: updateCatGroup 
	* @Description: TODO(更新类祖) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月2日 下午4:54:41
	 */
	public void updateCatGroup(BusinessRequest res) {

		CatGroupDto dto = super.getDto(CatGroupDto.class, res);
		dto.setOperateResult(new OperateResult());
		CatGroup catGroup=commonService.get(CatGroup.class, dto.getCatGroup().getGroupID());
		catGroup.setParrefId(dto.getCatGroup().getParrefId());
		commonService.saveOrUpdate(catGroup);
		dto.getOperateResult().setResultCode("1");
		super.writeJSON(dto.getOperateResult());
	}
}
