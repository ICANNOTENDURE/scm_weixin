package com.dhcc.framework.common.entity;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 日志配置
 * @author liuyg
 *
 */

@Entity
@Table(name="T_Log_Configure")
public class LogConfigure implements java.io.Serializable {

	private static final long serialVersionUID = 7331923895950310741L;
	//id 作为主键
	private String id;
	//名称，也就是操作的名称如，增加用户
	private String title;
	//接口名和方法名 格式如StudentService.delStudent
	private String method;
	//方法参数1和2以及3标识为第几个参数，用号号隔开，每个参数里用来拼节日志内容的属性及期名称，一个参数对多个属性用冒号隔开
	//1:orderId=订单编号:loginName=订单用户;2:classId=班级编号:classNumber=班级编号;3:otherInfo=退班原因
	//UserService.findUser
	//1:pageNo="页数":pageSize="每页记录数";2:user.userId="用户id"
	private String args;

	private Timestamp insertDate;
	
	private Timestamp updateDate;

	public LogConfigure() {
	}
	
	public LogConfigure(String id) {
		this.id = id;
	}

	public LogConfigure(String id, String title, String method, String args) {
		this.id = id;
		this.title = title;
		this.method = method;
		this.args = args;
	}
	@Column(name = "log_insertDate")
	public Timestamp getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Timestamp insertDate) {
		this.insertDate = insertDate;
	}
	@Column(name = "log_updateDate")
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	
	@GenericGenerator(name="idGenerator",strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Id
	@Column(name = "log_id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "log_title", length = 300)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "log_method", length = 300)
	public String getMethod() {
		return this.method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	@Column(name = "log_args", length = 300)
	public String getArgs() {
		return this.args;
	}

	public void setArgs(String args) {
		this.args = args;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof LogConfigure))
			return false;
		LogConfigure castOther = (LogConfigure) other;

		return ((this.getId() == castOther.getId()) || (this.getId() != null
				&& castOther.getId() != null && this.getId().equals(
				castOther.getId())))
				&& ((this.getTitle() == castOther.getTitle()) || (this
						.getTitle() != null
						&& castOther.getTitle() != null && this.getTitle()
						.equals(castOther.getTitle())))
				&& ((this.getMethod() == castOther.getMethod()) || (this
						.getMethod() != null
						&& castOther.getMethod() != null && this.getMethod()
						.equals(castOther.getMethod())))
				&& ((this.getArgs() == castOther.getArgs()) || (this.getArgs() != null
						&& castOther.getArgs() != null && this.getArgs()
						.equals(castOther.getArgs())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37 * result
				+ (getTitle() == null ? 0 : this.getTitle().hashCode());
		result = 37 * result
				+ (getMethod() == null ? 0 : this.getMethod().hashCode());
		result = 37 * result
				+ (getArgs() == null ? 0 : this.getArgs().hashCode());
		return result;
	}

}