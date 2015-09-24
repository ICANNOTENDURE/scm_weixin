package com.dhcc.scm.blh.platformManage;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.RsPriorityDto;
import com.dhcc.scm.entity.platformManage.RsPriority;
import com.dhcc.scm.service.platformManage.RsPriorityService;

/**
 * <p>标题: RsPriorityBlh.java</p>
 * <p>业务描述:统一运维及安全管理平台  接收服务器优先级信息业务逻辑实现</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月5日
 * @version V1.0 
 */
@Component
public class RsPriorityBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(RsPriorityBlh.class);
	
	@Resource
	RsPriorityService rsPriorityService;
	
	/**  
	* <p>Title: </p> 
	* <p>Description: </p> 
	*/
	public RsPriorityBlh() {
		logger.info("====new RsPriorityBlh====");
	}
	
	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改接收服务器优先级信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月5日 下午6:36:21
	*/
	public void saveOrUpdate(BusinessRequest res) {
		try {
			RsPriority rsPriority = (super.getDto(RsPriorityDto.class, res)).getRsPriority();
			rsPriorityService.saveOrUpdate(rsPriority);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/** 
	* 方法名:          delRsPriority
	* 方法功能描述:    删除接收服务器优先级信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月5日 下午6:39:32
	*/
	public void delRsPriority(BusinessRequest res) {
		RsPriority rsPriority = (super.getDto(RsPriorityDto.class, res)).getRsPriority();
		rsPriorityService.delRsPriority(rsPriority);
	}
	
	/** 
	* 方法名:          findRsPriorityById
	* 方法功能描述:    根据ID查找接收服务器优先级信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月5日 下午6:43:02
	*/
	public void findRsPriorityById(BusinessRequest res) {
		RsPriorityDto rsPriorityDto = super.getDto(RsPriorityDto.class, res);
		RsPriority rsPriority = rsPriorityService.findRsPriorityById(rsPriorityDto.getRsPriority().getPriorityId());
		
		rsPriorityDto.setRsPriority(rsPriority);
	}
	
	public void findRsPriorityList(BusinessRequest res) {
		try {
			rsPriorityService.findRsPriority(super.getDto(RsPriorityDto.class, res));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}