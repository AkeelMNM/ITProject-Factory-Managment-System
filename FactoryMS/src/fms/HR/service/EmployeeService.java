package fms.HR.service;

import java.util.ArrayList;

import com.fms.model.Employee;

/**
 * 
 * 
 * @author Akeel M.N.M
 * IT NO:IT19153414
 *
 */

public interface EmployeeService {
	
		//Add Employee for Employee table
		public void addEmployee(Employee Employee);
		
		//Get particular Employee from Employee table
		public ArrayList<Employee> getEmployeeByID(String EmployeeID);

		//Get All Employee from Employee table
		public ArrayList<Employee> getEmployee();
		
		//Update an Employee in Employee table
		public void updateEmployee(String EmployeeID, Employee Employee);
		
		//Remove an Employee from Employee table
		public void removeEmployee(String EmployeeID);
		
		// Get Employee Name in Employee table
		public String getEmployeeName(String EmployeeID);
	

}
