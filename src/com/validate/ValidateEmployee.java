package com.validate;

import com.model.Employee;

public class ValidateEmployee {

	public static boolean validate(Employee employee) {
		boolean validate = false;
		try {
if(employee.getEid()!=null && employee.getName()!=null && employee.getCountry()!=null && employee.getState()!=null 
&& employee.getCity()!=null && employee.getGender()!=null && employee.getImage()!=null && employee.getTechnologies()!=null) {
	
	validate=true;
	
}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return validate;
	}
}
