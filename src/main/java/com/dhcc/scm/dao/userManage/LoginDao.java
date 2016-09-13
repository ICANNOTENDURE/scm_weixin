package com.dhcc.scm.dao.userManage;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.dto.login.LoginDto;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.vo.login.LoginVo;
import com.dhcc.scm.tool.func.FuncComparator;

/**
 * <p>标题: LoginDao.java</p>
 * <p>业务描述:Kerberos登录服务Dao</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月23日
 * @version V1.0 
 */
@Repository
public class LoginDao extends HibernatePersistentObjectDAO<NormalAccount>{

	@Override
	public void buildPagerModelQuery(PagerModel arg0, BaseDto arg1) {

	}
	
	/**
	 * 
	* 方法名:          getPraAccountPassword
	* 方法功能描述:    查询从业人员账户密码
	* @param:         LoginDto
	* @return:        账户密码
	* @Author:        于鸿
	* @Create Date:   2013年9月26日 下午2:18:49
	 */
	public String getPraAccountPassword(LoginVo loginVo) {
		
		String loginType=loginVo.getLoginType();
		String userName=loginVo.getUserName();

		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append("select praAccount.accountId,praAccount.password from PraAccount praAccount where ");
		hqlStr.append(loginType).append("=?");
		List<Object[]>  listObj=this.findByHql(hqlStr.toString(), userName);

		String password="";
		if(listObj.size()>0){
			loginVo.setAccountId(listObj.get(0)[0].toString());
			password=listObj.get(0)[1].toString();
		}
		return password;
	}
	
	/**
	 * 
	* 方法名:          getNormalAccountPassword
	* 方法功能描述:    查询普通用户账户密码
	* @param:         LoginDto
	* @return:        账户密码
	* @Author:        于鸿
	* @Create Date:   2013年9月26日 下午2:18:49
	 */
	public String getNormalAccountPassword(LoginVo loginVo) {
		String loginType=loginVo.getLoginType();
		String userName=loginVo.getUserName();

		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append("select normalAccount.accountId,normalAccount.password from NormalAccount normalAccount where ");
		hqlStr.append(loginType).append("=?");
		List<Object[]>  listObj=this.findByHql(hqlStr.toString(), userName);

		String password="";
		if(listObj.size()>0){
			loginVo.setAccountId(listObj.get(0)[0].toString());
			password=listObj.get(0)[1].toString();
		}
		return password;
	}
	
	/**
	 * 
	* 方法名:          getGatewayPassword
	* 方法功能描述:    查询应用系统的通信密码
	* @param:         LoginDto
	* @return:        应用系统通信密码
	* @Author:        于鸿
	* @Create Date:   2013年9月26日 下午2:19:27
	 */
	public String getGatewayPassword(LoginVo loginVo) {
		String gatewayId=loginVo.getGatewayId();
		
		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append("select gateway.systemType,systemType.version,gateway.password from Gateway gateway where gatewayId=?");
		List<Object[]> listObj=this.findByHql(hqlStr.toString(),gatewayId);

		String password="";
		if(listObj.size()>0){
			loginVo.setSystemType(listObj.get(0)[0].toString());
			loginVo.setVersion(listObj.get(0)[1].toString());
			password=listObj.get(0)[2].toString();
		}
		return password;
	}
	
	/**
	 * 
	* 方法名:          getGatewayPassword
	* 方法功能描述:    查询应用系统的通信密码
	* @param:         应用系统类型，应用系统版本
	* @return:        应用系统通信密码;
	* @Author:        于鸿
	* @Create Date:   2013年9月26日 下午2:19:27
	 */
	public String getGatewayPassword(String systemType,String version) {
		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append("select password from Gateway gateway where systemType=? and version=? and useState=?");
		List<String> listStr=this.findByHql(hqlStr.toString(),systemType,version,"1");

		String password="";
		if(listStr.size()>0){
			password=listStr.get(0);
		}
		return password;
	}
	
