/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.demo;

import com.dhcc.scm.entity.demo.Student;
import com.dhcc.framework.transmission.dto.BaseDto;

public class StudentDto extends BaseDto {

	private Student student;

	
	public Student getStudent() {
		return student;
	}

	
	public void setStudent(Student student) {
		this.student = student;
	}
	
}
