/**
 * 
 */
package com.dhcc.scm.entity.vo.cat;

/**
 * @author duyadong
 * 
 */
public class SubCatGroupVO {
	// 小类ID
	private Integer subcatgroupid;
	// 小类代码
	private String subcatgroupcode;
	// 小类描述
	private String subcatgroupname;
	// 指向大类的ID
	private Integer subparrefgroupid;
	// 指向大类的描述
	private String subparrefgroupname;

	public SubCatGroupVO() {
	}

	public SubCatGroupVO(Integer subcatgroupid, String subcatgroupcode,
			String subcatgroupname, Integer subparrefgroupid,
			String subparrefgroupname) {
		super();
		this.subcatgroupid = subcatgroupid;
		this.subcatgroupcode = subcatgroupcode;
		this.subcatgroupname = subcatgroupname;
		this.subparrefgroupid = subparrefgroupid;
		this.subparrefgroupname = subparrefgroupname;
	}

	/**
	 * @return the subcatgroupid
	 */
	public Integer getSubcatgroupid() {
		return subcatgroupid;
	}

	/**
	 * @param subcatgroupid the subcatgroupid to set
	 */
	public void setSubcatgroupid(Integer subcatgroupid) {
		this.subcatgroupid = subcatgroupid;
	}

	/**
	 * @return the subcatgroupcode
	 */
	public String getSubcatgroupcode() {
		return subcatgroupcode;
	}

	/**
	 * @param subcatgroupcode the subcatgroupcode to set
	 */
	public void setSubcatgroupcode(String subcatgroupcode) {
		this.subcatgroupcode = subcatgroupcode;
	}

	/**
	 * @return the subcatgroupname
	 */
	public String getSubcatgroupname() {
		return subcatgroupname;
	}

	/**
	 * @param subcatgroupname the subcatgroupname to set
	 */
	public void setSubcatgroupname(String subcatgroupname) {
		this.subcatgroupname = subcatgroupname;
	}

	/**
	 * @return the subparrefgroupid
	 */
	public Integer getSubparrefgroupid() {
		return subparrefgroupid;
	}

	/**
	 * @param subparrefgroupid the subparrefgroupid to set
	 */
	public void setSubparrefgroupid(Integer subparrefgroupid) {
		this.subparrefgroupid = subparrefgroupid;
	}

	/**
	 * @return the subparrefgroupname
	 */
	public String getSubparrefgroupname() {
		return subparrefgroupname;
	}

	/**
	 * @param subparrefgroupname the subparrefgroupname to set
	 */
	public void setSubparrefgroupname(String subparrefgroupname) {
		this.subparrefgroupname = subparrefgroupname;
	}

	
}
