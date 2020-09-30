package com.service;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Part;

import com.dbcon.DBUtil;
import com.model.Employee;
import com.model.Technologies;

public class EmployeeService {

	public static Employee getById(String eid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Employee employee=null;
		try {
			con = DBUtil.getDataSource().getConnection();
			ps=con.prepareStatement("select * from employee where eid=?");
			ps.setString(1, eid);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				employee=new Employee();
				employee.setEid(rs.getString("eid"));
				employee.setName(rs.getString("name"));
				employee.setGender(rs.getString("gender"));
				employee.setCountry(rs.getString("country"));
				employee.setState(rs.getString("state"));
				employee.setCity(rs.getString("city"));
				//employee.setImage((Part) rs.getBlob("image"));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}


		return employee;
	}

	public static int saveEmployee(Employee employee) {
		InputStream inputStream = null;

		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			if (employee.getImage() != null) {
				// prints out some information for debugging
				System.out.println(employee.getImage().getName());
				System.out.println(employee.getImage().getSize());
				System.out.println(employee.getImage().getContentType());

				// obtains input stream of the upload file
				inputStream = employee.getImage().getInputStream();
			}
			con = DBUtil.getDataSource().getConnection();
			ps = con.prepareStatement(
					"insert into employee (eid,name,gender,country,state,city,image) values(?,?,?,?,?,?,?)");
			ps.setString(1, employee.getEid());
			ps.setString(2, employee.getName());
			ps.setString(3, employee.getGender());
			ps.setString(4, employee.getCountry());
			ps.setString(5, employee.getState());
			ps.setString(6, employee.getCity());

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				ps.setBlob(7, inputStream);
			}

			result = ps.executeUpdate();
			for (String string : employee.getTechnologies()) {
				ps = con.prepareStatement("insert into technologies (technologies,eid) values(?,?)");
				ps.setString(1, string);
				ps.setString(2, employee.getEid());

				result = ps.executeUpdate();

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	public static List<Employee> showAllEmployees() {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Employee> employees = new ArrayList<Employee>();
		Employee employee = null;
		try {
			con = DBUtil.getDataSource().getConnection();
			ps = con.prepareStatement("select * from employee");
			rs = ps.executeQuery();

			while (rs.next()) {
				employee = new Employee();

				employee.setEid(rs.getString("eid"));
				employee.setName(rs.getString("name"));
				employee.setCountry(rs.getString("country"));

				employees.add(employee);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return employees;

	}
	
	public static List<String> getCountry(){
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<String> country = new ArrayList<>();
	
		try {
			con = DBUtil.getDataSource().getConnection();
			ps = con.prepareStatement("select * from address");
			rs = ps.executeQuery();

			while (rs.next()) {
				country.add(rs.getString("country"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return country;
		
		
	}
}
