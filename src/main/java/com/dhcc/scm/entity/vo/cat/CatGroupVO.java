/**
 * 
 */
package com.dhcc.scm.entity.vo.cat;

/**
 * @author duyadong
 * 
 */
public class CatGroupVO {
	// 小类ID
	private Integer catgroupid;
	// 小类代码
	private String catgroupcode;
	// 小类描述
	private String catgroupname;
	// 指向大类的ID
	private Integer groupid;
	// 指向大类的描述
	private String groupname;
	
	public Integer getCatgroupid() {
		return catgroupid;
	}
	public void setCatgroupid(Integer catgroupid) {
		this.catgroupid = catgroupid;
	}
	public String getCatgroupcode() {
		return catgroupcode;
	}
	public void setCatgroupcode(String catgroupcode) {
		this.catgroupcode = catgroupcode;
	}
	public String getCatgroupname() {
		return catgroupname;
	}
	public void setCatgroupname(String catgroupname) {
		this.catgroupname = catgroupname;
	}
	public Integer getGroupid() {
		return groupid;
	}
	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	
	
	
}
