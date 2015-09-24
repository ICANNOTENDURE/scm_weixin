package com.dhcc.scm.entity.vo.combo;


/**
 * 
 * @author Administrator
 *
 */
public class LocDestinationVo {
	//科室ID
	private Long Id;
	//科室代码
	private String name;
	
	
	/**
	 * @param id
	 * @param name
	 */
	public LocDestinationVo(Long id, String name) {
		super();
		Id = id;
		this.name = name;
	}
	/**
	 * @return the id
	 */
	public Long getId() {
		return Id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		Id = id;
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

	
	
}
