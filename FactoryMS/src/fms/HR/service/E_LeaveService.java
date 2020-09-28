package fms.HR.service;

import java.util.ArrayList;

import com.fms.model.E_Leave;;

/**
 * 
 * 
 * @author Akeel M.N.M
 * IT NO:IT19153414
 *
 */

public interface E_LeaveService {

	
		//Add Leave for E_Leave table
		public void addLeave(E_Leave Leave);
		
		//Get Leave ID in E_Leave table
		public String getLeaveID(String EmployeeID);
		
		//Get particular Employee Leaves from E_Leave table
		public ArrayList<E_Leave> getLeaveByID(String EmployeeID);
		
		//Get particular Employee LeaveID by Name from E_Leave table
		public String getLeaveIDByName(String EmployeeName);
		
		//Get Leaves by date from E_Leave table
		public ArrayList<E_Leave> getLeaveByDate(String date);

		//Get All Leave from E_Leave table
		public ArrayList<E_Leave> getLeave();
		
		//Update an Leave in E_Leave table
		public void updateLeave(String LeaveID, E_Leave Leave);
		
		//Remove an Leave from E_Leave table
		public void removeLeave(String LeaveID);
		
		// Get Employee Name in E_Leave table
		public String getEmpoyeeName(String LeaveID);
		
		//Get Employee ID in E_Leave Table
		public String getEmployeeID(String LeaveID);
		
		//Get particular Employee Month Leaves from E_Leave table
		public ArrayList<E_Leave> getEmpLeaveByMonth(String EmployeeName,String Month);
		
		//Get Leaves on particular Month Leaves from E_Leave table
		public ArrayList<E_Leave> getAllLeaveByMonth(String Month);
}
