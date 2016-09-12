package com.dhcc.scm.blh.userManage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.userManage.NormalAccountDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.userManage.NormalAccountRole;
import com.dhcc.scm.entity.userManage.NormalUser;
import com.dhcc.scm.entity.userManage.Role;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.service.userManage.NormalAccountService;

/**
 * 标题: NormalAccountBlh.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年10月16日
 * @version V1.0 
 */
@Component
public class NormalAccountBlh extends AbstractBaseBlh{

    private static Log logger = LogFactory.getLog(NormalAccountBlh.class);
	
	public NormalAccountBlh(){
		logger.info("====new NormalAccountBlh====");
	}
	
	@Resource
	private NormalAccountService normalAccountService;
	
	@Resource
	private CommonService commonService;
	
	/**
	 * 
	* 方法名:          normalAccountList
	* 方法功能描述:    分页获取普通用户帐户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 上午9:53:08
	 */
	public void normalAccountList(BusinessRequest req){
		try {
			NormalAccountDto normalAccountDto = this.getDto(NormalAccountDto.class, req);
			normalAccountDto.setColumnValue(new String(normalAccountDto.getColumnValue().getBytes("ISO-8859-1"),"UTF-8"));
			//this.normalAccountService.normalAccountList(normalAccountDto);
			normalAccountService.listUser(normalAccountDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          saveOrUpdateNormalAccount
	* 方法功能描述:    保存或更新普通用户账户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午2:10:30
	 */
	public void saveOrUpdateNormalAccount(BusinessRequest req){
		NormalAccountDto normalAccountDto = super.getDto(NormalAccountDto.class, req);
		try {
			if(this.checkData(normalAccountDto)){
				this.normalAccountService.configOnly(normalAccountDto);
				if(null==normalAccountDto.getNormalAccounts()||normalAccountDto.getNormalAccounts().size()==0){
					if("".equals(normalAccountDto.getNormalAccount().getAccountId())||normalAccountDto.getNormalAccount().getAccountId()==null){
						normalAccountDto.getNormalAccount().setAccountName(new Date().getTime()+"");
						normalAccountDto.getNormalAccount().setPassword("1");
						normalAccountDto.getNormalAccount().getNormalUser().setDescription(normalAccountDto.getNormalAccount().getDescription());
						normalAccountDto.getNormalAccount().getNormalUser().setUseState(normalAccountDto.getNormalAccount().getUseState());
						
						normalAccountDto.getNormalAccount().setRegTime(new Date());
						normalAccountDto.getNormalAccount().getNormalUser().setRegTime(new Date());
						
						this.normalAccountService.save(normalAccountDto.getNormalAccount());
						normalAccountDto.setMessage("保存成功");
						normalAccountDto.setSuccess(true);
					}else{
						normalAccountDto.getNormalAccount().getNormalUser().setDescription(normalAccountDto.getNormalAccount().getDescription());
						normalAccountDto.getNormalAccount().getNormalUser().setRegTime(normalAccountDto.getNormalAccount().getRegTime());
						normalAccountDto.getNormalAccount().getNormalUser().setUpdateTime(normalAccountDto.getNormalAccount().getUpdateTime());
						normalAccountDto.getNormalAccount().getNormalUser().setUseState(normalAccountDto.getNormalAccount().getUseState());
						if(normalAccountDto.getNormalAccount().getNormalUser().getType().toString().equals("1")){
							normalAccountDto.getNormalAccount().getNormalUser().setVendorId(null);
						}
						if(normalAccountDto.getNormalAccount().getNormalUser().getType().toString().equals("2")){
							normalAccountDto.getNormalAccount().getNormalUser().setLocId(null);
						}
						this.normalAccountService.update(normalAccountDto);
						this.normalAccountService.saveNormalAccountRole(normalAccountDto);
						normalAccountDto.setMessage("更新成功");
						normalAccountDto.setSuccess(true);
					}
				}else{
					normalAccountDto.setMessage("账户名已占用");
					normalAccountDto.setSuccess(false);
				}
			}
		} catch (Exception e) {
			normalAccountDto.setMessage("系统异常");
			normalAccountDto.setSuccess(false);
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	/**
	 * 
	* 方法名:          checkData
	* 方法功能描述:    校验账户数据格式
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月22日 上午9:49:43
	 */
	private boolean checkData(NormalAccountDto normalAccountDto){
		//校验专户名格式
		String accountAlias = normalAccountDto.getNormalAccount().getAccountAlias();
		if(null!=accountAlias&&accountAlias.length()>0){
			 String regex1 = "[^0-9](.)*";
			 String regex2 = "^((?!@).)+$";
			 String regex3 = "^.{6,20}$";
			 boolean flag = accountAlias.matches(regex1)&&accountAlias.matches(regex2)&&accountAlias.matches(regex3);
			 if(!flag){
				 normalAccountDto.setMessage("账户名不能以数字开头，不能包含'@',长度为6-20位");
				 normalAccountDto.setSuccess(flag); 
				 return false;
			 }
		}else{
			normalAccountDto.setMessage("账户名不能为空");
			normalAccountDto.setSuccess(false); 
			return false;
		}
		
		//校验邮箱格式 
		String email = normalAccountDto.getNormalAccount().getNormalUser().getEmail();
		if(null!=email&&email.length()>0){
			 String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			 Pattern regex = Pattern.compile(check);
			 Matcher matcher = regex.matcher(email);
			 if(!matcher.matches()){
				 normalAccountDto.setMessage("邮箱格式有误");
				 normalAccountDto.setSuccess(matcher.matches()); 
				 return false;
			 }
		}
		
		//校验手机格式 
		String telphone = normalAccountDto.getNormalAccount().getNormalUser().getTelephone();
		if(null!=telphone&&telphone.length()>0){
			 String check = "^[1]([3][0-9]{1}|59|58|88|89|55)[0-9]{8}$";
			 Pattern regex = Pattern.compile(check);
			 Matcher matcher = regex.matcher(telphone);
			 if(!matcher.matches()){
				 normalAccountDto.setMessage("手机格式有误");
				 normalAccountDto.setSuccess(matcher.matches()); 
				 return false;
			 }
		}
		
		//校验身份证格式 
		String idCard = normalAccountDto.getNormalAccount().getNormalUser().getIdCard();
		if(null!=idCard&&idCard.length()>0){
			 String check = "(^[0-9]{15}$)|(^[0-9]{17}([0-9]|X)$)";
			 Pattern regex = Pattern.compile(check);
			 Matcher matcher = regex.matcher(idCard);
			 if(!matcher.matches()){
				 normalAccountDto.setMessage("身份证格式有误");
				 normalAccountDto.setSuccess(matcher.matches()); 
				 return false;
			 }
		}
		
		normalAccountDto.setSuccess(true); 
		return true;
	}
	
	/**
	 * 
	* 方法名:          deleteNormalAccount
	* 方法功能描述:    根据id删除普通用户账户
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午5:42:33
	 */
	public void deleteNormalAccount(BusinessRequest req){
		try {
			NormalAccountDto normalAccountDto = this.getDto(NormalAccountDto.class, req);
			this.normalAccountService.deleteNormalAccount(normalAccountDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          getNormalAccountRole
	* 方法功能描述:    根据普通账户id获取普通账户角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午7:10:11
	 */
	public void getNormalAccountRole(BusinessRequest req){
		try {
			NormalAccountDto normalAccountDto = super.getDto(NormalAccountDto.class, req);
			normalAccountDto.setColumnValue(new String(normalAccountDto.getColumnValue().getBytes("ISO-8859-1"),"UTF-8"));
			this.normalAccountService.getNormalAccountRole(normalAccountDto);
			
			//根据系统类型获取系统所有角色
			List<Role> roles = normalAccountDto.getRoles();
			if(roles!=null&&!roles.isEmpty()){
				//获取所有角色后,装入map中
				Map<String, Role> roleMap = new HashMap<String, Role>();
				for(int i=0;i<roles.size();i++){
					roleMap.put(roles.get(i).getRoleId().toString(), roles.get(i));
				}
				
				//根据账户id获取某个账户角色
				List<NormalAccountRole> normalAccountRoles = normalAccountDto.getNormalAccountRoles();
	            //hibernate的bug,praAccountRoles为null时,size为1
/////////////////////////////////if(praAccountRoles!=null&&!praAccountRoles.isEmpty()){
					//遍历账户角色，修改角色中的选中状态为选中
					for(int i=0;i<normalAccountRoles.size();i++){
						if(normalAccountRoles.get(i)!=null){
							Role role = roleMap.get(normalAccountRoles.get(i).getRoleId().toString());
							if(role!=null){
								role.setCheckboxFlag("1");
							}
						}
					}
//				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          saveNormalAccountRole
	* 方法功能描述:    保存账户角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午7:42:56
	 */
	public void saveNormalAccountRole(BusinessRequest req){
		NormalAccountDto normalAccountDto = super.getDto(NormalAccountDto.class, req);
		try {
			List<NormalAccountRole>	normalAccountRoles = new ArrayList<NormalAccountRole>();	
			String roleIds[] = normalAccountDto.getRoleId().split(",");
			for(int i=0;i<roleIds.length;i++){
				NormalAccountRole normalAccountRole = new NormalAccountRole();
				normalAccountRole.setAccountId(Long.valueOf(normalAccountDto.getAccountId()));
				normalAccountRole.setRoleId(Long.valueOf(roleIds[i]));
				
				normalAccountRoles.add(normalAccountRole);
			}
			normalAccountDto.setNormalAccountRoles(normalAccountRoles);
			this.normalAccountService.saveNormalAccountRole(normalAccountDto);
			
			normalAccountDto.setMessage("角色分配成功");
			normalAccountDto.setSuccess(true);
		} catch (Exception e) {
			normalAccountDto.setMessage("系统异常");
			normalAccountDto.setSuccess(true);
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	* 方法名:          getNormalAccountFunc
	* 方法功能描述:    根据普通账户id获取账户权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午8:17:02
	 */
	public void getNormalAccountFunc(BusinessRequest req){
		try {
			NormalAccountDto normalAccountDto = super.getDto(NormalAccountDto.class, req);
			this.normalAccountService.getNormalAccountFunc(normalAccountDto);
			
			List<Func> funcs = normalAccountDto.getFuncs();
			
			//组装map，避免io
			Map<String, Func> funcsMap = new HashMap<String, Func>();
			
			//获取根节点组装成Map
			List<Func> roots = new ArrayList<Func>();
			
			//获取非根节点组装成Map
			for(int i=0;i<funcs.size();i++){
				if(funcs.get(i).getParentId().equals("0")){
					roots.add(funcs.get(i));
				}
				funcsMap.put(funcs.get(i).getFuncId().toString(), funcs.get(i));
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
			
			normalAccountDto.setFuncs(roots);
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	
	}
	
	/**
	 * 
	* 方法名:          updatePassword
	* 方法功能描述:    修改普通用户帐户密码
	* @param:      账户名称normalAccountDto.normalAccount.accountName
	* @param:      账户原有密码normalAccountDto.normalAccount.password
	* @param:      账户新密码normalAccountDto.newPassword
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月18日 下午4:05:28
	 */
	public void updatePassword(BusinessRequest req){
		NormalAccountDto normalAccountDto = this.getDto(NormalAccountDto.class, req);
		try {
			NormalAccount normalAccount = this.normalAccountService.findNormalAccount(normalAccountDto);
			if(normalAccount==null){
				normalAccountDto.setMessage("用户名或密码错误");
				normalAccountDto.setSuccess(false);
			}else {
				normalAccount.setPassword(normalAccountDto.getNewPassword());
				this.normalAccountService.updatePassword(normalAccount);
				normalAccountDto.setMessage("修改成功");
				normalAccountDto.setSuccess(true);
			}
		} catch (Exception e) {
			normalAccountDto.setMessage("系统异常");
			normalAccountDto.setSuccess(false);
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	
	/**
	 * 
	* @Title: NormalAccountBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param req
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月16日 下午12:32:43
	* @version V1.0
	 */
	public void getUserInfo(BusinessRequest req){
		NormalAccountDto normalAccountDto = this.getDto(NormalAccountDto.class, req);
		String userId=WebContextHolder.getContext().getVisit().getUserInfo().getId();
		Long hopId=WebContextHolder.getContext().getVisit().getUserInfo().getHopId();
		Long LocId=WebContextHolder.getContext().getVisit().getUserInfo().getLocId();
		Long venId=WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong();
		Long userType=WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
		NormalAccount normalAccount=commonService.get(NormalAccount.class, Long.valueOf(userId));
		normalAccountDto.setNormalAccount(normalAccount);
		if(userType==1){
			normalAccountDto.setHopName(commonService.get(Hospital.class, hopId).getHospitalName());
			HopCtloc hopCtloc=commonService.get(HopCtloc.class, LocId);
			normalAccountDto.setLocName(hopCtloc.getName());
			normalAccountDto.setDestinationId(hopCtloc.getCtlocDest());
		}
		if(userType==2){
			normalAccountDto.setHopName(commonService.get(Vendor.class, venId).getName());
		}
		
	}
	
	/**
	 * 
	* @Title: NormalAccountBlh.java
	* @Description: TODO(修改用户信息)
	* @param req
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月16日 下午7:35:24
	* @version V1.0
	 */
	public void saveInfo(BusinessRequest req){
		NormalAccountDto normalAccountDto = this.getDto(NormalAccountDto.class, req);
		NormalUser normalUser=new NormalUser();
		normalUser=commonService.get(NormalAccount.class,Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId())).getNormalUser();
		normalUser.setEmail(normalAccountDto.getNormalAccount().getNormalUser().getEmail());
		normalUser.setRealName(normalAccountDto.getNormalAccount().getNormalUser().getRealName());
		normalUser.setTelephone(normalAccountDto.getNormalAccount().getNormalUser().getTelephone());
		commonService.saveOrUpdate(normalUser);
		normalAccountDto.setOpFlg("1");
	}
	
	/**
	 * 
	* @Title: NormalAccountBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param req
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月25日 上午11:36:56
	* @version V1.0
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	public void getUserByLoc(BusinessRequest req) throws NumberFormatException, IOException{
		String locid=WebContextHolder.getContext().getRequest().getParameter("locId");
		//WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(normalAccountService.getUserByLoc(Long.valueOf(locid))));
	}
	
	
	/**
	 * 
	* @Title: NormalAccountBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param req
	* @return:void 
	* @author zhouxin  
	* @date 2014年8月7日 下午3:29:54
	* @version V1.0
	 * @throws IOException 
	 */
	public void getLoginVendorId(BusinessRequest req) throws IOException{
		String vendorId=WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong().toString();
		WebContextHolder.getContext().getResponse().getWriter().write(vendorId);
	
	}
	
	
	public void findbyId(BusinessRequest req){
		NormalAccountDto normalAccountDto = this.getDto(NormalAccountDto.class, req);
		normalAccountDto.setNormalAccount(commonService.get(NormalAccount.class, normalAccountDto.getNormalAccount().getAccountId()));
	}
}
