package com.dhcc.framework.common.entity.vo.dict;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class BatchLoad  implements java.io.Serializable{


	private static final long serialVersionUID = 1255618735895685331L;
	private String ids;
	private String dicts;
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getDicts() {
		return dicts;
	}
	public void setDicts(String dicts) {
		this.dicts = dicts;
	}
}
