package com.preparemodel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.model.Employee;

public class PrepareModel {
	
	public static Employee prepareEmployee(HttpServletRequest request ) {
		Employee employee=null;
		try {
			String eid = request.getParameter("eid");
			String name = request.getParameter("ename");
			String gender = request.getParameter("gender");
			String country = request.getParameter("country");
			String state = request.getParameter("state");
			String city = request.getParameter("city");
			String[] technologies = request.getParameterValues("technologies");
			Part filePart = request.getPart("file");
			 employee=new Employee(eid, name, gender, country, state, city, technologies,filePart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return employee;
		
	}

}