	/**
	 * 
	* 方法名:          getPraAccountFunc
	* 方法功能描述:    获取从业人员在要访问的应用系统的账户权限
	* @param:         LoginDto
	* @return:        以^分隔的权限信息;
	* @Author:        于鸿
	* @Create Date:   2013年9月26日 下午2:24:27
	 */
	public String getPraAccountFunc(LoginVo loginVo) {
		String accountId=loginVo.getAccountId();
		String systemType=loginVo.getSystemType();
		
		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append("select role.roleCode,role.roleName,role.roleId from Role role,PraAccountRole praAccountRole ");
		hqlStr.append("where role.roleId=praAccountRole.roleId and role.systemType=? and praAccountRole.accountId=?");
		// 查询账户在请求访问的业务系统中具有的角色
		@SuppressWarnings("unchecked")
		List<Object[]> listObj=this.findByHql(hqlStr.toString(),systemType,accountId);
		
		// roleFunc=[{roleCode:roleCode,roleName:roleName,securityUrl:securityUrl}]
		StringBuilder roleFunc=new StringBuilder(64);
		roleFunc.append("[");
		for (int i = 0; i < listObj.size(); i++) {
			roleFunc.append("{\"roleCode\":\"").append(listObj.get(i)[0].toString()).append("\",");
			roleFunc.append("\"roleName\":\"").append(listObj.get(i)[1].toString()).append("\",");
			hqlStr.delete(0, hqlStr.length());
			hqlStr.append("select func.secutiryUrl from Func func,RoleFunc roleFunc ");
			hqlStr.append("where func.funcId=roleFunc.funcId and roleFunc.roleId=?");

			// 查询账户在请求访问的业务系统中具有的权限
			List<String> listFunc=this.findByHql(hqlStr.toString(),listObj.get(i)[2].toString());
			Set<String> secutiryUrlSet=new HashSet<String>();
			
			logger.info("\n-----listFunc------\n"+listFunc);
			logger.info("\n-----listFunc------\n"+listFunc.size());
			secutiryUrlSet.addAll(listFunc);
			secutiryUrlSet.remove("");
			secutiryUrlSet.remove(null);
			logger.info("\n-----urlSet------\n"+secutiryUrlSet);
			logger.info("\n-----urlSet------\n"+secutiryUrlSet.size());
			for (int j = 0; j < listFunc.size(); j++) {
				//logger.info(j+"\n-----listFunc------\n"+listFunc.get(j));
			}
			Iterator<String> secutiryUrlIt = secutiryUrlSet.iterator();
			roleFunc.append("\"secutiryUrl\":\"");
			int k=0;
			while (secutiryUrlIt.hasNext()) {
				k=k+1;
				String secutiryUrl=secutiryUrlIt.next();
				logger.info(k+"\n-----secutiryUrlIt------\n"+secutiryUrl);
				roleFunc.append(secutiryUrl).append(",");
			}
			if (secutiryUrlSet.size()>0) {
				roleFunc.deleteCharAt(roleFunc.length()-1);
			}
			roleFunc.append("\"},");
		}
		if (listObj.size()>0) {
			roleFunc.deleteCharAt(roleFunc.length()-1);
		}
		roleFunc.append("]");
		logger.info("\n-----roleFunc------\n"+roleFunc);
		return roleFunc.toString();
	}
	/**
	 * 
	* 方法名:          getPraAccountFunc
	* 方法功能描述:    获取从业人员在要访问的应用系统的账户权限
	* @param:         LoginDto
	* @return:        以^分隔的权限信息;
	* @Author:        周鑫
	* @Create Date:   2014年3月28日 
	 */
	public String getNorAccountFunc(LoginVo loginVo) {
		String accountId=loginVo.getAccountId();
		
		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append("select role.roleCode,role.roleName,role.roleId from Role role,NormalAccountRole normalAccountRole ");
		hqlStr.append("where role.roleId=normalAccountRole.roleId  and normalAccountRole.accountId=?");
		// 查询账户在请求访问的业务系统中具有的角色
		@SuppressWarnings("unchecked")
		List<Object[]> listObj=this.findByHql(hqlStr.toString(),Long.valueOf(accountId));
		
		// roleFunc=[{roleCode:roleCode,roleName:roleName,securityUrl:securityUrl}]
		StringBuilder roleFunc=new StringBuilder(64);
		roleFunc.append("[");
		for (int i = 0; i < listObj.size(); i++) {
			roleFunc.append("{\"roleCode\":\"").append(listObj.get(i)[0].toString()).append("\",");
			roleFunc.append("\"roleName\":\"").append(listObj.get(i)[1].toString()).append("\",");
			hqlStr.delete(0, hqlStr.length());
			hqlStr.append("select func.secutiryUrl from Func func,RoleFunc roleFunc ");
			hqlStr.append("where func.funcId=roleFunc.funcId and roleFunc.roleId=?");

			// 查询账户在请求访问的业务系统中具有的权限
			List<String> listFunc=this.findByHql(hqlStr.toString(),listObj.get(i)[2]);
			Set<String> secutiryUrlSet=new HashSet<String>();
			
//			logger.info("\n-----listFunc------\n"+listFunc);
//			logger.info("\n-----listFunc------\n"+listFunc.size());
			secutiryUrlSet.addAll(listFunc);
			secutiryUrlSet.remove("");
			secutiryUrlSet.remove(null);
//			logger.info("\n-----urlSet------\n"+secutiryUrlSet);
//			logger.info("\n-----urlSet------\n"+secutiryUrlSet.size());
//			for (int j = 0; j < listFunc.size(); j++) {
//				logger.info(j+"\n-----listFunc------\n"+listFunc.get(j));
//			}
			Iterator<String> secutiryUrlIt = secutiryUrlSet.iterator();
			roleFunc.append("\"secutiryUrl\":\"");
			int k=0;
			while (secutiryUrlIt.hasNext()) {
				k=k+1;
				String secutiryUrl=secutiryUrlIt.next();
				//logger.info(k+"\n-----secutiryUrlIt------\n"+secutiryUrl);
				roleFunc.append(secutiryUrl).append(",");
			}
			if (secutiryUrlSet.size()>0) {
				roleFunc.deleteCharAt(roleFunc.length()-1);
			}
			roleFunc.append("\"},");
		}
		if (listObj.size()>0) {
			roleFunc.deleteCharAt(roleFunc.length()-1);
		}
		roleFunc.append("]");
		//logger.info("\n-----roleFunc------\n"+roleFunc);
		return roleFunc.toString();
	}
	/**
	 * 
	* 方法名:          getPraAccountFunc
	* 方法功能描述:    获取从业人员在要访问的应用系统的账户权限
	* @param:         LoginDto
	* @return:        以^分隔的权限信息;
	* @Author:        周鑫
	* @Create Date:   2014年3月28日 
	 */
	public String getNorAccountMainFuncJson(LoginVo loginVo) {
		String mainStr="";
		String accountId=loginVo.getAccountId();
		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append("select role.roleCode,role.roleName,role.roleId from Role role,NormalAccountRole normalAccountRole ");
		hqlStr.append("where role.roleId=normalAccountRole.roleId  and normalAccountRole.accountId=?");
		// 查询账户在请求访问的业务系统中具有的角色
		@SuppressWarnings("unchecked")
		List<Object[]> listObj=this.findByHql(hqlStr.toString(),Long.valueOf(accountId));
		List<Func> funcSet=new ArrayList<Func>();
		for (int i = 0; i < listObj.size(); i++) {
			
			hqlStr.delete(0, hqlStr.length());
			//hqlStr.append("select new com.dhcc.scm.entity.userManage.Func(func.funcId,func.funcName,func.secutiryUrl) from Func func,RoleFunc roleFunc ");
			hqlStr.append("select new com.dhcc.scm.entity.userManage.Func(func.funcId,func.funcName,func.parentId,func.isLeaf,func.menuSeq,func.url,func.imgUrl,func.secutiryUrl,func.useState,func.backColor) from Func func,RoleFunc roleFunc ");
			hqlStr.append("where func.funcId=roleFunc.funcId and roleFunc.roleId=? and func.useState=1");
//			if (loginVo.getIsRoot().equals("0")){
//				hqlStr.append("where func.funcId=roleFunc.funcId and roleFunc.roleId=? and func.parentId=?");
//			}else{
//				hqlStr.append("where func.funcId=roleFunc.funcId and roleFunc.roleId=? and func.parentId!=?");
//			}
			
			@SuppressWarnings("unchecked")
			List<Func> listFunc=this.findByHql(hqlStr.toString(),listObj.get(i)[2]);
			funcSet.addAll(listFunc);
		}
		//组装map，避免io
        Map<String, Func> funcsMap = new LinkedHashMap<String, Func>();
		
		//获取根节点组装成Map
		List<Func> roots = new ArrayList<Func>();
		
		//获取非根节点组装成Map
		Collections.sort(funcSet,new FuncComparator());
		
		for(int i=0;i<funcSet.size();i++){
			funcSet.get(i).setIsLeaf("1");
			if(funcSet.get(i).getParentId().equals("0")){
				roots.add(funcSet.get(i));
			}
			funcsMap.put(funcSet.get(i).getFuncId().toString(), funcSet.get(i));
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
		mainStr=JsonUtils.toJson(roots);
		return mainStr;
	}	
	

	@SuppressWarnings("unchecked")
	public List<Func> getFuncByParentId(LoginDto loginDto) {
		StringBuilder hqlStr=new StringBuilder();
		Map<String, Object>hqlParamMap=new HashMap<String, Object>();
		hqlStr.append(" from Func f");
		
		if(!StringUtils.isNullOrEmpty(loginDto.getFunc().getParentId())){
			hqlStr.append(" where f.parentId =:parentId");
			hqlParamMap.put("parentId",loginDto.getFunc().getParentId());
		}
		return (List<Func>)this.findByHqlWithValuesMap(hqlStr.toString(), hqlParamMap, false);
	}

	/**
	 * @param userName
	 * @return
	 */
	public String getUserPassword(String userName) {
		String userId="";
		String loginType="accountAlias";
		//String userName=loginVo.getUserName();

		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append("select normalAccount.accountId,normalAccount.password from NormalAccount normalAccount where ");
		hqlStr.append(loginType).append("=?");
		List<Object[]>  listObj=this.findByHql(hqlStr.toString(), userName);

		String password="";
		if(listObj.size()>0){
			userId=listObj.get(0)[1].toString();
			password=listObj.get(0)[1].toString();
		}
		return userId+"^"+password;
	}
	
	
	
	
}
