package com.dhcc.scm.entity.vo.hop;


/**
 * @author pengzhikun
 * function:定制科室信息显示实体类
 *
 */
public class HopCtlocVo {
	//科室ID
	private Long hopCtlocId;
	//科室代码
	private String code;
	//科室描述
	private String name;
	//指向医院id
	private Long hospid;
	//科室表中对应的医院ID所对应的医院描述
	private String hospitalName;
	//His科室id
	private Long hisid;
	
	private String type;
	
	public HopCtlocVo(){}

	
	public HopCtlocVo(Long hopCtlocId, String code, String name,
			Long hospid, String hospitalName, Long hisid,String type) {
		super();
		this.hopCtlocId = hopCtlocId;
		this.code = code;
		this.name = name;
		this.hospid = hospid;
		this.hospitalName = hospitalName;
		this.hisid = hisid;
		this.type=type;
	}


	public Long getHopCtlocId() {
		return hopCtlocId;
	}


	public void setHopCtlocId(Long hopCtlocId) {
		this.hopCtlocId = hopCtlocId;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Long getHospid() {
		return hospid;
	}


	public void setHospid(Long hospid) {
		this.hospid = hospid;
	}


	public String getHospitalName() {
		return hospitalName;
	}


	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}


	public Long getHisid() {
		return hisid;
	}


	public void setHisid(Long hisid) {
		this.hisid = hisid;
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

		
}
