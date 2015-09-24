/**
 * 
 */
package com.dhcc.scm.entity.vo.cat;



public class CatPropertyVO {
	
	
	private Long  grpproid;
	
	private String grpprodesc;
	
	private String grpprodesc2;
	
	private Long grpparrefid;
	
	private String grpproname;
	
	private Long subcatgroupid;
	
	private String subcatgroupname;
	
	private String groupname;
	
	private String catgroupname;
	
	private String grpprocode;
	
	
	

	public String getGrpprocode() {
		return grpprocode;
	}

	public void setGrpprocode(String grpprocode) {
		this.grpprocode = grpprocode;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getCatgroupname() {
		return catgroupname;
	}

	public void setCatgroupname(String catgroupname) {
		this.catgroupname = catgroupname;
	}

	public Long getGrpproid() {
		return grpproid;
	}

	public void setGrpproid(Long grpproid) {
		this.grpproid = grpproid;
	}

	public Long getGrpparrefid() {
		return grpparrefid;
	}

	public void setGrpparrefid(Long grpparrefid) {
		this.grpparrefid = grpparrefid;
	}

	

	public String getSubcatgroupname() {
		return subcatgroupname;
	}

	public void setSubcatgroupname(String subcatgroupname) {
		this.subcatgroupname = subcatgroupname;
	}
    
	

	

	public Long getSubcatgroupid() {
		return subcatgroupid;
	}

	public void setSubcatgroupid(Long subcatgroupid) {
		this.subcatgroupid = subcatgroupid;
	}

	public String getGrpproname() {
		return grpproname;
	}

	public void setGrpproname(String grpproname) {
		this.grpproname = grpproname;
	}

	public String getGrpprodesc() {
		
		return grpprodesc;
	}

	public void setGrpprodesc(String grpprodesc) {
		this.grpprodesc = grpprodesc;
	}

	public String getGrpprodesc2() {
		this.grpprodesc2=this.grpprodesc;
		return grpprodesc2;
	}

	public void setGrpprodesc2(String grpprodesc2) {
		this.grpprodesc2 = grpprodesc2;
	}

	
	
	
}
