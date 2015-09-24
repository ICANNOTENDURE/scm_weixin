package com.dhcc.scm.service.platformManage;

import com.dhcc.scm.dto.platformManage.OrgDto;
import com.dhcc.scm.entity.platformManage.Org;

/**
 * <p>标题: OrgService.java</p>
 * <p>业务描述:统一运维及安全管理平台  机构信息Service接口</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月30日
 * @version V1.0 
 */
public interface OrgService {

	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或修改机构信息
	* @param:         org
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年8月30日 下午3:41:28
	*/
	public void saveOrUpdate(Org org);
	
	/** 
	* 方法名:          saveOrg
	* 方法功能描述:    保存机构信息
	* @param:         org
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年8月30日 下午3:43:00
	*/
	public void saveOrg(Org org);
	
	/** 
	* 方法名:          updateOrg
	* 方法功能描述:    更新机构信息
	* @param:         org
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月9日 下午4:21:33
	*/
	public void updateOrg(Org org);
	
	/** 
	* 方法名:          delOrgById
	* 方法功能描述:    根据ID删除机构信息
	* @param:         id
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年8月30日 下午3:48:12
	*/
	public void delOrgById(String id);
	
	/** 
	* 方法名:          delOrg
	* 方法功能描述:    删除机构信息
	* @param:         org
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月3日 下午4:56:21
	*/
	public void delOrg(Org org);
	
	/** 
	* 方法名:          findOrgById
	* 方法功能描述:    根据ID查询机构信息
	* @param:         id
	* @return:        Org
	* @Author:        李飞
	* @Create Date:   2013年8月30日 下午3:50:16
	*/
	public Org findOrgById(String id);
	
	/** 
	* 方法名:          findOrg
	* 方法功能描述:    分页查找机构信息
	* @param:         pagerModel
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年8月30日 下午4:19:17
	*/
	public void findOrg(OrgDto orgDto);
}
