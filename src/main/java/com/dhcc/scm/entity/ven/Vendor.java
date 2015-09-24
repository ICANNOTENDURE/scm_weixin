package com.dhcc.scm.entity.ven;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


@Entity
@Table(name="T_VEN_VENDOR")
public class Vendor implements java.io.Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="SEQ_VENDOR")})
	@GeneratedValue(generator="idGenerator")
	@Column(name="VEN_ID")
	private Long vendorId;
	
	@Column(name="CODE")
	private String code;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="ADDRESS")
	private String address;
	
	@Column(name="FAX")
	private String fax;
	
	@Column(name="TEL")
	private String tel;
	
	@Column(name="ACCOUNT")
	private String account;
	
	@Column(name="CONTACT")
	private String contact;
	
	@Column(name="PARENTID")
	private Long parentId;
	
	@Column(name="HISID")
	private Long hisId;
	
	@Column(name="ALIAS")
	private String alias;
	
	@Column(name="EMAIL")
	private String email;
	
	@Column(name="TAXATION")
	private String taxation;
	
	/**
	 * @return the taxation
	 */
	public String getTaxation() {
		return taxation;
	}
	/**
	 * @param taxation the taxation to set
	 */
	public void setTaxation(String taxation) {
		this.taxation = taxation;
	}
	@Transient
	private List<VenQualification> venQualificationList;
	
	
    
	
	

	/**
	 * @return the email
	 */
	public String getEmail() {
		if(this.email==null){
			email="";
		}
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the alias
	 */
	public String getAlias() {
		return alias;
	}
	/**
	 * @param alias the alias to set
	 */
	public void setAlias(String alias) {
		this.alias = alias;
	}
	/**
	 * @return the hisId
	 */
	public Long getHisId() {
		return hisId;
	}
	/**
	 * @param hisId the hisId to set
	 */
	public void setHisId(Long hisId) {
		this.hisId = hisId;
	}
	/**
	 * @return the venQualificationList
	 */
	public List<VenQualification> getVenQualificationList() {
		return venQualificationList;
	}
	/**
	 * @param venQualificationList the venQualificationList to set
	 */
	public void setVenQualificationList(List<VenQualification> venQualificationList) {
		this.venQualificationList = venQualificationList;
	}
	public Long getVendorId() {
		return vendorId;
	}
	public void setVendorId(Long vendorId) {
		this.vendorId = vendorId;
	}
	public String getCode() {
		if(this.code==null){
			code="";
		}
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		if(this.name==null){
			name="";
		}
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		if(this.address==null){
			address="";
		}
		return address;
	}
	public void setAddress(String address) {
		
		this.address = address;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getContact() {
		if(this.contact==null){
			contact="";
		}
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	/**
	 * @param vendorId
	 * @param name
	 */
	public Vendor(Long vendorId, String name) {
		super();
		this.vendorId = vendorId;
		this.name = name;
	}
	/**
	 * 
	 */
	public Vendor() {
		super();
	}
	
	
}
