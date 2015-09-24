package com.dhcc.framework.common.log.logconfig.service;

import com.dhcc.framework.common.log.logconfig.dto.logconfig.LogConfigDto;
/**
 * <p>标题: LogConfigService.java</p>
 * <p>业务描述:基层医疗卫生开发平台</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 姚凯
 * @date 2013年11月19日
 * @version V1.0 
 */

public interface LogConfigService {

	/** 
	 * 方法名:          list
	 * 方法功能描述:    日志配置查询
	 * @param:         dto
	 * @return:        void
	 * @Author:        姚凯
	 * @Create Date:   2013年11月18日 上午8:53:12
	 */
	public void list(LogConfigDto dto);
	
	/** 
	 * 方法名:          saveOrUpdate
	 * 方法功能描述:    日志配置保存或者更新
	 * @param:         dto
	 * @return:        void
	 * @Author:        姚凯
	 * @Create Date:   2013年11月18日 上午8:53:12
	 */
	public void saveOrUpdate(LogConfigDto dto);
	
	/** 
	 * 方法名:          delete
	 * 方法功能描述:    日志配置删除
	 * @param:         dto
	 * @return:        void
	 * @Author:        姚凯
	 * @Create Date:   2013年11月18日 上午8:53:12
	 */
	public void delete(LogConfigDto dto);
}
