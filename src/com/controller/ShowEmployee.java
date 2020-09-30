package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbcon.DBUtil;
import com.model.Employee;
import com.service.EmployeeService;

@WebServlet("/ShowEmployee")
public class ShowEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShowEmployee() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Employee> employees = EmployeeService.showAllEmployees();
		if (employees.size() > 0) {
			request.setAttribute("employees", employees);
			RequestDispatcher rd = request.getRequestDispatcher("employeeList.jsp");
			if (rd != null) {

				rd.forward(request, response);

			}
		} else {
			request.setAttribute("msg", "Employee Not Found First Add Employee");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			if (rd != null) {

				rd.forward(request, response);

			}
		}

	}

}
