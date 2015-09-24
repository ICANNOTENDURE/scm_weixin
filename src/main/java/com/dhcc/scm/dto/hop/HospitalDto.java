/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.hop;

import java.util.List;

import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.framework.transmission.dto.BaseDto;

public class HospitalDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	private Hospital hospital;

	private List<Hospital> hospitals;
	
	public List<Hospital> getHospitals() {
		return hospitals;
	}


	public void setHospitals(List<Hospital> hospitals) {
		this.hospitals = hospitals;
	}


	public Hospital getHospital() {
		return hospital;
	}

	
	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}
	
}
