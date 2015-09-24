/**
 * 
 */
package com.dhcc.scm.entity.vo.hop;

/**
 * @author pengzhikun
 * function:定制收货信息显示实体类
 *
 */
public class HopDestinationVo {
	//科室收货信息表ID
	private Long hopctlocdestinationid;
	//收货地点
	private String destination;
	//收货联系人
	private String descontact;
	//收货联系人电话
	private String destel;
	//收货信息对应的科室ID
	private String  desctlocdr;
	//收货信息对应的科室描述
	private String desctlocname;
	
	private String mail;
	
	private Long defaultdestion;
	
	private String desccode;
	
	/**
	 * @return the defaultDestion
	 */
	public Long getDefaultdestion() {
		return defaultdestion;
	}

	/**
	 * @param defaultDestion the defaultDestion to set
	 */
	public void setDefaultDestion(Long defaultdestion) {
		this.defaultdestion = defaultdestion;
	}

	/**
	 * @return the hopctlocdestinationid
	 */
	public Long getHopctlocdestinationid() {
		return hopctlocdestinationid;
	}

	/**
	 * @param hopctlocdestinationid the hopctlocdestinationid to set
	 */
	public void setHopctlocdestinationid(Long hopctlocdestinationid) {
		this.hopctlocdestinationid = hopctlocdestinationid;
	}

	/**
	 * @return the destination
	 */
	public String getDestination() {
		return destination;
	}

	/**
	 * @param destination the destination to set
	 */
	public void setDestination(String destination) {
		this.destination = destination;
	}

	/**
	 * @return the descontact
	 */
	public String getDescontact() {
		return descontact;
	}

	/**
	 * @param descontact the descontact to set
	 */
	public void setDescontact(String descontact) {
		this.descontact = descontact;
	}

	/**
	 * @return the destel
	 */
	public String getDestel() {
		return destel;
	}

	/**
	 * @param destel the destel to set
	 */
	public void setDestel(String destel) {
		this.destel = destel;
	}

	/**
	 * @return the desctlocdr
	 */
	public String getDesctlocdr() {
		return desctlocdr;
	}

	/**
	 * @param desctlocdr the desctlocdr to set
	 */
	public void setDesctlocdr(String desctlocdr) {
		this.desctlocdr = desctlocdr;
	}

	/**
	 * @return the desctlocname
	 */
	public String getDesctlocname() {
		return desctlocname;
	}

	/**
	 * @param desctlocname the desctlocname to set
	 */
	public void setDesctlocname(String desctlocname) {
		this.desctlocname = desctlocname;
	}

	/**
	 * @return the mail
	 */
	public String getMail() {
		return mail;
	}

	/**
	 * @param mail the mail to set
	 */
	public void setMail(String mail) {
		this.mail = mail;
	}

	/**
	 * @return the desccode
	 */
	public String getDesccode() {
		return desccode;
	}

	/**
	 * @param desccode the desccode to set
	 */
	public void setDesccode(String desccode) {
		this.desccode = desccode;
	}
	
	
	
	
	
}
