package com.dhcc.scm.entity.demo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;

import com.dhcc.framework.annotation.JSCombo;
import com.dhcc.framework.annotation.JSCombo.Type;



@Entity
@Table(name="T_STUDENT")
public class Student implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="STUDENT_ID", unique=true, nullable=false, length=32)
	private String studentId;
	
	@Version
	@Column(name="VERSION")
	private Integer  version;
	
	@Column(name="STUDENT_NAME", length=100)
	private String studentName;
	
	@JSCombo(url="",textField="",valueField="id",mode=Type.remote)
	@Column(name="STUDENT_EMIAL", length=20)
	private String studentEmail;
	
	@Temporal(TemporalType.DATE)
	@Column(name="STUDENT_AGE", length=20)
	private Date studentAge;
	
	
	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}



	public Date getStudentAge() {
		return studentAge;
	}

	public void setStudentAge(Date studentAge) {
		this.studentAge = studentAge;
	}

	public String getStudentEmail() {
		return studentEmail;
	}

	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}
	
	
	
}