package com.dhcc.scm.blh.userManage;

import java.util.ArrayList;
import java.util.Date;
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
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.userManage.RoleDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.userManage.RoleFunc;
import com.dhcc.scm.entity.userManage.RoleLoc;
import com.dhcc.scm.entity.userManage.RoleVendor;
import com.dhcc.scm.entity.vo.tree.TreeVO;
import com.dhcc.scm.service.userManage.RoleService;

/**
 * 标题: RoleBlh.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年9月3日
 * @version V1.0 
 */
@Component
public class RoleBlh extends AbstractBaseBlh{
	
	private static Log logger = LogFactory.getLog(RoleBlh.class);
	
	public RoleBlh(){
		logger.info("====new RoleBlh====");
	}
	
	@Resource
	private RoleService roleService;
	
	@Resource
	private CommonService commonService;
	
	/**
	 * 
	* 方法名:          roleList
	* 方法功能描述:    分页获取角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月3日 下午3:11:47
	 */
	public void roleList(BusinessRequest req){
		try {
			RoleDto roleDto = super.getDto(RoleDto.class, req); 
			roleDto.setColumnValue(new String(roleDto.getColumnValue().getBytes("ISO-8859-1"),"UTF-8"));
			this.roleService.getRoleListByPagerModel(roleDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          saveOrUpdateRole
	* 方法功能描述:    保存或更新角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月5日 上午11:22:45
	 */
	public void saveOrUpdateRole(BusinessRequest req){
		try {
			RoleDto roleDto = super.getDto(RoleDto.class, req);
			
			if("".equals(roleDto.getRole().getRoleId())||roleDto.getRole().getRoleId()==null){
				roleDto.getRole().setCreateTime(new Date());
				this.roleService.saveRole(roleDto.getRole());
			}else{
				this.roleService.updateRole(roleDto);
				this.roleService.saveRoleFunc(roleDto);
			}
//			if("".equals(roleDto.getRole().getRoleId())){
//				roleDto.getRole().setRoleId(null);;
//			}
//			commonService.saveOrUpdate(roleDto.getRole());
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          deleteRole
	* 方法功能描述:        删除角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月5日 上午9:36:08
	 */
	public void deleteRole(BusinessRequest req){
		try {
			this.roleService.deleteRole(super.getDto(RoleDto.class, req).getRole().getRoleId().toString());
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          funcList
	* 方法功能描述:      获取机构权限树显示
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月23日 下午3:01:16
	 */
	public void getRoleFuncs(BusinessRequest req){
		try {
			RoleDto roleDto = super.getDto(RoleDto.class, req);
			this.roleService.getRoleFuncs(roleDto);
			
			//根据系统类型获取所有节点
			List<Func> funcs = roleDto.getFuncs();
			
			//根据角色id获取角色已有权限
			List<RoleFunc> roleFuncs = roleDto.getRoleFuncs();
			
			//获取根节点
			List<Func> roots = new ArrayList<Func>();
			
			if(null!=funcs&&funcs.size()!=0){
				//组装map,避免io
		        Map<String, Func> funcsMap = new HashMap<String, Func>();
				//将获取的根节点组装成Map
				for(int i=0;i<funcs.size();i++){
					//获取根节点
					if(funcs.get(i).getParentId().equals("0")){
						roots.add(funcs.get(i));
					}
					funcsMap.put(funcs.get(i).getFuncId().toString(), funcs.get(i));
				}
				
				//遍历Map
				Iterator<String> keys = funcsMap.keySet().iterator();
				while(keys.hasNext()){			
					String key = keys.next();		
					Func func = funcsMap.get(key);
					//缕清父子关系
					if(!func.getParentId().equals("0")){
						Func parentFunc = funcsMap.get(func.getParentId());
						parentFunc.getChildren().add(func);
					}
				}
		
	            //当roleFuncs为空时，size任然不为0	
/////////////////////////////////if(roleFuncs!=null&&!roleFuncs.isEmpty()){
					//遍历角色已有权限，修改显示状态为选中
					for(int i=0;i<roleFuncs.size();i++){
						if(roleFuncs.get(i)!=null){
							Func func = funcsMap.get(roleFuncs.get(i).getFuncId().toString());
							if(func!=null&&func.getIsLeaf().equals("1")){
								func.setChecked(true);
							}
						}
					}
//				}
			}
			
			roleDto.setFuncs(roots);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	
	
	
	
	/**
	 * 
	* 方法名:          normalAccountList
	* 方法功能描述:    获取拥有该角色的普通用户账户
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月31日 上午11:28:46
	 */
	public void normalAccountList(BusinessRequest req){
		try {
			RoleDto roleDto = super.getDto(RoleDto.class, req);
			
			this.roleService.normalAccountList(roleDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	

	
	
	
	/**
	 * 
	* @Title: RoleBlh.java
	* @Description: TODO(按分类列出供应商)
	* @param req
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午4:01:32
	* @version V1.0
	 */
	public void getRoleVens(BusinessRequest req){
		try {
			RoleDto roleDto = super.getDto(RoleDto.class, req);
			this.roleService.getRoleVens(roleDto);
			
			//根据系统类型获取所有供应商
			List<HopVendor> hopVendors = roleDto.getHopVendors();
			
			//根据角色id获取角色已有供应商
			List<RoleVendor> roleVendors = roleDto.getRoleVendors();
			
			//获取根节点
			List<TreeVO> roots = new ArrayList<TreeVO>();
			
			Map<String, TreeVO> rootMap=new HashMap<String, TreeVO>();
			
			 Map<String,String> funMap=new HashMap<String, String>();  
		     for(RoleVendor  roleVendor:roleVendors){  
		        if(roleVendor==null){  
		            continue;  
		        }  
		        funMap.put(roleVendor.getSysVenId().toString(), roleVendor.getSysVenId().toString());  
		      } 
			
			if(null!=hopVendors&&hopVendors.size()!=0){
				//将获取的根节点组装成Map
				for(int i=0;i<hopVendors.size();i++){
					String type=hopVendors.get(i).getHopType()+"("+hopVendors.get(i).getHopHopId().toString()+")";
					String hopVenId=hopVendors.get(i).getHopVendorId().toString();
					TreeVO treeVO=new TreeVO();
					treeVO.setId(hopVenId);
					treeVO.setText(hopVendors.get(i).getHopName());
					
					if(!rootMap.containsKey(type)){
						TreeVO TreeVO2=new TreeVO();
						TreeVO2.setId("0");
						TreeVO2.setText(type);
						rootMap.put(type, TreeVO2);
					}
					if(funMap.containsKey(hopVenId)){
						treeVO.setChecked(true);
					}
					rootMap.get(type).getChildren().add(treeVO);
				}
				
				
				Iterator<String> it = rootMap.keySet().iterator();
		        while (it.hasNext()) {
		        	String key = it.next().toString();
		        	roots.add(rootMap.get(key));
		        }
		
			}
			
			roleDto.setTreeVOs(roots);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	
	/**
	 * 
	* @Title: RoleBlh.java
	* @Description: TODO(查询科室)
	* @param req
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午8:26:03
	* @version V1.0
	 */
	public void getRoleLocs(BusinessRequest req){
		try {
			RoleDto roleDto = super.getDto(RoleDto.class, req);
			this.roleService.getRoleLocs(roleDto);
			
			//根据当前登录医院获取所有科室
			List<HopCtloc>  hopCtlocs= roleDto.getHopCtlocs();
			
			//根据角色id获取角色已有科室
			List<RoleLoc> roleVendors = roleDto.getRoleLocs();
			
			//获取根节点
			List<TreeVO> roots = new ArrayList<TreeVO>();
			
			Map<String, TreeVO> rootMap=new HashMap<String, TreeVO>();
			
			 Map<String,String> funMap=new HashMap<String, String>();  
		     for(RoleLoc  roleLoc:roleVendors){  
		        if(roleLoc==null){  
		            continue;  
		        }  
		        funMap.put(roleLoc.getSysLocId().toString(), roleLoc.getSysLocId().toString());  
		      } 
			
			if(null!=hopCtlocs&&hopCtlocs.size()!=0){
				//将获取的根节点组装成Map
				for(HopCtloc hopCtloc:hopCtlocs){
					String hopCtlocId=hopCtloc.getHopCtlocId().toString();
					String hopId=hopCtloc.getHospid().toString();
					TreeVO treeVO=new TreeVO();
					treeVO.setId(hopCtlocId);
					treeVO.setText(hopCtloc.getName());
					
					if(!rootMap.containsKey(hopId)){
						TreeVO TreeVO2=new TreeVO();
						TreeVO2.setId("0");
						TreeVO2.setText(hopId);
						rootMap.put(hopId, TreeVO2);
					}
					if(funMap.containsKey(hopCtlocId)){
						treeVO.setChecked(true);
					}
					rootMap.get(hopId).getChildren().add(treeVO);
				}
				
				
				Iterator<String> it = rootMap.keySet().iterator();
		        while (it.hasNext()) {
		        	String key = it.next().toString();
		        	roots.add(rootMap.get(key));
		        }
		
			}
			
			roleDto.setTreeVOs(roots);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	
	/**
	 * 
	* 方法名:          saveRoleFunc
	* 方法功能描述:    分配角色权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月29日 下午3:39:29
	 */
	public void saveRoleFunc(BusinessRequest req){
		RoleDto roleDto = super.getDto(RoleDto.class, req);
		try {
			List<RoleFunc> roleFuncs = new ArrayList<RoleFunc>();		
			String funcIds[] = roleDto.getFuncIds().split(",");
			for(int i=0;i<funcIds.length;i++){
				RoleFunc roleFunc = new RoleFunc();
				roleFunc.setRoleId(Long.valueOf(roleDto.getRoleId()));
				roleFunc.setFuncId(Long.valueOf(funcIds[i]));
				
				roleFuncs.add(roleFunc);
			}
			roleDto.setRoleFuncs(roleFuncs);
			this.roleService.saveRoleFunc(roleDto);
			
			roleDto.setMessage("操作成功");
			roleDto.setSuccess(true);
		} catch (Exception e) {
			roleDto.setMessage("系统错误");
			roleDto.setSuccess(true);
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	
	/**
	 * 
	* @Title: RoleBlh.java
	* @Description: TODO(保存角色供应商权限)
	* @param req
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午8:42:27
	* @version V1.0
	 */
	public void saveRoleVen(BusinessRequest req){
		RoleDto roleDto = super.getDto(RoleDto.class, req);
		try {
			List<RoleVendor> roleVendors = new ArrayList<RoleVendor>();		
			String funcIds[] = roleDto.getVens().split(BaseConstants.COMMA);
			for(int i=0;i<funcIds.length;i++){
				RoleVendor roleVendor = new RoleVendor();
				roleVendor.setSysRoleId(Long.valueOf(roleDto.getRoleId()));
				roleVendor.setSysVenId(Long.valueOf(funcIds[i]));
				
				roleVendors.add(roleVendor);
			}
			roleDto.setRoleVendors(roleVendors);
			this.roleService.saveRoleVen(roleDto);
			
			roleDto.setMessage("操作成功");
			roleDto.setSuccess(true);
		} catch (Exception e) {
			roleDto.setMessage("系统错误");
			roleDto.setSuccess(true);
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	
	/**
	 * 
	* @Title: RoleBlh.java
	* @Description: TODO(保存角色科室)
	* @param req
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午8:48:55
	* @version V1.0
	 */
	public void saveRoleLoc(BusinessRequest req){
		RoleDto roleDto = super.getDto(RoleDto.class, req);
		try {
			List<RoleLoc> roleLocs = new ArrayList<RoleLoc>();		
			String funcIds[] = roleDto.getLocs().split(BaseConstants.COMMA);
			for(int i=0;i<funcIds.length;i++){
				RoleLoc roleLoc = new RoleLoc();
				roleLoc.setSysRoleId(Long.valueOf(roleDto.getRoleId()));
				roleLoc.setSysLocId(Long.valueOf(funcIds[i]));
				
				roleLocs.add(roleLoc);
			}
			roleDto.setRoleLocs(roleLocs);
			this.roleService.saveRoleLoc(roleDto);
			
			roleDto.setMessage("操作成功");
			roleDto.setSuccess(true);
		} catch (Exception e) {
			roleDto.setMessage("系统错误");
			roleDto.setSuccess(true);
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
}











