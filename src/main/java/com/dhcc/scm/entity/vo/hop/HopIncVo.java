/**
 * 
 */
package com.dhcc.scm.entity.vo.hop;

import java.math.BigDecimal;

/**
 * @author pengzhikun
 * function:自制医院药品显示列表实体
 */
public class HopIncVo {
	//表ID
	private Long incId;	
	//药品代码
	private String incCode;
	//药品描述
	private String incName;
	//单位代码
	private String incUomcode;
	//单位描述
	private String incUomname;
	//小单位代码
	private String incBuomcode;
	//小单位描述
	private String incBuomname;
	//系数
	private BigDecimal incFac;
	//进价
	private BigDecimal incRp;
	//医院ID
	private BigDecimal incHospid;
	//医院
	private String hospitalName;
	//厂商ID
	private BigDecimal incManfid;
	//厂商
	private String manfName;
	//his药品id
	private Long incHissysid;
	
	private String incBarCode;
	
	
	
	public HopIncVo(){
		
	}
	
	public HopIncVo(Long incId, String incCode, String incName,
			String incUomname, String incBuomname, String hospitalName,
			String manfName, Long incHissysid) {
		super();
		this.incId = incId;
		this.incCode = incCode;
		this.incName = incName;
		this.incUomname = incUomname;
		this.incBuomname = incBuomname;
		this.hospitalName = hospitalName;
		this.manfName = manfName;
		this.incHissysid = incHissysid;
	}


	public HopIncVo(Long incId, String incCode, String incName,
			String incUomcode, String incUomname, String incBuomcode,
			String incBuomname, BigDecimal incFac, BigDecimal incRp,
			BigDecimal incHospid, String hospitalName, BigDecimal incManfid,
			String manfName, Long incHissysid) {
		super();
		this.incId = incId;
		this.incCode = incCode;
		this.incName = incName;
		this.incUomcode = incUomcode;
		this.incUomname = incUomname;
		this.incBuomcode = incBuomcode;
		this.incBuomname = incBuomname;
		this.incFac = incFac;
		this.incRp = incRp;
		this.incHospid = incHospid;
		this.hospitalName = hospitalName;
		this.incManfid = incManfid;
		this.manfName = manfName;
		this.incHissysid = incHissysid;
	}

	public Long getIncId() {
		return incId;
	}

	public void setIncId(Long incId) {
		this.incId = incId;
	}

	public String getIncCode() {
		return incCode;
	}

	public void setIncCode(String incCode) {
		this.incCode = incCode;
	}

	public String getIncName() {
		return incName;
	}

	public void setIncName(String incName) {
		this.incName = incName;
	}

	public String getIncUomcode() {
		return incUomcode;
	}

	public void setIncUomcode(String incUomcode) {
		this.incUomcode = incUomcode;
	}

	public String getIncUomname() {
		return incUomname;
	}

	public void setIncUomname(String incUomname) {
		this.incUomname = incUomname;
	}

	public String getIncBuomcode() {
		return incBuomcode;
	}

	public void setIncBuomcode(String incBuomcode) {
		this.incBuomcode = incBuomcode;
	}

	public String getIncBuomname() {
		return incBuomname;
	}

	public void setIncBuomname(String incBuomname) {
		this.incBuomname = incBuomname;
	}

	public BigDecimal getIncFac() {
		return incFac;
	}

	public void setIncFac(BigDecimal incFac) {
		this.incFac = incFac;
	}

	public BigDecimal getIncRp() {
		return incRp;
	}

	public void setIncRp(BigDecimal incRp) {
		this.incRp = incRp;
	}

	public BigDecimal getIncHospid() {
		return incHospid;
	}

	public void setIncHospid(BigDecimal incHospid) {
		this.incHospid = incHospid;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public BigDecimal getIncManfid() {
		return incManfid;
	}

	public void setIncManfid(BigDecimal incManfid) {
		this.incManfid = incManfid;
	}

	public String getManfName() {
		return manfName;
	}

	public void setManfName(String manfName) {
		this.manfName = manfName;
	}

	public Long getIncHissysid() {
		return incHissysid;
	}

	public void setIncHissysid(Long incHissysid) {
		this.incHissysid = incHissysid;
	}

	public String getIncBarCode() {
		return incBarCode;
	}

	public void setIncBarCode(String incBarCode) {
		this.incBarCode = incBarCode;
	}
	
	
}
