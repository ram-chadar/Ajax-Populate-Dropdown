package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Employee;
import com.preparemodel.PrepareModel;
import com.service.EmployeeService;
import com.validate.ValidateEmployee;

@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/EmpController")
public class EmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);

		if (action.equalsIgnoreCase("getbyid")) {

			String eid = request.getParameter("eid");
			Employee employee = EmployeeService.getById(eid);
			System.out.println("update " + employee);
		} else if (action.equalsIgnoreCase("listofemployee")) {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		System.out.println(action);
		if (action.equalsIgnoreCase("save")) {
			Employee employee = PrepareModel.prepareEmployee(request);
			boolean validate = ValidateEmployee.validate(employee);

			System.out.println("******" + employee);

			if (validate) {
				int result = EmployeeService.saveEmployee(employee);
				if (result > 0) {
					request.setAttribute("msg", "Data Added Successfully");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
					requestDispatcher.forward(request, response);
				} else {
					request.setAttribute("msg", "Something Wrong Data Not Added");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
					requestDispatcher.forward(request, response);
				}

			} else {
				request.setAttribute("msg", "Plz Fill All Feilds");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
				requestDispatcher.forward(request, response);
			}
		}

		

	}

}
