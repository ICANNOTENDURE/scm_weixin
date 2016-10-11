package com.dhcc.scm.web.login.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.entity.sys.SysBanner;

@Namespace(value="/")
@Scope("prototype")
@Action(value="login",results={
		@Result(name="loginRest" ,location="/WEB-INF/jsp/login.jsp")
		})
public class LoginInitAction extends BaseAction{

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID :
	*/
	private static final long serialVersionUID = 1L;
	
	
	private List<SysBanner> banners;
	
	@Resource
	private CommonService commonService;
	
	@Override
	protected void prepareRequest(BusinessRequest arg0) throws BaseException {
		arg0.setDto(null);
	}
	
	/**
	 * 直接跳转
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String directlyJump(){
		DetachedCriteria criteria = DetachedCriteria.forClass(SysBanner.class);
		criteria.add(Restrictions.eq("bannerStatus","0"));
		criteria.addOrder(Order.asc("bannerSeq"));
		banners=commonService.findByDetachedCriteria(criteria);
		return "loginRest"; 
	}
	
	@Override
	public BaseDto getBaseDto() {
		return null;
	}

	public List<SysBanner> getBanners() {
		return banners;
	}

	public void setBanners(List<SysBanner> banners) {
		this.banners = banners;
	}
	
	
	
}
