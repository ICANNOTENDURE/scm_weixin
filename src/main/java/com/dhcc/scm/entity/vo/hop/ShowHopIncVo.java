/**
 * 
 */
package com.dhcc.scm.entity.vo.hop;

import java.math.BigDecimal;

/**
 * @author pengzhikun
 * function:自制医院药品显示列表实体
 */
public class ShowHopIncVo {
	//表ID
	private Long incid;	
	//药品代码
	private String inccode;
	//药品描述
	private String incname;
	//单位代码
	private String incuomcode;
	//单位描述
	private String incuomname;
	//小单位代码
	private String incbuomcode;
	//小单位描述
	private String incbuomname;
	//系数
	private BigDecimal incfac;
	//进价
	private BigDecimal incrp;
	//医院ID
	private Long inchospid;
	//医院
	private String hospitalname;
	//厂商ID
	private BigDecimal incmanfid;
	//厂商
	private String manfname;
	//his药品id
	private Long inchissysid;
	//图片id
	private Long hopincpicid;
	//图片位置
	private String incpicpath;
	//图片顺序
	private Long incpicseq;
	public Long getIncid() {
		return incid;
	}
	public void setIncid(Long incid) {
		this.incid = incid;
	}
	public String getInccode() {
		return inccode;
	}
	public void setInccode(String inccode) {
		this.inccode = inccode;
	}
	public String getIncname() {
		return incname;
	}
	public void setIncname(String incname) {
		this.incname = incname;
	}
	public String getIncuomcode() {
		return incuomcode;
	}
	public void setIncuomcode(String incuomcode) {
		this.incuomcode = incuomcode;
	}
	public String getIncuomname() {
		return incuomname;
	}
	public void setIncuomname(String incuomname) {
		this.incuomname = incuomname;
	}
	public String getIncbuomcode() {
		return incbuomcode;
	}
	public void setIncbuomcode(String incbuomcode) {
		this.incbuomcode = incbuomcode;
	}
	public String getIncbuomname() {
		return incbuomname;
	}
	public void setIncbuomname(String incbuomname) {
		this.incbuomname = incbuomname;
	}
	public BigDecimal getIncfac() {
		return incfac;
	}
	public void setIncfac(BigDecimal incfac) {
		this.incfac = incfac;
	}
	public BigDecimal getIncrp() {
		return incrp;
	}
	public void setIncrp(BigDecimal incrp) {
		this.incrp = incrp;
	}
	public Long getInchospid() {
		return inchospid;
	}
	public void setInchospid(Long inchospid) {
		this.inchospid = inchospid;
	}
	public String getHospitalname() {
		return hospitalname;
	}
	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}
	public BigDecimal getIncmanfid() {
		return incmanfid;
	}
	public void setIncmanfid(BigDecimal incmanfid) {
		this.incmanfid = incmanfid;
	}
	public String getManfname() {
		return manfname;
	}
	public void setManfname(String manfname) {
		this.manfname = manfname;
	}
	public Long getInchissysid() {
		return inchissysid;
	}
	public void setInchissysid(Long inchissysid) {
		this.inchissysid = inchissysid;
	}
	public Long getHopincpicid() {
		return hopincpicid;
	}
	public void setHopincpicid(Long hopincpicid) {
		this.hopincpicid = hopincpicid;
	}
	public String getIncpicpath() {
		return incpicpath;
	}
	public void setIncpicpath(String incpicpath) {
		this.incpicpath = incpicpath;
	}
	public Long getIncpicseq() {
		return incpicseq;
	}
	public void setIncpicseq(Long incpicseq) {
		this.incpicseq = incpicseq;
	}
	
}
