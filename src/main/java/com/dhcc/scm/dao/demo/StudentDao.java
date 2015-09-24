/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.demo;

import java.util.Map;
import java.util.HashMap;

import org.hibernate.LockMode;
import org.springframework.stereotype.Repository;

import  com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.scm.dto.demo.StudentDto;
import com.dhcc.scm.entity.demo.Student;

@Repository
public class StudentDao extends HibernatePersistentObjectDAO<Student> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		StudentDto studentDto = (StudentDto) dto;
		Student student = studentDto.getStudent();

		pagerModel.setCountProName(super.getIdName(Student.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, student, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,Student student,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from Student where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		
	public void save(Student student){
	
		super.save(student);
	}
	
	public void delete(Student student){
		
		super.delete(student);
	}
	
	public void update(Student student){
	
		super.update(student);
	}
	
	public Student findById(Student student){

		return super.get(Student.class, student.getStudentId(), LockMode.READ);  //.findById(student.getStudentId());

	} 
}
