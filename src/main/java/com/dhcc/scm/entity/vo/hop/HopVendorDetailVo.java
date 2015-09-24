/**
 * 
 */
package com.dhcc.scm.entity.vo.hop;

import java.util.Date;


public class HopVendorDetailVo implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//表id
	private Long hopvenid;
	
	private Long vendorid;
	
	private String code;

	private String name;
	
	private String hopvencode;
	
	private String address;
	
	private String type;
	
	private Date expdate;
	
	private String path;

	/**
	 * @return the hopvenid
	 */
	public Long getHopvenid() {
		return hopvenid;
	}

	/**
	 * @param hopvenid the hopvenid to set
	 */
	public void setHopvenid(Long hopvenid) {
		this.hopvenid = hopvenid;
	}

	/**
	 * @return the vendorid
	 */
	public Long getVendorid() {
		return vendorid;
	}

	/**
	 * @param vendorid the vendorid to set
	 */
	public void setVendorid(Long vendorid) {
		this.vendorid = vendorid;
	}

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the hopvencode
	 */
	public String getHopvencode() {
		return hopvencode;
	}

	/**
	 * @param hopvencode the hopvencode to set
	 */
	public void setHopvencode(String hopvencode) {
		this.hopvencode = hopvencode;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
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
	 * @return the path
	 */
	public String getPath() {
		return path;
	}

	/**
	 * @param path the path to set
	 */
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
