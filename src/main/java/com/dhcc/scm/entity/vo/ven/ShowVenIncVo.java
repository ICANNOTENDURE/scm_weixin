/**
 * 
 */
package com.dhcc.scm.entity.vo.ven;

import java.math.BigDecimal;


/**
 * @author Administrator
 *
 */
public class ShowVenIncVo {

	// 供应商药品表ID
	private Long venincid;
	// 药品代码
	private String veninccode;
	// 药品描述
	private String venincname;
	// 单位代码
	private String venincuomcode;
	// 单位描述
	private String venincuomname;
	// 小单位代码
	private String venincbuomcode;
	// 小单位描述
	private String venincbuomname;
	// 药品价格
	private BigDecimal venincprice;
	// 相关系数
	private BigDecimal venincfac;
	// 对应厂商表ID
	private BigDecimal venincmanfid;
	// 厂商描述
	private String manfname;
	// 对应供应商表ID
	private BigDecimal venincvenid;
	// 供应商描述
	private String name;
	//供应商系统药品ID
	private BigDecimal venincvensysid;
	//图片ID
	private Long venincpicid;
	//图片路径
	private String venincpicpath;
	//图片顺序
	private Long venincpicseq;
	
	private Long venincsubcatid;
	
	private String cat;
	
	private String groupcat;
	
	private String venincgroup;
	
	private String spec;
	
	
	
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public String getGroupcat() {
		return groupcat;
	}
	public void setGroupcat(String groupcat) {
		this.groupcat = groupcat;
	}
	
	public String getVenincgroup() {
		return venincgroup;
	}
	public void setVenincgroup(String venincgroup) {
		this.venincgroup = venincgroup;
	}
	public Long getVenincsubcatid() {
		return venincsubcatid;
	}
	public void setVenincsubcatid(Long venincsubcatid) {
		this.venincsubcatid = venincsubcatid;
	}
	public Long getVenincid() {
		return venincid;
	}
	public void setVenincid(Long venincid) {
		this.venincid = venincid;
	}
	public String getVeninccode() {
		return veninccode;
	}
	public void setVeninccode(String veninccode) {
		this.veninccode = veninccode;
	}
	public String getVenincname() {
		return venincname;
	}
	public void setVenincname(String venincname) {
		this.venincname = venincname;
	}
	public String getVenincuomcode() {
		return venincuomcode;
	}
	public void setVenincuomcode(String venincuomcode) {
		this.venincuomcode = venincuomcode;
	}
	public String getVenincuomname() {
		return venincuomname;
	}
	public void setVenincuomname(String venincuomname) {
		this.venincuomname = venincuomname;
	}
	public String getVenincbuomcode() {
		return venincbuomcode;
	}
	public void setVenincbuomcode(String venincbuomcode) {
		this.venincbuomcode = venincbuomcode;
	}
	public String getVenincbuomname() {
		return venincbuomname;
	}
	public void setVenincbuomname(String venincbuomname) {
		this.venincbuomname = venincbuomname;
	}
	public BigDecimal getVenincprice() {
		return venincprice;
	}
	public void setVenincprice(BigDecimal venincprice) {
		this.venincprice = venincprice;
	}
	public BigDecimal getVenincfac() {
		return venincfac;
	}
	public void setVenincfac(BigDecimal venincfac) {
		this.venincfac = venincfac;
	}
	public BigDecimal getVenincmanfid() {
		return venincmanfid;
	}
	public void setVenincmanfid(BigDecimal venincmanfid) {
		this.venincmanfid = venincmanfid;
	}
	public String getManfname() {
		return manfname;
	}
	public void setManfname(String manfname) {
		this.manfname = manfname;
	}
	public BigDecimal getVenincvenid() {
		return venincvenid;
	}
	public void setVenincvenid(BigDecimal venincvenid) {
		this.venincvenid = venincvenid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the venincvensysid
	 */
	public BigDecimal getVenincvensysid() {
		return venincvensysid;
	}
	/**
	 * @param venincvensysid the venincvensysid to set
	 */
	public void setVenincvensysid(BigDecimal venincvensysid) {
		this.venincvensysid = venincvensysid;
	}
	public Long getVenincpicid() {
		return venincpicid;
	}
	public void setVenincpicid(Long venincpicid) {
		this.venincpicid = venincpicid;
	}
	public String getVenincpicpath() {
		return venincpicpath;
	}
	public void setVenincpicpath(String venincpicpath) {
		this.venincpicpath = venincpicpath;
	}
	public Long getVenincpicseq() {
		return venincpicseq;
	}
	public void setVenincpicseq(Long venincpicseq) {
		this.venincpicseq = venincpicseq;
	}
	
	

	
	
	
	
	
}
