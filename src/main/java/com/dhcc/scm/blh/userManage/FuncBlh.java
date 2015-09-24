package com.dhcc.scm.blh.userManage;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.SystemVersionDto;
import com.dhcc.scm.dto.userManage.FuncDto;
import com.dhcc.scm.entity.platformManage.SystemVersion;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.service.userManage.FuncService;
import com.dhcc.scm.tool.func.FuncComparator;

/**
 * 标题: FuncBlh.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年8月29日
 * @version V1.0 
 */
@Component
public class FuncBlh extends AbstractBaseBlh{
	
	private static Log logger = LogFactory.getLog(FuncBlh.class);
	
	public FuncBlh(){
		logger.info("====new FuncBlh====");
	}

	@Resource
	private FuncService funcService;
	
	/**
	 * 
	* 方法名:          funcList
	* 方法功能描述:      获取权限树
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月23日 下午3:01:16
	 */
	public void funcList(BusinessRequest req){
		try {
			FuncDto funcDto = super.getDto(FuncDto.class, req);
			this.funcService.funcList(funcDto);
			
			//组装map，避免io
            Map<String, Func> funcsMap = new LinkedHashMap<String, Func>();
			
			//获取根节点组装成Map
			List<Func> roots = new ArrayList<Func>();
			
			//获取非根节点组装成Map
			List<Func> funcsTemp = funcDto.getFuncs();
			Collections.sort(funcsTemp,new FuncComparator());
			
			for(int i=0;i<funcsTemp.size();i++){
				if(funcsTemp.get(i).getParentId().equals("0")){
					roots.add(funcsTemp.get(i));
				}
				funcsMap.put(funcsTemp.get(i).getFuncId().toString(), funcsTemp.get(i));
			}
			
			//遍历Map缕清父子关系
			Iterator<String> keys = funcsMap.keySet().iterator();
			while(keys.hasNext()){			
				String key = keys.next();		
				Func func = funcsMap.get(key);	
				if(!func.getParentId().equals("0")){
					Func parentFunc = funcsMap.get(func.getParentId());
					parentFunc.getChildren().add(func);
				}
			}
			
			funcDto.setFuncs(roots);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          saveOrUpdateFunc
	* 方法功能描述:    保存或更新权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月10日 下午8:29:35
	 */
	public void saveOrUpdateFunc(BusinessRequest req){
		FuncDto funcDto = super.getDto(FuncDto.class, req);
		try {
			this.funcService.configOnly(funcDto);
			if(null==funcDto.getFuncs()||funcDto.getFuncs().size()==0){
				if((funcDto.getFunc().getParentId()==null)||(funcDto.getFunc().getParentId().equals(""))){
					funcDto.getFunc().setParentId("0");
					funcDto.getFunc().setIsLeaf("0");
				}
				if(funcDto.getFunc().getParentId().equals("0")){
					funcDto.getFunc().setIsLeaf("0");
				}
				if("".equals(funcDto.getFunc().getFuncId())||funcDto.getFunc().getFuncId()==null){
					this.funcService.saveFunc(funcDto.getFunc());
					funcDto.setMessage("保存成功");
					funcDto.setSuccess(true);
				}else{
					funcDto.setFunc(funcDto.getFunc());
					funcDto.setParentId(funcDto.getFunc().getParentId());
					this.funcService.updateFunc(funcDto);
					funcDto.setMessage("修改成功");
					funcDto.setSuccess(true);
				}
			}else{
				funcDto.setMessage("权限编号已占用");
				funcDto.setSuccess(false);
			}
		} catch (Exception e) {
			funcDto.setMessage("系统错误");
			funcDto.setSuccess(false);
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          deleteFunc
	* 方法功能描述:    删除权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月10日 下午8:29:11
	 */
	public void deleteFunc(BusinessRequest req){
		try {
			this.funcService.deleteFunc((super.getDto(FuncDto.class, req)).getFunc().getFuncId());
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          getFuncListBySystemType
	* 方法功能描述:    通过系统类型代码获取该系统下的所有权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月4日 下午7:33:37
	 */
	public void getFuncListBySystemType(BusinessRequest req){
		try {
			FuncDto funcDto = super.getDto(FuncDto.class, req);
			
			this.funcService.getFuncListBySystemType(funcDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          getSystemVersion
	* 方法功能描述:        获取系统类型
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月4日 下午3:20:09
	 */
	public void getSystemVersion(BusinessRequest req){
		try {
			FuncDto funcDto = super.getDto(FuncDto.class, req);
			SystemVersionDto systemVersionDto = new SystemVersionDto();
			systemVersionDto.setColumnName(funcDto.getColumnName());
			systemVersionDto.setColumnValue(funcDto.getColumnValue());
			List<SystemVersion> systemVersions = this.funcService.getSystemVersion(systemVersionDto);
			funcDto.setSystemVersions(systemVersions);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          getFuncsByAccount
	* 方法功能描述:    通过账户信息获取账户权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月15日 下午2:04:42
	 */
	public void getFuncsByAccount(BusinessRequest req){
		try {
			FuncDto funcDto = super.getDto(FuncDto.class, req);
			this.funcService.getFuncsByAccount(funcDto);
			
			//组装map，避免io
            Map<String, Func> funcsMap = new LinkedHashMap<String, Func>();
			
			//获取根节点组装成Map
			List<Func> roots = new ArrayList<Func>();
			
			//获取非根节点组装成Map
			List<Func> funcsTemp = funcDto.getFuncs();
			Collections.sort(funcsTemp,new FuncComparator());
			
			for(int i=0;i<funcsTemp.size();i++){
				funcsTemp.get(i).setIsLeaf("1");
				if(funcsTemp.get(i).getParentId().equals("0")){
					roots.add(funcsTemp.get(i));
				}
				funcsMap.put(funcsTemp.get(i).getFuncId().toString(), funcsTemp.get(i));
			}
			
			//遍历Map缕清父子关系
			Iterator<String> keys = funcsMap.keySet().iterator();
			while(keys.hasNext()){			
				String key = keys.next();		
				Func func = funcsMap.get(key);	
				if(!func.getParentId().equals("0")){
					Func parentFunc = funcsMap.get(func.getParentId());
					parentFunc.getChildren().add(func);
					parentFunc.setIsLeaf("0");
				}
			}
			
			funcDto.setFuncs(roots);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          configOnly
	* 方法功能描述:    确定权限编号的唯一性
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月20日 下午2:13:10
	 */
	public void configOnly(BusinessRequest req){
		try {
			FuncDto funcDto = super.getDto(FuncDto.class, req);
			this.funcService.configOnly(funcDto);
			if(null==funcDto.getFuncs()||funcDto.getFuncs().size()==0){
				funcDto.setSuccess(true);
			}else{
				funcDto.setSuccess(false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	
	
}










