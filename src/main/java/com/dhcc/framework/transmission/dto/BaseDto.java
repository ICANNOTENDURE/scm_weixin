package com.dhcc.framework.transmission.dto;

import java.io.IOException;
import java.io.Serializable;
import java.util.HashMap;
import java.util.UUID;

import javax.xml.bind.annotation.XmlTransient;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.web.context.WebContext;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@SuppressWarnings({ "rawtypes", "unchecked" })
@JsonInclude(Include.NON_NULL)
@JsonIgnoreProperties({"map"})
public class BaseDto implements Serializable {
	private static Log logger = LogFactory.getLog(BaseDto.class);
	private static final long serialVersionUID = 2291962030426081727L;
	@XmlTransient
	protected HashMap map;
	
	private PagerModel pageModel;
	
	private int id;
	
	/**
	 * 操作消息，如业务异常时，设置相关附加消息
	 */
	@XmlTransient
	private String msg;


	/**
	 * 操作标记：1成功；失败
	 */
	private String opFlg="1";
	
	/**
	 * 交易号
	 */
	private String tradeAccount;
	
	private String filterStr;
	
	private String sortOrder;
	
	private String sort;
	
	
	private OperateResult operateResult=new OperateResult();
	
	/**
	 * 下拉列表公共参数
	 */
	private String comgridparam;

	private int pageCount;
	
	
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public String getComgridparam() {
		return comgridparam;
	}

	public void setComgridparam(String comgridparam) {
		this.comgridparam = comgridparam;
	}

	public OperateResult getOperateResult() {
		return operateResult;
	}

	public void setOperateResult(OperateResult operateResult) {
		this.operateResult = operateResult;
	}

	public BaseDto() {

	}
	
	public BaseDto(String initTradeAccount) {
		PropertiesBean pb = PropertiesBean.getInstance();
		if(pb==null){
			try {
				pb = new PropertiesBean();
			} catch (IOException e) {
				logger.error(e.getMessage());
			}
		}
		if(pb!=null){
			tradeAccount= initTradeAccount +";" +(pb.getProperty("conf.system.shortName")+":"+UUID.randomUUID().toString());
		}else{
			tradeAccount= initTradeAccount;
		}
	}
	//@XmlTransient
	public void initTradeAccount(){
		PropertiesBean pb = PropertiesBean.getInstance();
		if(pb==null){
			try {
				pb = new PropertiesBean();
			} catch (IOException e) {
				logger.error(e.getMessage());
			}
		}
		if(pb!=null){
			WebContext webContext = WebContextHolder.getContext();
			if(webContext!=null&&webContext.getTradeAccount()!=null){
				tradeAccount=webContext.getTradeAccount() +";"+(pb.getProperty("conf.system.shortName")+":"+UUID.randomUUID().toString());
			}else{
				tradeAccount=(pb.getProperty("conf.system.shortName")+":"+UUID.randomUUID().toString());
			}
			
		}
	}
	
//	public void appendInitTradeAccount(String initTradeAccount){
//		tradeAccount= initTradeAccount +";" +tradeAccount;
//	}
	

	
	@XmlTransient
	public void setAttr(String valueKey, Object o) {
		if (map == null) {
			map = new HashMap(1);
		}
		map.put(valueKey, o);
	}

	//@XmlTransient
	public Object getAttr(String valueKey) {
		if (map == null) {
			return null;
		}
		return map.get(valueKey);
	}
	//@XmlTransient
	public void removeAttr(String key) {
		if (map == null) {
			return;
		}
		map.remove(key);
		if (map.isEmpty()) {
			map = null;
		}
	}
	//@XmlTransient
	public void clearDataContainer() {
		map = null;
	}

	
	public PagerModel getPageModel() {
		return pageModel;
	}
	
	public void setPageModel(PagerModel pageModel) {
		this.pageModel = pageModel;
	}

	/**
	 * @return id
	 */
	//@XmlTransient
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            id
	 */
	@XmlTransient
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * 获取操作消息
	 * @return
	 */
	//@XmlTransient
	public String getMsg() {
		return msg;
	}

	/**
	 *  设置操作消息
	 * @param msg
	 */
	@XmlTransient
	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 *  获取操作标识：1为成功；0为失败
	 * @return
	 */
	//@XmlTransient
	public String getOpFlg() {
		return opFlg;
	}
	
	/**
	 *  设置操作标识：1为成功；0为失败
	 * @param opFlg
	 */
	@XmlTransient
	public void setOpFlg(String opFlg) {
		this.opFlg = opFlg;
	}

	public String getTradeAccount() {
		return tradeAccount;
	}

	public void setTradeAccount(String tradeAccount) {
		this.tradeAccount = tradeAccount;
	}

	public String getFilterStr() {
		return filterStr;
	}

	public void setFilterStr(String filterStr) {
		this.filterStr = filterStr;
	}



	/**
	 * @return the sort
	 */
	public String getSort() {
		return sort;
	}

	/**
	 * @param sort the sort to set
	 */
	public void setSort(String sort) {
		this.sort = sort;
	}

	/**
	 * @return the sortOrder
	 */
	public String getSortOrder() {
		return sortOrder;
	}

	/**
	 * @param sortOrder the sortOrder to set
	 */
	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}
	
	
}
