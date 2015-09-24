/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ord;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.ord.Ord;
import com.dhcc.scm.entity.vo.ord.OrdVo;
import com.dhcc.scm.entity.vo.ven.DelvVo;

public class OrdDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Ord ord;
	
	private Date stDate;
	
	private Date edDate;
	
	private String ordSerial;
	
	private List<OrdVo> ordVos;
	
	private Long orderItmId;
	
	private Float qty;
	
	private Long incId;
	
	private Float rp;
	
	private String uom;
	
	private List<DelvVo> delvVos;
	
	
	private String invno;
	
	private String batno;
	
	private Date expdate;
	
	private Long deliverItmid;
	
	private File upload;
	
	private String uploadFileName;
	
	private Long venIncId;
	
	private String impId;
	
	
	
	public String getImpId() {
		return impId;
	}

	public void setImpId(String impId) {
		this.impId = impId;
	}

	public Long getVenIncId() {
		return venIncId;
	}

	public void setVenIncId(Long venIncId) {
		this.venIncId = venIncId;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	/**
	 * @return the deliverItmid
	 */
	public Long getDeliverItmid() {
		return deliverItmid;
	}

	/**
	 * @param deliverItmid the deliverItmid to set
	 */
	public void setDeliverItmid(Long deliverItmid) {
		this.deliverItmid = deliverItmid;
	}

	/**
	 * @return the invno
	 */
	public String getInvno() {
		return invno;
	}

	/**
	 * @param invno the invno to set
	 */
	public void setInvno(String invno) {
		this.invno = invno;
	}

	/**
	 * @return the batno
	 */
	public String getBatno() {
		return batno;
	}

	/**
	 * @param batno the batno to set
	 */
	public void setBatno(String batno) {
		this.batno = batno;
	}

	/**
	 * @return the expdate
	 */
	public Date getExpdate() {
		return expdate;
	}

	/**
	 * @param expdate the expdate to set
	 */
	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}

	/**
	 * @return the delvVos
	 */
	public List<DelvVo> getDelvVos() {
		return delvVos;
	}

	/**
	 * @param delvVos the delvVos to set
	 */
	public void setDelvVos(List<DelvVo> delvVos) {
		this.delvVos = delvVos;
	}

	/**
	 * @return the incId
	 */
	public Long getIncId() {
		return incId;
	}

	/**
	 * @param incId the incId to set
	 */
	public void setIncId(Long incId) {
		this.incId = incId;
	}

	/**
	 * @return the rp
	 */
	public Float getRp() {
		return rp;
	}

	/**
	 * @param rp the rp to set
	 */
	public void setRp(Float rp) {
		this.rp = rp;
	}

	/**
	 * @return the uom
	 */
	public String getUom() {
		return uom;
	}

	/**
	 * @param uom the uom to set
	 */
	public void setUom(String uom) {
		this.uom = uom;
	}

	/**
	 * @return the qty
	 */
	public Float getQty() {
		return qty;
	}

	/**
	 * @param qty the qty to set
	 */
	public void setQty(Float qty) {
		this.qty = qty;
	}

	/**
	 * @return the orderItmId
	 */
	public Long getOrderItmId() {
		return orderItmId;
	}

	/**
	 * @param orderItmId the orderItmId to set
	 */
	public void setOrderItmId(Long orderItmId) {
		this.orderItmId = orderItmId;
	}

	/**
	 * @return the ordVos
	 */
	public List<OrdVo> getOrdVos() {
		return ordVos;
	}

	/**
	 * @param ordVos the ordVos to set
	 */
	public void setOrdVos(List<OrdVo> ordVos) {
		this.ordVos = ordVos;
	}

	/**
	 * @return the ordSerial
	 */
	public String getOrdSerial() {
		return ordSerial;
	}

	/**
	 * @param ordSerial the ordSerial to set
	 */
	public void setOrdSerial(String ordSerial) {
		this.ordSerial = ordSerial;
	}

	/**
	 * @return the stDate
	 */
	public Date getStDate() {
		return stDate;
	}

	/**
	 * @param stDate the stDate to set
	 */
	public void setStDate(Date stDate) {
		this.stDate = stDate;
	}

	/**
	 * @return the edDate
	 */
	public Date getEdDate() {
		return edDate;
	}

	/**
	 * @param edDate the edDate to set
	 */
	public void setEdDate(Date edDate) {
		this.edDate = edDate;
	}

	/**
	 * @return the ord
	 */
	public Ord getOrd() {
		return ord;
	}

	/**
	 * @param ord the ord to set
	 */
	public void setOrd(Ord ord) {
		this.ord = ord;
	}

	
}
