/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ord;

import java.util.Date;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.Order;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.ven.VenDeliveritm;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.vo.ws.OrdWebVo;
import com.dhcc.scm.entity.vo.ws.OrderWebVo;

public class OrderStateDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Order order;
	
	private OrderDetailSub orderDetailSub;
	
	private ExeState exeState;
	
	private Date stdate;
	
	private Date eddate;
	
	private Date reqStDate;
	
	private Date reqEdDate;
	
	private Long state;
	
	private Long vendor;
	
	private Long purloc;
	
	private String emflag;
	
	private Long recLoc;
	
	private Long cmpFlag;
	
	private Long hopId;
	
	//webservice  用户名
	private String userName;
	
	//webservice 密码
	private String passWord;
	
	//webservice 发送标志
	private String sendFlag;
	
	//webservice 返回订单信息
	private List<OrderWebVo> orderWSVos;
	
	//webservice 执行结果
	private OperateResult OperateResult;
	
	//webservice 入参
	private List<VenDeliveritm> deliveritms;
	
	private String orderIdStr;
	
	private String ordId;
	
	private List<OrderDetailSub> orderDetailSubs;
	
	/**
	 * 供应商查询订单信息
	 */
	private OrdWebVo ordWebVo;
	
	
	public OrdWebVo getOrdWebVo() {
		return ordWebVo;
	}

	public void setOrdWebVo(OrdWebVo ordWebVo) {
		this.ordWebVo = ordWebVo;
	}

	public List<OrderDetailSub> getOrderDetailSubs() {
		return orderDetailSubs;
	}

	public void setOrderDetailSubs(List<OrderDetailSub> orderDetailSubs) {
		this.orderDetailSubs = orderDetailSubs;
	}

	public String getOrdId() {
		return ordId;
	}

	public void setOrdId(String ordId) {
		this.ordId = ordId;
	}

	public OrderDetailSub getOrderDetailSub() {
		return orderDetailSub;
	}

	public void setOrderDetailSub(OrderDetailSub orderDetailSub) {
		this.orderDetailSub = orderDetailSub;
	}

	/**
	 * @return the orderIdStr
	 */
	public String getOrderIdStr() {
		return orderIdStr;
	}

	/**
	 * @param orderIdStr the orderIdStr to set
	 */
	public void setOrderIdStr(String orderIdStr) {
		this.orderIdStr = orderIdStr;
	}

	/**
	 * @return the deliveritms
	 */
	public List<VenDeliveritm> getDeliveritms() {
		return deliveritms;
	}

	/**
	 * @param deliveritms the deliveritms to set
	 */
	public void setDeliveritms(List<VenDeliveritm> deliveritms) {
		this.deliveritms = deliveritms;
	}

	/**
	 * @return the operateResult
	 */
	public OperateResult getOperateResult() {
		return OperateResult;
	}

	/**
	 * @param operateResult the operateResult to set
	 */
	public void setOperateResult(OperateResult operateResult) {
		OperateResult = operateResult;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the passWord
	 */
	public String getPassWord() {
		return passWord;
	}

	/**
	 * @param passWord the passWord to set
	 */
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	/**
	 * @return the sendFlag
	 */
	public String getSendFlag() {
		return sendFlag;
	}

	/**
	 * @param sendFlag the sendFlag to set
	 */
	public void setSendFlag(String sendFlag) {
		this.sendFlag = sendFlag;
	}

	

	/**
	 * @return the orderWSVos
	 */
	public List<OrderWebVo> getOrderWSVos() {
		return orderWSVos;
	}

	/**
	 * @param orderWSVos the orderWSVos to set
	 */
	public void setOrderWSVos(List<OrderWebVo> orderWSVos) {
		this.orderWSVos = orderWSVos;
	}

	/**
	 * @return the hopId
	 */
	public Long getHopId() {
		return hopId;
	}

	/**
	 * @param hopId the hopId to set
	 */
	public void setHopId(Long hopId) {
		this.hopId = hopId;
	}

	/**
	 * @return the cmpFlag
	 */
	public Long getCmpFlag() {
		return cmpFlag;
	}

	/**
	 * @param cmpFlag the cmpFlag to set
	 */
	public void setCmpFlag(Long cmpFlag) {
		this.cmpFlag = cmpFlag;
	}

	/**
	 * @return the recLoc
	 */
	public Long getRecLoc() {
		return recLoc;
	}

	/**
	 * @param recLoc the recLoc to set
	 */
	public void setRecLoc(Long recLoc) {
		this.recLoc = recLoc;
	}

	/**
	 * @return the stdate
	 */
	public Date getStdate() {
		return stdate;
	}

	/**
	 * @param stdate the stdate to set
	 */
	public void setStdate(Date stdate) {
		this.stdate = stdate;
	}

	/**
	 * @return the eddate
	 */
	public Date getEddate() {
		return eddate;
	}

	/**
	 * @param eddate the eddate to set
	 */
	public void setEddate(Date eddate) {
		this.eddate = eddate;
	}

	/**
	 * @return the reqStDate
	 */
	public Date getReqStDate() {
		return reqStDate;
	}

	/**
	 * @param reqStDate the reqStDate to set
	 */
	public void setReqStDate(Date reqStDate) {
		this.reqStDate = reqStDate;
	}

	/**
	 * @return the reqEdDate
	 */
	public Date getReqEdDate() {
		return reqEdDate;
	}

	/**
	 * @param reqEdDate the reqEdDate to set
	 */
	public void setReqEdDate(Date reqEdDate) {
		this.reqEdDate = reqEdDate;
	}

	/**
	 * @return the state
	 */
	public Long getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(Long state) {
		this.state = state;
	}

	/**
	 * @return the vendor
	 */
	public Long getVendor() {
		return vendor;
	}

	/**
	 * @param vendor the vendor to set
	 */
	public void setVendor(Long vendor) {
		this.vendor = vendor;
	}

	/**
	 * @return the purloc
	 */
	public Long getPurloc() {
		return purloc;
	}

	/**
	 * @param purloc the purloc to set
	 */
	public void setPurloc(Long purloc) {
		this.purloc = purloc;
	}

	/**
	 * @return the emflag
	 */
	public String getEmflag() {
		return emflag;
	}

	/**
	 * @param emflag the emflag to set
	 */
	public void setEmflag(String emflag) {
		this.emflag = emflag;
	}

	/**
	 * @return the exeState
	 */
	public ExeState getExeState() {
		return exeState;
	}

	/**
	 * @param exeState the exeState to set
	 */
	public void setExeState(ExeState exeState) {
		this.exeState = exeState;
	}

	/**
	 * @return the order
	 */
	public Order getOrder() {
		return order;
	}

	/**
	 * @param order the order to set
	 */
	public void setOrder(Order order) {
		this.order = order;
	}
	
	
}
