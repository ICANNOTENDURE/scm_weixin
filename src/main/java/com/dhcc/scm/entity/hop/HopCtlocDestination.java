package com.dhcc.scm.entity.hop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * The persistent class for the T_SYS_CTLOC_DESTINATION database table.
 * 
 */
@Entity
@Table(name="T_SYS_CTLOC_DESTINATION")
public class HopCtlocDestination implements Serializable {
	private static final long serialVersionUID = 1L;

	
	@Id
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="SEQUENCE_SYS_CTLOC_DESTINATION")})
	@GeneratedValue(generator="idGenerator")
	@Column(name="CTLOCDES_ID")	
	private Long hopCtlocDestinationId;

	@Column(name="CTLOCDES_CONTACT2")
	private String contact;

	@Column(name="CTLOCDES_DESTINATION")
	private String destination;

	@Column(name="CTLOCDES_TEL")
	private String tel;
	
	@Column(name="CTLOCDES_CTLOCDR")
	private Long ctlocDr;

	@Column(name="CTLOCDES_MAIL")
	private String mail;
	
	@Column(name="CTLOCDES_CODE")
	private String code;
	/*是否为默认地址*/
	@Transient
	private String isDefault;

	/**
	 * @return the isDefault
	 */
	public String getIsDefault() {
		return isDefault;
	}


	/**
	 * @param isDefault the isDefault to set
	 */
	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}






	public HopCtlocDestination() {
	}

	
	
	
	
	
	/**
	 * @param hopCtlocDestinationId
	 * @param destination
	 */
	public HopCtlocDestination(Long hopCtlocDestinationId, String destination) {
		super();
		this.hopCtlocDestinationId = hopCtlocDestinationId;
		this.destination = destination;
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






	public Long getHopCtlocDestinationId() {
		return hopCtlocDestinationId;
	}


	public void setHopCtlocDestinationId(Long hopCtlocDestinationId) {
		this.hopCtlocDestinationId = hopCtlocDestinationId;
	}


	public String getContact() {
		return contact;
	}


	public void setContact(String contact) {
		this.contact = contact;
	}


	public String getDestination() {
		return destination;
	}


	public void setDestination(String destination) {
		this.destination = destination;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}

	public Long getCtlocDr() {
		return ctlocDr;
	}


	public void setCtlocDr(Long ctlocDr) {
		this.ctlocDr = ctlocDr;
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
	
	

}