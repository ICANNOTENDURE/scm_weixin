package com.dhcc.scm.blh.platformManage;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.annotation.PmDataType;
import com.dhcc.framework.annotation.PmDataTypes;
import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.OrgDto;
import com.dhcc.scm.entity.platformManage.Org;
import com.dhcc.scm.entity.vo.platformManage.OrgVo;
import com.dhcc.scm.service.platformManage.OrgService;

/**
 * <p>标题: OrgBlh.java</p>
 * <p>业务描述:统一运维及安全管理平台  机构信息业务逻辑实现</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月30日
 * @version V1.0 
 */
@Component
@PmDataTypes({
	@PmDataType(methodName = "saveOrUpdate", clsType = Org.class),
	@PmDataType(methodName = "delOrg", clsType = Org.class),
	@PmDataType(methodName = "orgList", clsType = OrgVo.class)
})
public class OrgBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(OrgBlh.class);
	
	@Resource
	private OrgService orgService;
	
	@Resource
	private CommonService commonService;
	
	/**  
	* <p>Title: </p> 
	* <p>Description: </p>  
	*/
	public OrgBlh() {
		// TODO Auto-generated constructor stub
		logger.info("====new OrgBlh====");
	}
	
	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改机构信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年8月30日 下午5:02:14
	*/
	public void saveOrUpdate(BusinessRequest res) {
		Org org = (super.getDto(OrgDto.class, res)).getOrg();
		//Gateway gateway = org.getGateway();
		//gateway.setOrgs(orgs);
		if ("".equals(org.getOrgId()) || "null".equals(org.getOrgId())) {
			//gateway.setGatewayId(org.getOrgId());
			org.setOrgId(null);
		}
		orgService.saveOrUpdate(org);
	}
	
	/** 
	* 方法名:          saveOrg
	* 方法功能描述:    保存机构信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年8月30日 下午5:02:42
	*/
	public void saveOrg(BusinessRequest res) {
		OrgDto dto = super.getDto(OrgDto.class, res);
		
		dto.getOrg().setOrgId("");
		orgService.saveOrg(dto.getOrg());
	}
	
	/** 
	* 方法名:          delOrg
	* 方法功能描述:    删除机构信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年8月30日 下午5:04:38
	*/
	public void delOrg(BusinessRequest res) {
		//orgService.delOrgById(super.getDto(OrgDto.class, res).getOrg().getOrgId());
		Org org = (super.getDto(OrgDto.class, res)).getOrg();
		orgService.delOrg(org);
	}
	
	/** 
	* 方法名:          findOrgById
	* 方法功能描述:    根据ID查找机构信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年8月30日 下午5:05:08
	*/
	public void findOrgById(BusinessRequest res) {
		OrgDto orgDto = super.getDto(OrgDto.class, res);
		Org org = orgService.findOrgById(orgDto.getOrg().getOrgId());
		orgDto.setOrg(org);
	}
	
	/** 
	* 方法名:          orgList
	* 方法功能描述:    分页查询机构信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年8月30日 下午5:05:43
	*/
	public void orgList(BusinessRequest res) {
		OrgDto orgDto = super.getDto(OrgDto.class, res);
		PagerModel pagerModel = orgDto.getPageModel();
		orgService.findOrg(orgDto);
			
		Map<String, String> map = new HashMap<String, String>(2);
		map.put("useState", "use_state");
		map.put("serverType", "server_type");
		commonService.dictionaryConvert(pagerModel.getPageData(), map);
		orgDto.setPageModel(pagerModel);	
	}
	
}
