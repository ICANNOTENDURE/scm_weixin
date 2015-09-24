package com.dhcc.scm.blh.platformManage;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.MaintainDto;
import com.dhcc.scm.entity.platformManage.Maintain;
import com.dhcc.scm.service.platformManage.MaintainService;

/**
 * <p>标题: MaintainBlh.java</p>
 * <p>业务描述:统一运维及安全管理平台  运维记录业务逻辑实现</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月16日
 * @version V1.0 
 */
@Component
public class MaintainBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(MaintainBlh.class);
	
	@Resource
	MaintainService maintainService;
	
	@Resource
	CommonService commonService;
	
	/**  
	* <p>Title: </p> 
	* <p>Description: </p>  
	*/
	public MaintainBlh() {
		logger.info("====new MaintainBlh");
	}
	
	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改运维记录信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午8:23:01
	*/
	public void saveOrUpdate(BusinessRequest res) {
		Maintain maintain = (super.getDto(MaintainDto.class, res)).getMaintain();
		
		maintainService.saveOrUpdate(maintain);
	}
	
	/** 
	* 方法名:          saveMaintain
	* 方法功能描述:    保存运维记录信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午8:26:47
	*/
	public void saveMaintain(BusinessRequest res) {
		MaintainDto dto = super.getDto(MaintainDto.class, res);
		
		dto.getMaintain().setMaintainId("");
		maintainService.saveMaintain(dto.getMaintain());
	}
	
	/** 
	* 方法名:          delMaintainById
	* 方法功能描述:    根据ID删除运维记录信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午8:29:44
	*/
	public void delMaintainById(BusinessRequest res) {
		Maintain maintain = (super.getDto(MaintainDto.class, res)).getMaintain();
		
		maintainService.delMaintainById(maintain.getMaintainId());
	}
	
	/** 
	* 方法名:          delMaintain
	* 方法功能描述:    删除运维记录
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午8:31:33
	*/
	public void delMaintain(BusinessRequest res) {
		Maintain maintain = (super.getDto(MaintainDto.class, res)).getMaintain();
		
		maintainService.delMaintain(maintain);
	}
	
	/** 
	* 方法名:          findMaintainById
	* 方法功能描述:    根据ID查询运维记录
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午8:34:35
	*/
	public void findMaintainById(BusinessRequest res) {
		MaintainDto maintainDto = super.getDto(MaintainDto.class, res);
		Maintain maintain = maintainService.findMaintainById(maintainDto.getMaintain().getMaintainId());
		
		maintainDto.setMaintain(maintain);
	}
	
	/** 
	* 方法名:          maintainList
	* 方法功能描述:    分页查询运维记录信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月21日 上午10:12:09
	*/
	public void maintainList(BusinessRequest res) {
		MaintainDto maintainDto = super.getDto(MaintainDto.class, res);
		PagerModel pagerModel = maintainDto.getPageModel();
//		maintainService.findMaintain(maintainDto);
//		
//		Map<String, String> map = new HashMap<String, String>(1);
//		map.put("maintainType", "maintain_type");
//		commonService.dictionaryConvert(pagerModel.getPageData(), map);
//		maintainDto.setPageModel(pagerModel);
		
		
		List<Maintain> pageData=new ArrayList<Maintain>();
		pagerModel.setPageData(pageData);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1,date2,date3,date4,date5,date6,date7,date8,date9,date10;
		try {
			date1 =dateFormat.parse("2013-09-15 12:22:32");
			date2 =dateFormat.parse("2013-09-15 15:52:42");
			date3 =dateFormat.parse("2013-09-16 11:12:22");
			date4 =dateFormat.parse("2013-09-16 16:22:32");
			date5 =dateFormat.parse("2013-09-17 12:33:42");
			date6 =dateFormat.parse("2013-09-17 16:54:12");
			date7 =dateFormat.parse("2013-09-20 10:54:52");
			date8 =dateFormat.parse("2013-09-25 10:44:17");
			date9 =dateFormat.parse("2013-09-25 15:24:36");
			date10 =dateFormat.parse("2013-09-25 16:42:27");
		} catch (ParseException e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		
		Maintain maintain=new Maintain();
		maintain.setCreateTime(date1);
		maintain.setServerId("应用服务器1号");
		maintain.setGatewayId("统一运维管理平台");
		maintain.setMaintainType("系统安装");
		maintain.setDescription("第一次安装统一运维管理平台");
		maintain.setMaintainHandle("安装统一运维管理平台");
		maintain.setMaintainTime("120分钟");
		maintain.setResult("成功");
		pageData.add(maintain);
		
		maintain=new Maintain();
		maintain.setCreateTime(date2);
		maintain.setServerId("应用服务器1号");
		maintain.setGatewayId("统一运维管理平台");
		maintain.setMaintainType("初始配置");
		maintain.setDescription("初始配置统一运维管理平台");
		maintain.setMaintainHandle("初始配置统一运维管理平台");
		maintain.setMaintainTime("100分钟");
		maintain.setResult("成功");
		pageData.add(maintain);

		maintain=new Maintain();
		maintain.setCreateTime(date3);
		maintain.setServerId("应用服务器1号");
		maintain.setGatewayId("综合卫生管理系统");
		maintain.setMaintainType("系统安装");
		maintain.setDescription("第一次安装综合卫生管理系统");
		maintain.setMaintainHandle("安装综合卫生管理系统");
		maintain.setMaintainTime("100分钟");
		maintain.setResult("成功");
		pageData.add(maintain);
		
		maintain=new Maintain();
		maintain.setCreateTime(date4);
		maintain.setServerId("应用服务器1号");
		maintain.setGatewayId("综合卫生管理系统");
		maintain.setMaintainType("初始配置");
		maintain.setDescription("初始配置综合卫生管理系统");
		maintain.setMaintainHandle("初始配置综合卫生管理系统");
		maintain.setMaintainTime("100分钟");
		maintain.setResult("成功");
		pageData.add(maintain);
		
		maintain=new Maintain();
		maintain.setCreateTime(date5);
		maintain.setServerId("应用服务器1号");
		maintain.setGatewayId("健康档案管理系统");
		maintain.setMaintainType("系统安装");
		maintain.setDescription("第一次安装健康档案管理系统");
		maintain.setMaintainHandle("安装健康档案管理系统");
		maintain.setMaintainTime("100分钟");
		maintain.setResult("成功");
		pageData.add(maintain);
		
		maintain=new Maintain();
		maintain.setCreateTime(date6);
		maintain.setServerId("应用服务器1号");
		maintain.setGatewayId("健康档案管理系统");
		maintain.setMaintainType("初始配置");
		maintain.setDescription("初始配置健康档案管理系统");
		maintain.setMaintainHandle("初始配置健康档案管理系统");
		maintain.setMaintainTime("100分钟");
		maintain.setResult("成功");
		pageData.add(maintain);
		
		maintain=new Maintain();
		maintain.setCreateTime(date7);
		maintain.setServerId("应用服务器1号");
		maintain.setGatewayId("统一运维管理平台");
		maintain.setMaintainType("意外停止");
		maintain.setDescription("统一运维管理平台意外停止");
		maintain.setMaintainHandle("重启统一运维管理平台");
		maintain.setMaintainTime("20分钟");
		maintain.setResult("成功");
		pageData.add(maintain);
		
		maintain=new Maintain();
		maintain.setCreateTime(date8);
		maintain.setServerId("应用服务器1号");
		maintain.setGatewayId("统一运维管理平台");
		maintain.setMaintainType("版本升级");
		maintain.setDescription("统一运维管理平台版本升级");
		maintain.setMaintainHandle("统一运维管理平台版本升级");
		maintain.setMaintainTime("120分钟");
		maintain.setResult("成功");
		pageData.add(maintain);
		
		maintain=new Maintain();
		maintain.setCreateTime(date9);
		maintain.setServerId("应用服务器1号");
		maintain.setGatewayId("统一运维管理平台");
		maintain.setMaintainType("配置修改");
		maintain.setDescription("统一运维管理平台配置修改");
		maintain.setMaintainHandle("统一运维管理平台配置修改");
		maintain.setMaintainTime("100分钟");
		maintain.setResult("成功");
		pageData.add(maintain);
		
		maintain=new Maintain();
		maintain.setCreateTime(date10);
		maintain.setServerId("应用服务器1号");
		maintain.setGatewayId("统一运维管理平台");
		maintain.setMaintainType("重启系统");
		maintain.setDescription("重启统一运维管理平台系统");
		maintain.setMaintainHandle("重启统一运维管理平台");
		maintain.setMaintainTime("30分钟");
		maintain.setResult("成功");
		pageData.add(maintain);
	}
}
