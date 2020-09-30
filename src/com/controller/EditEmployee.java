package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Employee;
import com.service.EmployeeService;

/**
 * Servlet implementation class EditEmployee
 */
@WebServlet("/editEmployee")
public class EditEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditEmployee() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String eid=request.getParameter("eid");
		Employee employee=EmployeeService.getById(eid);
		System.out.println("update "+employee);
	}

}
