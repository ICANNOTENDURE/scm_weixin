package com.dhcc.framework.common.log.logconfig.blh.logconfig;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.annotation.BlhParameter;
import com.dhcc.framework.annotation.BlhParameters;
import com.dhcc.framework.annotation.PmDataType;
import com.dhcc.framework.annotation.PmDataTypes;
import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.common.entity.LogConfigure;
import com.dhcc.framework.common.log.BusinessLogUtil;
import com.dhcc.framework.common.log.logconfig.dto.logconfig.LogConfigDto;
import com.dhcc.framework.common.log.logconfig.service.LogConfigService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.StringUtils;

@Component
@PmDataTypes({@PmDataType(methodName="list",clsType=LogConfigure.class)
			,@PmDataType(methodName="queryByTitle",clsType=LogConfigure.class)})
public class LogConfigBlh extends AbstractBaseBlh {	

	private static Log logger = LogFactory.getLog(LogConfigBlh.class);

	@Resource
	private LogConfigService logConfigService;

	public LogConfigBlh() {
		System.out.println("=================LogConfigBlh==================");
	}
	
	/** 
	 * 方法名:          list
	 * 方法功能描述:    查询全部用户信息
	 * @param:         BusinessRequest res
	 * @return:        void
	 * @Author:        姚凯
	 * @Create Date:   2013年8月8日 上午8:53:12
	 */
	@BlhParameters(dtoCls=LogConfigDto.class,parameter={
		 @BlhParameter(parameterExpress="logConfigure")
		,@BlhParameter(parameterExpress="pageModel.pageNo")
		,@BlhParameter(parameterExpress="pageModel.totals")
		,@BlhParameter(parameterExpress="pageModel.pageSize")})
	public void list(BusinessRequest res) {
		LogConfigDto dto = super.getDto(LogConfigDto.class, res);
		//调用对应的service方法
		logConfigService.list(dto);
	}

	@BlhParameters(dtoCls=LogConfigDto.class,parameter={
		@BlhParameter(parameterExpress="logConfigure")
		})
	public void save(BusinessRequest res) {
	
		LogConfigDto dto = super.getDto(LogConfigDto.class, res);
		if(StringUtils.isNullOrEmpty(dto.getLogConfigure().getId())){
			dto.getLogConfigure().setId(null);
			dto.getLogConfigure().setInsertDate(new java.sql.Timestamp(new Date().getTime()));
		} else {
			dto.getLogConfigure().setUpdateDate(new java.sql.Timestamp(new Date().getTime()));
		}
		//调用对应的service方法
		logConfigService.saveOrUpdate(dto);
		BusinessLogUtil.reLoadConfigure();
		
	}
	@BlhParameters(dtoCls=LogConfigDto.class,parameter={
		@BlhParameter(parameterExpress="logConfigure.title")
		})
	public void queryByTitle(BusinessRequest res) {
	
		LogConfigDto dto = super.getDto(LogConfigDto.class, res);
		//调用对应的service方法
		logConfigService.list(dto);
	}

	
	/** 
	 * 方法名:          delete
	 * 方法功能描述:    删除日志配置
	 * @param:         BusinessRequest res
	 * @return:        void
	 * @Author:        姚凯
	 * @Create Date:   2013年8月18日 上午8:53:12
	 */
	@BlhParameters(dtoCls=LogConfigDto.class,
		parameter={@BlhParameter(parameterExpress="logConfigure.id")
		})
	public void delete(BusinessRequest res) {
		LogConfigDto dto = super.getDto(LogConfigDto.class, res);
		//调用对应的service方法
		logConfigService.delete(dto);
		BusinessLogUtil.reLoadConfigure();
	}
}