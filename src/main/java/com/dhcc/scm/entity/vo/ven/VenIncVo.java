/**
 * 
 */
package com.dhcc.scm.entity.vo.ven;

import java.math.BigDecimal;

/**
 * @author pzk
 * function 供应商列表显示实体
 */
public class VenIncVo {
	//供应商药品表ID
	private Long venIncId;
	//药品代码
	private String venIncCode;
	//药品描述
	private String venIncName;
	//单位代码
	private String venIncUomcode;
	//单位描述
	private String venIncUomname;
	//小单位代码
	private String venIncBuomcode;
	//小单位描述
	private String venIncBuomname;
	//药品价格
	private BigDecimal venIncPrice;
	//相关系数
	private BigDecimal venIncFac;
	//对应厂商表ID
	private BigDecimal venIncManfid;
	//厂商描述
	private String manfName;
	//对应供应商表ID
	private BigDecimal venIncVenid;
	//供应商描述
	private String name;
	//供应商系统药品ID
	private BigDecimal venIncVensysid;
	
	public VenIncVo(){
		
	}

	public VenIncVo(Long venIncId, String venIncCode, String venIncName,
			String venIncUomcode, String venIncUomname, String venIncBuomcode,
			String venIncBuomname, BigDecimal venIncPrice,
			BigDecimal venIncFac, BigDecimal venIncManfid, String manfName,
			BigDecimal venIncVenid, String name, BigDecimal venIncVensysid) {
		super();
		this.venIncId = venIncId;
		this.venIncCode = venIncCode;
		this.venIncName = venIncName;
		this.venIncUomcode = venIncUomcode;
		this.venIncUomname = venIncUomname;
		this.venIncBuomcode = venIncBuomcode;
		this.venIncBuomname = venIncBuomname;
		this.venIncPrice = venIncPrice;
		this.venIncFac = venIncFac;
		this.venIncManfid = venIncManfid;
		this.manfName = manfName;
		this.venIncVenid = venIncVenid;
		this.name = name;
		this.venIncVensysid = venIncVensysid;
	}

	public Long getVenIncId() {
		return venIncId;
	}

	public void setVenIncId(Long venIncId) {
		this.venIncId = venIncId;
	}

	public String getVenIncCode() {
		return venIncCode;
	}

	public void setVenIncCode(String venIncCode) {
		this.venIncCode = venIncCode;
	}

	public String getVenIncName() {
		return venIncName;
	}

	public void setVenIncName(String venIncName) {
		this.venIncName = venIncName;
	}

	public String getVenIncUomcode() {
		return venIncUomcode;
	}

	public void setVenIncUomcode(String venIncUomcode) {
		this.venIncUomcode = venIncUomcode;
	}

	public String getVenIncUomname() {
		return venIncUomname;
	}

	public void setVenIncUomname(String venIncUomname) {
		this.venIncUomname = venIncUomname;
	}

	public String getVenIncBuomcode() {
		return venIncBuomcode;
	}

	public void setVenIncBuomcode(String venIncBuomcode) {
		this.venIncBuomcode = venIncBuomcode;
	}

	public String getVenIncBuomname() {
		return venIncBuomname;
	}

	public void setVenIncBuomname(String venIncBuomname) {
		this.venIncBuomname = venIncBuomname;
	}

	public BigDecimal getVenIncPrice() {
		return venIncPrice;
	}

	public void setVenIncPrice(BigDecimal venIncPrice) {
		this.venIncPrice = venIncPrice;
	}

	public BigDecimal getVenIncFac() {
		return venIncFac;
	}

	public void setVenIncFac(BigDecimal venIncFac) {
		this.venIncFac = venIncFac;
	}

	public BigDecimal getVenIncManfid() {
		return venIncManfid;
	}

	public void setVenIncManfid(BigDecimal venIncManfid) {
		this.venIncManfid = venIncManfid;
	}

	public String getManfName() {
		return manfName;
	}

	public void setManfName(String manfName) {
		this.manfName = manfName;
	}

	public BigDecimal getVenIncVenid() {
		return venIncVenid;
	}

	public void setVenIncVenid(BigDecimal venIncVenid) {
		this.venIncVenid = venIncVenid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getVenIncVensysid() {
		return venIncVensysid;
	}

	public void setVenIncVensysid(BigDecimal venIncVensysid) {
		this.venIncVensysid = venIncVensysid;
	}
	
	
}
