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
		public String getLeaveID(String LeaveID);
		
		//Get particular Leave from E_Leave table
		public ArrayList<E_Leave> getLeaveByID(String LeaveID);

		//Get All Leave from E_Leave table
		public ArrayList<E_Leave> getLeave();
		
		//Update an Leave in E_Leave table
		public void updateLeave(String LeaveID, E_Leave Leave);
		
		//Remove an Leave from E_Leave table
		public void removeLeave(String LeaveID);
		
		// Get Employee Name in E_Leave table
		public String getEmpoyeeName(String LeaveID);
}
