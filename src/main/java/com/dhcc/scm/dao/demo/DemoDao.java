package com.dhcc.scm.dao.demo;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.demo.Student;


@Repository
public class DemoDao extends HibernatePersistentObjectDAO<Student> {

	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		
		
	}

	
	private void buildQuery(Map hqlParamMap, Student demo,
			StringBuilder hqlStr) {

		hqlStr.append(" from Demo d ");

	}
	

	public void save(Student demo){
			
		super.saveOrUpdate(demo);
	}
	
	public void delete(Student demo){
		
		super.delete(demo);
	}
	
	public void update(Student demo){
	
		super.update(demo);
	}


	
}
