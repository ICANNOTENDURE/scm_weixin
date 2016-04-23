/**
 * 
 */
package com.dhcc.scm.entity.demo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.dhcc.framework.annotation.ColumnName;

/**
 * @author duyadong
 * 
 */
@Entity
@Table(name = "T_STUDENT")
public class Student implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")	
	@Column(name="id", unique=true, nullable=false, precision=22)
	private Long studentId;
	
	@ColumnName(value="学生姓名")
	@Column(name = "name")
	private String studentName;
    
	@ColumnName(value="学生生日")
	@Column(name = "birth")
	private String studentBirth;

	public Long getStudentId() {
		return studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentBirth() {
		return studentBirth;
	}

	public void setStudentBirth(String studentBirth) {
		this.studentBirth = studentBirth;
	}

	
	

}
