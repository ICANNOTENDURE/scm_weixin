package com.dhcc.scm.blh.platformManage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.SystemVersionDto;
import com.dhcc.scm.entity.platformManage.SystemVersion;
import com.dhcc.scm.service.platformManage.SystemVersionService;

/**
 * <p>标题: SystemVersionBlh.java</p>
 * <p>业务描述:统一运维及安全管理平台  业务系统版本管理业务逻辑实现</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @date 2013年9月16日
 * @version V1.0 
 */
@Component
public class SystemVersionBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(SystemVersionBlh.class);
	
	@Resource
	SystemVersionService systemVersionService;
	
	@Resource
	CommonService commonService;
	
	/**  
	* <p>Title: </p> 
	* <p>Description: </p>  
	*/
	public SystemVersionBlh() {
		logger.info("====new SystemVersionBlh====");
	}
	
	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改业务系统版本信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午7:27:00
	*/
	public void saveOrUpdate(BusinessRequest res) {
		SystemVersion systemVersion = (super.getDto(SystemVersionDto.class, res)).getSystemVersion();
		
		systemVersionService.saveOrUpdate(systemVersion);
	}
	
	/** 
	* 方法名:          delSystemVersionById
	* 方法功能描述:    根据ID删除业务系统版本信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午7:30:42
	*/
	public void delSystemVersionById(BusinessRequest res) {
		SystemVersion systemVersion = (super.getDto(SystemVersionDto.class, res)).getSystemVersion();
		
		//systemVersionService.delSystemVersionById(systemVersion.getVersionId());
		systemVersionService.delSystemVersion(systemVersion);
	}
	
	/** 
	* 方法名:          findSystemVersionById
	* 方法功能描述:    根据ID查找业务系统版本信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月18日 下午3:59:17
	*/
	public void findSystemVersionById(BusinessRequest res) {
		SystemVersionDto systemVersionDto = super.getDto(SystemVersionDto.class, res);
		SystemVersion systemVersion = systemVersionService.findSystemVersionById(systemVersionDto.getSystemVersion().getVersionId());
		systemVersionDto.setSystemVersion(systemVersion);
	}
	
	/** 
	* 方法名:          systemVersionList
	* 方法功能描述:    获取安装包目录树列表
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月18日 下午4:00:25
	*/
	public void getSystemVersionCatalog(BusinessRequest res) {
		SystemVersionDto systemVersionDto = super.getDto(SystemVersionDto.class, res);
		systemVersionService.getSystemVersion(systemVersionDto);
		
		Map<String, SystemVersion> map = new HashMap<String, SystemVersion>();
		
		// 获取根节点
		List<SystemVersion> roots = new ArrayList<SystemVersion>();
		
		// 获取非根节点
		List<SystemVersion> versions = systemVersionDto.getSystemVersions();
		for (int i=0; i<versions.size(); i++) {
			if (versions.get(i).getParentId() == null) {
				roots.add(versions.get(i));
			}
			map.put(versions.get(i).getVersionId(), versions.get(i));
		}
		
		Iterator<String> keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			SystemVersion systemVersion = map.get(key);
			if (systemVersion.getParentId() != null) {
				SystemVersion parentSystem = map.get(systemVersion.getParentId());
				parentSystem.getChildren().add(systemVersion);
			}
		}
		
		systemVersionDto.setSystemVersions(roots);
			
		Map<String, String> dictMap = new HashMap<String, String>(1);
		dictMap.put("useState", "use_state");
		commonService.dictionaryConvert(systemVersionDto.getSystemVersions(), dictMap);
	}
	
}
